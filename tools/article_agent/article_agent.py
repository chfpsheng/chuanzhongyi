#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
中医资讯采集 / 改写助手（trafilatura + DeepSeek）

作用：给一个文章 URL，自动抓正文 → 用 DeepSeek 改写成 450~550 字的资讯 →
      输出可直接粘进米拓后台的 JSON / Markdown（含标题、正文HTML、关键词、描述、
      来源名称、来源链接、是否原创、标签）。

常用命令：
    # 1) 只看抓取结果，不调用大模型（不需要 API Key，先确认能不能抓到）
    python article_agent.py --url "https://example.com/news/123.html" --dry-run

    # 2) 正常生成（转载，标注来源）
    set DEEPSEEK_API_KEY=sk-xxxxxx
    python article_agent.py --url "https://example.com/news/123.html" --source-name "健康时报"

    # 3) 原创（前台不显示转载链接），并手动指定标签
    python article_agent.py --url "..." --original --source-name "张三" --tags "长夏养生,健脾祛湿"

    # 4) 批量
    python article_agent.py --url "url1,url2" --out "D:/workbuddy/drafts"

服务商（--provider，也可在 config.local.json 里固定）：
    deepseek     官方 API，按量付费（有余额才可用）
    zhipu        智谱 GLM-4-Flash，**免费**
    local        本地 ollama，零成本、离线，但速度取决于机器
    siliconflow  硅基流动，注册送额度
    custom       完全自定义（配 --base / --model）

    例：python article_agent.py --url "..." --provider local

环境变量：
    LLM_API_KEY        接口密钥（--dry-run 时可省略）
    LLM_MODEL          模型名（默认用服务商预设）
    LLM_BASE           接口地址（默认用服务商预设）
    DEEPSEEK_API_KEY / DEEPSEEK_MODEL / DEEPSEEK_BASE  兼容旧写法
"""

import argparse
import json
import os
import re
import sys
import time
from datetime import datetime
from urllib.parse import urlparse

try:
    import requests
except ImportError:
    sys.exit("缺少依赖：请先执行  pip install -r requirements.txt")

try:
    import trafilatura
except ImportError:
    trafilatura = None  # 允许在没有 trafilatura 时用简易兜底

UA = ("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
      "(KHTML, like Gecko) Chrome/124.0 Safari/537.36")

DEFAULT_WORDS = 500
WORD_TOLERANCE = 0.12          # 字数允许偏差 ±12%
JINA_PREFIX = "https://r.jina.ai/"


# ---------------------------------------------------------------- 抓取

def fetch_html(url, timeout=30, verbose=True):
    """三级兜底抓取：requests → trafilatura.fetch_url → Jina Reader"""
    errors = []

    # 1) requests
    try:
        r = requests.get(url, headers={
            "User-Agent": UA,
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
            "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8",
        }, timeout=timeout)
        if r.status_code == 200 and len(r.content) > 500:
            r.encoding = r.apparent_encoding or r.encoding
            if verbose:
                print(f"  [抓取] requests 成功（{len(r.content)} 字节）")
            return r.text, url
        errors.append(f"requests 状态码 {r.status_code}，长度 {len(r.content)}")
    except Exception as e:  # noqa
        errors.append(f"requests 失败：{e}")

    # 2) trafilatura 自带抓取
    if trafilatura is not None:
        try:
            html = trafilatura.fetch_url(url)
            if html and len(html) > 500:
                if verbose:
                    print(f"  [抓取] trafilatura 成功（{len(html)} 字节）")
                return html, url
            errors.append("trafilatura 返回空")
        except Exception as e:  # noqa
            errors.append(f"trafilatura 失败：{e}")

    # 3) Jina Reader（可处理 JS 渲染 / 反爬，返回 markdown）
    try:
        jina_url = JINA_PREFIX + url
        r = requests.get(jina_url, headers={"User-Agent": UA}, timeout=timeout)
        if r.status_code == 200 and len(r.text) > 300:
            if verbose:
                print(f"  [抓取] Jina Reader 成功（{len(r.text)} 字节，markdown）")
            return r.text, jina_url
        errors.append(f"Jina Reader 状态码 {r.status_code}")
    except Exception as e:  # noqa
        errors.append(f"Jina Reader 失败：{e}")

    raise RuntimeError("抓取失败：\n    - " + "\n    - ".join(errors))


def strip_tags(html):
    """粗暴去标签（兜底用）"""
    html = re.sub(r"(?is)<(script|style|noscript)[^>]*>.*?</\1>", " ", html)
    text = re.sub(r"(?s)<[^>]+>", "\n", html)
    text = re.sub(r"&nbsp;?", " ", text)
    text = re.sub(r"&(amp|lt|gt|quot|#39);", " ", text)
    text = re.sub(r"[ \t\r\f\v]+", " ", text)
    text = re.sub(r"\n\s*\n+", "\n", text)
    return text.strip()


def extract_article(html, url, verbose=True):
    """抽取正文与元信息"""
    meta = {"title": "", "author": "", "date": "", "sitename": "",
            "hostname": urlparse(url).netloc}

    # Jina Reader 返回的是 markdown，直接用
    if url.startswith(JINA_PREFIX):
        text = re.sub(r"^Title:.*$", "", html, flags=re.M)
        text = re.sub(r"\n{3,}", "\n\n", text).strip()
        first = text.split("\n", 1)[0].strip("# ").strip()
        meta["title"] = first[:80]
        return meta, text

    if trafilatura is not None:
        try:
            raw = trafilatura.extract(
                html, url=url, output_format="json", with_metadata=True,
                include_comments=False, include_tables=False, favor_precision=True,
            )
            if raw:
                data = json.loads(raw)
                for k in ("title", "author", "date", "sitename"):
                    if data.get(k):
                        meta[k] = str(data[k]).strip()
                text = (data.get("text") or "").strip()
                if len(text) > 100:
                    if verbose:
                        print(f"  [抽取] trafilatura 正文 {len(text)} 字符")
                    return meta, text
        except Exception as e:  # noqa
            if verbose:
                print(f"  [抽取] trafilatura 解析异常：{e}")

    # 兜底
    if "<" in html:
        text = strip_tags(html)
        if not meta["title"]:
            m = re.search(r"(?is)<title[^>]*>(.*?)</title>", html)
            if m:
                meta["title"] = re.sub(r"\s+", " ", m.group(1)).strip()[:80]
    else:
        text = html
    if verbose:
        print(f"  [抽取] 使用兜底方式，正文 {len(text)} 字符")
    return meta, text.strip()


# ---------------------------------------------------------------- 提示词

SYSTEM_PROMPT = (
    "你是严谨的中医垂直站内容编辑，擅长把长文改写成结构化短资讯。"
    "你只使用给定原文中的事实，绝不添加原文没有的信息。"
)

USER_TEMPLATE = """请把下面这篇文章改写成一篇中文资讯，输出 JSON。

【原文标题】{src_title}
【原文正文】
{content}
【原文网址】{url}
【来源名称】{source_name}
【总字数要求】{low}~{high} 字（按去除空白后的字符数计算，含标点）
【结构配额】导语 {lead_low}~{lead_high} 字；正文 3 个小节，每节 {sec_low}~{sec_high} 字；要点 3 条，每条 12~20 字

要求：
1. 只保留原文事实。原文没写的内容一律不写，不要推测、不要用常识补全。
2. 原文中的数字、剂量、时间、机构名、人名、方剂名、药材名必须原样保留，不得改动或四舍五入。
3. 必须重新组织语言：拆散原句、改变句式与语序，禁止连续照抄原文超过 10 个字。
4. 必须写成 3 个 sections（每节一个独立小标题），把原文信息按主题归类进去。
   禁止把整篇塞进 1 节，也禁止写成 5 个以上的碎节；每节都要写够配额字数，这是总字数达标的关键。
5. 标题重写（不超过 20 字，不标题党）；另给 SEO 标题与 80~120 字的描述。
6. 面向四川/成都读者：仅当原文提到地域、季节、体质差异时，可在正文中用一句话说明适用性；原文没提就不写。
7. 不要输出你的思考过程，不要解释，不要反问。

只输出如下 JSON（不要加 markdown 代码块）：
{{
  "title": "重写后的标题（≤20字）",
  "ctitle": "SEO标题（≤30字）",
  "lead": "导语（{lead_low}~{lead_high}字，一句话概括）",
  "sections": [
    {{"h3": "小标题1（≤12字）", "text": "{sec_low}~{sec_high}字的段落"}},
    {{"h3": "小标题2（≤12字）", "text": "{sec_low}~{sec_high}字的段落"}},
    {{"h3": "小标题3（≤12字）", "text": "{sec_low}~{sec_high}字的段落"}}
  ],
  "points": ["要点1（12~20字）", "要点2", "要点3"],
  "keywords": ["关键词1", "关键词2", "关键词3"],
  "tags": ["标签1", "标签2", "标签3"],
  "description": "SEO描述（80~120字）",
  "source_name": "原文来源网站或机构名，判断不出就填空字符串"
}}
"""


def word_budget(words):
    """把目标字数拆成「导语 / 3 节正文 / 要点」的配额

    模型对「总字数」不敏感，但对「每节写多少字」很敏感；
    给出分节配额能显著改善字数达标率与排版均衡度。
    """
    lead = int(words * 0.14)
    points = int(words * 0.10)
    sec = max(60, (words - lead - points) // 3)
    return {
        "lead_low": int(lead * 0.85), "lead_high": int(lead * 1.15),
        "sec_low": int(sec * 0.9), "sec_high": int(sec * 1.1),
        "sec_avg": sec,
    }


def build_messages(meta, content, url, source_name, words):
    low = int(words * (1 - WORD_TOLERANCE))
    high = int(words * (1 + WORD_TOLERANCE))
    budget = word_budget(words)
    content = content[:12000]          # 控制输入长度，避免超 token
    user = USER_TEMPLATE.format(
        src_title=meta.get("title") or "(未取到)",
        content=content,
        url=url,
        source_name=source_name or "(未提供，请按原文判断)",
        words=words, low=low, high=high,
        lead_low=budget["lead_low"], lead_high=budget["lead_high"],
        sec_low=budget["sec_low"], sec_high=budget["sec_high"],
    )
    return [{"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user", "content": user}]


# ---------------------------------------------------------------- 大模型

# 服务商预设：一条 --provider 即可切换，不必记 base / model
PROVIDERS = {
    "deepseek": {
        "base": "https://api.deepseek.com",
        "model": "deepseek-chat",
        "key_field": "deepseek_api_key",
        "env": "DEEPSEEK_API_KEY",
        "json_mode": True,
        "llm_timeout": 300,
        "desc": "官方 API，按量付费",
    },
    "zhipu": {
        "base": "https://open.bigmodel.cn/api/paas/v4",
        "model": "glm-4-flash",
        "key_field": "zhipu_api_key",
        "env": "ZHIPU_API_KEY",
        "json_mode": True,
        "llm_timeout": 300,
        "desc": "智谱 GLM-4-Flash，免费",
    },
    "local": {
        "base": "http://localhost:11434/v1",
        "model": "qwen3.6:latest",
        "key_field": "ollama_api_key",
        "key_default": "ollama",     # ollama 不校验密钥，随便填
        "json_mode": False,          # ollama 多数模型不支持 json_object
        "no_think": True,            # Qwen3 系：关闭思考链，否则光思考就把 token 用光
        "llm_timeout": 7200,         # CPU 推理很慢，给足 2 小时
        "desc": "本地 ollama，零成本离线",
    },
    "siliconflow": {
        "base": "https://api.siliconflow.cn/v1",
        "model": "Qwen/Qwen2.5-7B-Instruct",
        "key_field": "siliconflow_api_key",
        "env": "SILICONFLOW_API_KEY",
        "json_mode": True,
        "llm_timeout": 300,
        "desc": "硅基流动，注册送额度",
    },
    "custom": {
        "base": "",
        "model": "",
        "key_field": "api_key",
        "env": "LLM_API_KEY",
        "json_mode": True,
        "llm_timeout": 300,
        "desc": "完全自定义",
    },
}

# 输出上限（tokens）：思考型模型要先"想"再"写"，预算给小了正文会被截断
DEFAULT_MAX_TOKENS = {
    "deepseek": 4096,
    "zhipu": 8192,
    "local": 8192,
    "siliconflow": 4096,
    "custom": 4096,
}


def call_llm(messages, api_key, model, base, timeout=300, temperature=0.3,
             json_mode=True, no_think=False, max_tokens=4096):
    """调用 OpenAI 兼容接口，DeepSeek / 智谱 / 硅基流动 / 本地 ollama 通用"""
    if no_think:
        messages = list(messages)
        for i, m in enumerate(messages):
            if m.get("role") == "system":
                messages[i] = dict(m, content=m["content"] + "\n\n/no_think")
                break

    url = base.rstrip("/") + "/chat/completions"
    payload = {
        "model": model,
        "messages": messages,
        "temperature": temperature,
        "max_tokens": max_tokens,
    }
    if json_mode:
        payload["response_format"] = {"type": "json_object"}

    r = requests.post(url, headers={
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json",
    }, json=payload, timeout=timeout)
    if r.status_code != 200:
        raise RuntimeError(f"大模型接口报错 {r.status_code}：{r.text[:300]}")
    data = r.json()
    text = data["choices"][0]["message"].get("content") or ""
    if not text.strip():
        raise RuntimeError("模型返回空内容（本地思考型模型常见：思考占满了 max_tokens）")
    usage = data.get("usage", {})
    try:
        result = json.loads(text)
    except json.JSONDecodeError:
        m = re.search(r"\{.*\}", text, re.S)
        if not m:
            raise RuntimeError("模型返回的不是 JSON：" + text[:200])
        result = json.loads(m.group(0))
    return result, usage


def call_deepseek(messages, api_key, model, base, timeout=180, temperature=0.3):
    """兼容旧调用的别名"""
    return call_llm(messages, api_key, model, base, timeout=timeout,
                    temperature=temperature)


# ---------------------------------------------------------------- 校验

def count_chars(text):
    """去除空白后的字符数（含标点），汉字数另计"""
    no_space = re.sub(r"\s+", "", text or "")
    han = len(re.findall(r"[\u4e00-\u9fff]", no_space))
    return len(no_space), han


def collect_body(result):
    parts = [result.get("lead", "")]
    for s in result.get("sections", []) or []:
        parts.append(s.get("h3", ""))
        parts.append(s.get("text", ""))
    parts.extend(result.get("points", []) or [])
    return "".join(parts)


def validate(result, source_text, words):
    """字数 + 数字一致性 + 照抄检查"""
    warnings = []
    body = collect_body(result)
    total, han = count_chars(body)
    low = int(words * (1 - WORD_TOLERANCE))
    high = int(words * (1 + WORD_TOLERANCE))
    if not (low <= total <= high):
        warnings.append(f"字数超出范围：{total} 字（目标 {low}~{high}）")

    # 数字一致性
    src_nums = set(re.findall(r"\d+(?:\.\d+)?", source_text))
    out_nums = set(re.findall(r"\d+(?:\.\d+)?", body))
    unknown = sorted(out_nums - src_nums, key=lambda x: (len(x), x))
    if unknown:
        warnings.append("出现原文没有的数字（请核对，可能是幻觉）：" + "、".join(unknown[:12]))

    # 照抄检查：输出中是否存在与原文重合的 ≥16 字连续片段
    src_flat = re.sub(r"\s+", "", source_text)
    copied = []
    for sent in re.split(r"[。！？；\n]", body):
        sent = re.sub(r"\s+", "", sent)
        if len(sent) < 16:
            continue
        for i in range(0, len(sent) - 16 + 1):
            if sent[i:i + 16] in src_flat:
                copied.append(sent[i:i + 16] + "…")
                break
    if copied:
        warnings.append(f"有 {len(copied)} 处疑似连续照抄 16 字以上：{copied[:3]}")

    # 截断检查：思考型模型可能把 token 预算耗尽，正文写到一半就断了
    for s in result.get("sections", []) or []:
        txt = str(s.get("text", "")).strip()
        if txt and txt[-1] not in "。！？”\"'）)…":
            warnings.append(
                f"疑似被截断（小节「{str(s.get('h3', ''))[:12]}」结尾不是句末标点）："
                f"…{txt[-20:]}")

    return {"chars": total, "han": han, "low": low, "high": high,
            "word_ok": low <= total <= high, "warnings": warnings}


# ---------------------------------------------------------------- 组装产物

def render_content_html(result, publisher, footnote=True):
    html = []
    lead = (result.get("lead") or "").strip()
    if lead:
        html.append(f"<p>{lead}</p>")
    for s in result.get("sections", []) or []:
        h3 = (s.get("h3") or "").strip()
        text = (s.get("text") or "").strip()
        if h3:
            html.append(f"<h3>{h3}</h3>")
        if text:
            html.append(f"<p>{text}</p>")
    points = [p for p in (result.get("points") or []) if str(p).strip()]
    if points:
        html.append("<h3>要点</h3>")
        html.append("<ul>" + "".join(f"<li>{p}</li>" for p in points) + "</ul>")
    if footnote and publisher:
        html.append(f"<p>本文根据{publisher}发布内容整理。</p>")
    return "\n\n".join(html)


def render_markdown(result, meta, url, publisher, words, is_original, chk, usage):
    lines = [f"# {result.get('title', '')}", ""]
    lines.append("## 元信息（用于米拓后台）")
    lines.append(f"- 标题：{result.get('title', '')}")
    lines.append(f"- SEO 标题：{result.get('ctitle', '')}")
    lines.append(f"- 关键词：{', '.join(result.get('keywords', []) or [])}")
    lines.append(f"- 标签：{'|'.join(result.get('tags', []) or [])}")
    lines.append(f"- 描述：{result.get('description', '')}")
    lines.append(f"- 来源 / 作者：{publisher}")
    lines.append(f"- 来源链接：{'' if is_original else url}")
    lines.append(f"- 是否原创：{'是' if is_original else '否'}")
    lines.append(f"- 原文标题：{meta.get('title', '')}")
    lines.append(f"- 正文字数：{chk['chars']} 字（汉字 {chk['han']}）")
    lines.append(f"- 模型用量：{usage}")
    if chk["warnings"]:
        lines.append("")
        lines.append("## ⚠️ 需要人工核对")
        for w in chk["warnings"]:
            lines.append(f"- {w}")
    lines.append("")
    lines.append("## 正文预览")
    lines.append("")
    lead = (result.get("lead") or "").strip()
    if lead:
        lines.append(f"**{lead}**")
        lines.append("")
    for s in result.get("sections", []) or []:
        if s.get("h3"):
            lines.append(f"### {s['h3']}")
        lines.append(str(s.get("text", "")))
        lines.append("")
    if result.get("points"):
        lines.append("### 要点")
        for p in result["points"]:
            lines.append(f"- {p}")
        lines.append("")
    lines.append(f"> 来源：{publisher}｜{url}")
    return "\n".join(lines)


def safe_name(url, title):
    host = urlparse(url).netloc.replace(":", "_")
    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"{stamp}_{host}"


# ---------------------------------------------------------------- 主流程

def run_one(url, args):
    print(f"\n=== 处理：{url}")
    html, used_url = fetch_html(url, timeout=args.timeout)
    meta, content = extract_article(html, used_url)

    if len(content) < 300:
        raise RuntimeError(f"正文过短（{len(content)} 字符），可能没抓到正文，请人工打开确认")

    print(f"  [原文] 标题：{meta.get('title') or '(未取到)'}")
    print(f"  [原文] 正文 {len(content)} 字符")

    if args.dry_run:
        out = args.out or os.path.join(os.path.dirname(os.path.abspath(__file__)), "output")
        os.makedirs(out, exist_ok=True)
        name = safe_name(url, meta.get("title"))
        with open(os.path.join(out, name + ".source.txt"), "w", encoding="utf-8") as f:
            f.write(f"URL: {url}\n标题: {meta.get('title','')}\n\n{content}")
        msgs = build_messages(meta, content, url, args.source_name, args.words)
        print("  [dry-run] 已保存原文到 output/*.source.txt，未调用大模型")
        print("  [dry-run] 将发送给模型的提示词长度：" + str(len(msgs[1]['content'])) + " 字符")
        return None

    if not args.api_key:
        raise RuntimeError(
            f"缺少 {args.provider} 的密钥：可设环境变量 LLM_API_KEY，"
            f"或写入 config.local.json 的 keys.{PROVIDERS[args.provider]['key_field']}")

    messages = build_messages(meta, content, url, args.source_name, args.words)
    print("  [模型] 正在生成…")
    t0 = time.time()
    result, usage = call_llm(messages, args.api_key, args.model, args.base,
                             timeout=args.llm_timeout, json_mode=args.json_mode,
                             no_think=args.no_think, max_tokens=args.max_tokens)
    print(f"  [模型] 完成，用时 {time.time() - t0:.1f}s")

    chk = validate(result, content, args.words)
    if not chk["word_ok"] and args.retry:
        print(f"  [校验] 字数 {chk['chars']} 不在 {chk['low']}~{chk['high']}，让模型调整一次…")
        budget = word_budget(args.words)
        direction = ("太短了：请把每节补充到配额字数，而不是新加小节"
                     if chk["chars"] < chk["low"]
                     else "太长了：请压缩每节，删掉重复表述，不要删掉原文事实")
        messages.append({"role": "assistant", "content": json.dumps(result, ensure_ascii=False)})
        messages.append({"role": "user", "content":
                         f"上面这版正文共 {chk['chars']} 字（不含空白），{direction}。"
                         f"重写后的结构必须是：导语 {budget['lead_low']}~{budget['lead_high']} 字"
                         f" + 3 个小节（每节 {budget['sec_low']}~{budget['sec_high']} 字）"
                         f"，全文字数落在 {chk['low']}~{chk['high']} 字。"
                         "事实与数字保持不变，禁止照抄原文，仍按原 JSON 结构返回，不要解释。"})
        result2, usage2 = call_llm(messages, args.api_key, args.model, args.base,
                                   timeout=args.llm_timeout, json_mode=args.json_mode,
                                   no_think=args.no_think, max_tokens=args.max_tokens)
        chk2 = validate(result2, content, args.words)
        if chk2["word_ok"] or abs(chk2["chars"] - args.words) < abs(chk["chars"] - args.words):
            result, chk, usage = result2, chk2, usage2

    # 来源名称：命令行 > 模型判断 > 站点名
    publisher = (args.source_name or result.get("source_name")
                 or meta.get("sitename") or meta.get("hostname") or "")
    publisher = str(publisher).strip()

    if args.tags:
        result["tags"] = [t.strip() for t in re.split(r"[,，|]", args.tags) if t.strip()]

    content_html = render_content_html(result, publisher, footnote=not args.no_footnote)

    data = {
        # 直接对应米拓后台字段
        "title": result.get("title", ""),
        "ctitle": result.get("ctitle", ""),
        "keywords": ",".join(result.get("keywords", []) or []),
        "description": result.get("description", ""),
        "content_html": content_html,
        "tag": "|".join(result.get("tags", []) or []),
        "publisher": publisher,
        "source_url": "" if args.original else url,
        "is_original": 1 if args.original else 0,
        # 参考信息
        "_meta": {
            "source_url": url,
            "source_title": meta.get("title", ""),
            "source_site": meta.get("sitename", ""),
            "source_date": meta.get("date", ""),
            "source_chars": len(content),
            "out_chars": chk["chars"],
            "out_han": chk["han"],
            "warnings": chk["warnings"],
            "usage": usage,
            "generated_at": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "model": args.model,
        },
    }

    out_dir = args.out or os.path.join(os.path.dirname(os.path.abspath(__file__)), "output")
    os.makedirs(out_dir, exist_ok=True)
    name = safe_name(url, result.get("title"))
    json_path = os.path.join(out_dir, name + ".json")
    md_path = os.path.join(out_dir, name + ".md")
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    with open(md_path, "w", encoding="utf-8") as f:
        f.write(render_markdown(result, meta, url, publisher, args.words,
                                args.original, chk, usage))

    print(f"  [输出] {json_path}")
    print(f"  [输出] {md_path}")
    print(f"  [结果] 标题：{data['title']}")
    print(f"  [结果] 字数：{chk['chars']}（目标 {chk['low']}~{chk['high']}）"
          f"{'✅' if chk['word_ok'] else '⚠️'}")
    if chk["warnings"]:
        for w in chk["warnings"]:
            print(f"  [⚠️] {w}")

    # 入库：把稿子以「草稿」形式写进站点，之后在后台审核发布
    if args.push:
        push_to_site(data, args, getattr(args, "_local_cfg", {}))

    return data


def push_to_site(data, args, local_cfg=None):
    """把生成的稿子提交到站点入库接口 tools/api_add_news.php（写入草稿）

    接口只写草稿（displaytype=0），并自带查重：同来源链接 / 同标题不会重复写入。
    """
    site = (local_cfg or {}).get("site_api") or {}
    url = args.api_url or site.get("url") or site.get("local_url") or ""
    token = args.api_token or site.get("token") or ""
    class1 = args.class1 or site.get("class1") or 0
    class2 = args.class2 or site.get("class2") or 0

    print("  [入库] 正在提交到站点…")
    if not token or not (url or site.get("local_url")):
        print("  [入库] ⚠️ 未配置接口地址或 token（在 config.local.json 里配置 site_api，"
              "或用 --api-url / --api-token 指定）")
        return None

    # 候选地址：命令行指定 > 线上 > 本机（线上接口未部署时自动降级到本机，两边同一个库）
    targets = []
    for t in ([args.api_url] if args.api_url else [site.get("url"), site.get("local_url")]):
        if t and t not in targets:
            targets.append(t)

    payload = {
        "token": token,
        "title": data.get("title", ""),
        "ctitle": data.get("ctitle", ""),
        "keywords": data.get("keywords", ""),
        "description": data.get("description", ""),
        "content_html": data.get("content_html", ""),
        "tag": data.get("tag", ""),
        "publisher": data.get("publisher", ""),
        "source_url": data.get("source_url", ""),
        "is_original": data.get("is_original", 0),
        "class1": class1,
        "class2": class2,
        "model": (data.get("_meta") or {}).get("model", ""),
    }
    if class2 == -1:
        payload["class2"] = 0
    if getattr(args, "force", False):
        payload["force"] = 1

    body, r, used, err = None, None, "", ""
    for i, target in enumerate(targets):
        more = i + 1 < len(targets)
        try:
            r = requests.post(target, data=payload, timeout=90)
            if r.status_code == 404 and more:
                err = "HTTP 404（该地址上还没有接口）"
                print(f"  [入库] {target} → {err}，改用备用地址…")
                continue
            body = r.json()
            used = target
            break
        except Exception as e:  # noqa
            err = str(e)
            if more:
                print(f"  [入库] {target} 不通（{err[:80]}），改用备用地址…")
                continue
    if body is None:
        print(f"  [入库] ⚠️ 提交失败：{err}")
        return None
    if used != targets[0]:
        print(f"  [入库] 实际使用备用地址：{used}")

    code = body.get("code")
    d = body.get("data") or {}
    if r.status_code == 200 and code == 0:
        print(f"  [入库] ✅ 已写入草稿，id={d.get('id')}（{d.get('draft')}）")
        print(f"  [入库] 后台编辑：{d.get('edit_url')}")
        print(f"  [入库] 审核列表：{d.get('review_url')}")
        return body
    if r.status_code == 409 and code == 1001:
        print(f"  [入库] ⏭ 已存在，未重复写入（id={d.get('id')}，"
              f"{'前台可见' if d.get('published') else '仍是草稿'}）")
        print(f"  [入库] 后台编辑：{d.get('edit_url')}")
        return body
    print(f"  [入库] ⚠️ 接口返回 HTTP {r.status_code}：{body.get('msg') or body}")
    return body


def load_local_config():
    """读取同目录下的 config.local.json（已在 .gitignore 中，不放版本库）"""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "config.local.json")
    if os.path.isfile(path):
        try:
            with open(path, encoding="utf-8") as f:
                return json.load(f)
        except Exception as e:  # noqa
            print(f"  [配置] config.local.json 读取失败：{e}")
    return {}


def main():
    local_cfg = load_local_config()
    ap = argparse.ArgumentParser(description="URL → 中医资讯稿（trafilatura + DeepSeek）")
    ap.add_argument("--url", required=True, help="文章网址，多个用逗号分隔")
    ap.add_argument("--words", type=int, default=DEFAULT_WORDS, help="目标字数，默认 500")
    ap.add_argument("--source-name", default="", help="来源名称，如“健康时报”")
    ap.add_argument("--original", action="store_true", help="标记为原创（不输出转载链接）")
    ap.add_argument("--tags", default="", help="手动指定标签，逗号分隔（覆盖模型结果）")
    ap.add_argument("--out", default="", help="输出目录，默认 tools/article_agent/output")
    ap.add_argument("--provider", default=os.environ.get("LLM_PROVIDER") or local_cfg.get("provider") or "deepseek",
                    choices=list(PROVIDERS.keys()),
                    help="服务商：deepseek / zhipu / local / siliconflow / custom")
    ap.add_argument("--api-key", default="", help="接口密钥（默认取环境变量或 config.local.json）")
    ap.add_argument("--model", default=os.environ.get("LLM_MODEL") or "", help="模型名（默认用服务商预设）")
    ap.add_argument("--base", default=os.environ.get("LLM_BASE") or "", help="接口地址（默认用服务商预设）")
    ap.add_argument("--llm-timeout", type=int, default=0, help="大模型超时秒数（默认用服务商预设）")
    ap.add_argument("--max-tokens", type=int, default=0, help="输出上限 tokens（默认按服务商）")
    ap.add_argument("--timeout", type=int, default=30, help="抓取超时秒数")
    ap.add_argument("--push", action="store_true",
                    help="生成后自动提交到站点入库接口，写入草稿（待后台审核）")
    ap.add_argument("--api-url", default="", help="入库接口地址（默认取 config.local.json 的 site_api.url）")
    ap.add_argument("--api-token", default="", help="入库接口 token（默认取 config.local.json 的 site_api.token）")
    ap.add_argument("--class1", type=int, default=0, help="写入的一级栏目 id（默认取配置）")
    ap.add_argument("--class2", type=int, default=0, help="写入的二级栏目 id（默认取配置）")
    ap.add_argument("--force", action="store_true", help="入库时跳过查重，强制新增")
    ap.add_argument("--dry-run", action="store_true", help="只抓取，不调用大模型")
    ap.add_argument("--retry", action="store_true", default=True, help="字数不合格时让模型调整一次")
    ap.add_argument("--no-footnote", action="store_true", help="不生成“本文根据XX整理”结尾")
    args = ap.parse_args()

    # ---- 服务商预设：命令行 > 环境变量 > config.local.json > 预设默认
    preset = PROVIDERS[args.provider]
    pcfg = (local_cfg.get("providers") or {}).get(args.provider) or {}
    keys = local_cfg.get("keys") or {}

    # 环境变量只认「当前服务商」的：否则会拿 DeepSeek 的密钥去请求智谱，直接 401
    env_base = os.environ.get("LLM_BASE", "")
    env_model = os.environ.get("LLM_MODEL", "")
    if args.provider == "deepseek":
        env_base = env_base or os.environ.get("DEEPSEEK_BASE", "")
        env_model = env_model or os.environ.get("DEEPSEEK_MODEL", "")
    cfg_base = local_cfg.get("base", "") if args.provider == "deepseek" else ""
    cfg_model = local_cfg.get("model", "") if args.provider == "deepseek" else ""

    if not args.base:
        args.base = env_base or pcfg.get("base") or cfg_base or preset["base"]
    if not args.model:
        args.model = env_model or pcfg.get("model") or cfg_model or preset["model"]

    key_src = "命令行参数"
    if not args.api_key:
        env_key_name = preset.get("env", "")
        env_key = os.environ.get(env_key_name, "") if env_key_name else ""
        for src, val in (("环境变量 LLM_API_KEY", os.environ.get("LLM_API_KEY", "")),
                         (f"环境变量 {env_key_name}" if env_key_name else "", env_key),
                         ("config.local.json", keys.get(preset["key_field"], "")),
                         ("config.local.json", local_cfg.get(preset["key_field"], "")),
                         ("服务商预设默认值", preset.get("key_default", ""))):
            if val:
                args.api_key, key_src = val, src
                break

    if not args.llm_timeout:
        args.llm_timeout = pcfg.get("llm_timeout") or preset["llm_timeout"]
    if not args.max_tokens:
        args.max_tokens = pcfg.get("max_tokens") or DEFAULT_MAX_TOKENS.get(args.provider, 4096)
    args.json_mode = pcfg.get("json_mode", preset["json_mode"])
    args.no_think = pcfg.get("no_think", preset.get("no_think", False))

    if not args.base or not args.model:
        ap.error("--provider custom 必须同时指定 --base 与 --model")

    print(f"[服务商] {args.provider}｜{args.base}｜{args.model}（{preset['desc']}）")
    print(f"[参数] 目标 {args.words} 字｜输出上限 {args.max_tokens} tokens｜超时 {args.llm_timeout}s")
    if args.api_key:
        masked = (args.api_key[:6] + "***" + args.api_key[-4:]
                  if len(args.api_key) > 12 else "***")
        print(f"[密钥] {masked}（来源：{key_src}）")
    if args.dry_run:
        print("[服务商] dry-run：只抓取，不调用大模型")

    args._local_cfg = local_cfg          # 供 --push 读取 site_api 配置
    urls = [u.strip() for u in re.split(r"[,，\s]+", args.url) if u.strip()]
    ok, fail = 0, 0
    for u in urls:
        try:
            run_one(u, args)
            ok += 1
        except Exception as e:  # noqa
            fail += 1
            print(f"  [失败] {u}\n    {e}")
    print(f"\n完成：成功 {ok} 篇，失败 {fail} 篇")


if __name__ == "__main__":
    main()
