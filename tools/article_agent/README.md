# 中医资讯采集 / 改写助手

给一个文章 URL → 自动抓正文（trafilatura）→ 用 DeepSeek 改写成 450~550 字资讯 →
输出可直接粘贴进米拓后台的 JSON / Markdown（标题、正文 HTML、关键词、描述、来源、来源链接、是否原创、标签）。

## 一、安装（只需一次）

```powershell
cd e:\project\chuanzhongyi\tools\article_agent
python -m pip install -r requirements.txt
```

## 二、选择服务商（可以不花钱）

用 `--provider` 一条参数切换，脚本走的是 OpenAI 兼容协议：

| provider | 费用 | 速度 | 说明 |
|---|---|---|---|
| `zhipu` | **免费** | `glm-4.5-flash` 约 85 秒 / `glm-4-flash` 约 20 秒 | 智谱，注册即用，**推荐** |
| `local` | **免费** | 很慢 | 本地 ollama，离线可用（见下方实测） |
| `deepseek` | 按量付费 | 秒级 | 需账户有余额 |
| `siliconflow` | 送额度 | 秒级 | 硅基流动 |
| `custom` | — | — | 配 `--base` + `--model` 指任意兼容接口 |

**智谱两个免费模型的实测对比**（同一篇文章，目标 500 字）：

| 模型 | 首轮字数 | 重试 | 照抄提示 | 耗时 | 结论 |
|---|---|---|---|---|---|
| `glm-4.5-flash` | 474 ✅ 一次到位 | 不需要 | 1 处 | 85s | **质量最好，默认用它** |
| `glm-4-flash` | 262 ❌ 需重试一次 | 505 ✅ | 3~6 处 | 20s | 快，但原创性弱 |

注意 `glm-4.5-flash` 是**思考型模型**：它会先"想"再"写"，token 预算给小了正文会被截断。
脚本已按服务商给足上限（智谱 8192），并新增「截断检查」——小节结尾不是句末标点会报警。

### 路线 1：智谱 GLM-4-Flash（免费，最快）

1. 打开 `https://open.bigmodel.cn` 注册（手机号即可，不用充值）
2. 控制台 → API Keys → 新建，复制密钥
3. 填进 `config.local.json` 的 `keys.zhipu_api_key`，并把 `provider` 改成 `zhipu`
4. 跑：`python article_agent.py --url "..." --provider zhipu`

### 路线 2：本地 ollama（完全离线免费）

```powershell
ollama list                    # 看已装模型
ollama serve                   # 如未启动
ollama pull qwen2.5:7b         # 建议换小模型（约 4.7GB），比 20GB 大模型快数倍
python article_agent.py --url "..." --provider local
```

`local` 预设已自动处理三件事：关闭 Qwen3 思考链（`/no_think`）、不发送 ollama 不支持的
`json_object`、超时放宽到 2 小时。

⚠️ **本机实测结论（2026-09-20）**：用已有的 `qwen3.6:latest`（23GB，纯 CPU、无独显）测试
**失败** —— 速度仅 1.47 tokens/秒，且思考链没能关闭，8192 个 token 全被"思考"吃光，
最终返回空内容。**建议不要在这台机器上用 20GB 级模型**；要用就先 `ollama pull qwen2.5:7b`
或更小的模型，或改用下面的智谱免费模型。

### 路线 3：不调用大模型

```powershell
python article_agent.py --url "..." --dry-run
```

只抓正文并存到 `output/*.source.txt`，人工改写成稿——完全不花钱，只是要动手。

## 三、配置密钥（二选一）

**方式 A：本地配置文件（推荐，一次配好一直用）**

`config.local.json` 已加入 `.gitignore`，不会提交到版本库：

```json
{
  "provider": "zhipu",
  "keys": {
    "deepseek_api_key": "sk-你的DeepSeek密钥",
    "zhipu_api_key": "你的智谱密钥",
    "siliconflow_api_key": "",
    "ollama_api_key": "ollama"
  },
  "providers": {
    "local": { "model": "qwen3.6:latest", "base": "http://localhost:11434/v1" }
  }
}
```

**方式 B：环境变量（只对当前终端窗口有效）**

```powershell
$env:LLM_API_KEY="你的密钥"        # PowerShell
python article_agent.py --url "..." --provider zhipu
```

优先级：`--api-key` 参数 > `LLM_API_KEY` 环境变量 > `config.local.json`。

## 四、用法

```powershell
# 1) 先干跑：只抓取，不调用大模型（不花 token，先确认能不能抓到）
python article_agent.py --url "https://文章地址" --dry-run

# 2) 转载（默认）：标注来源与原文链接
python article_agent.py --url "https://文章地址" --source-name "健康时报"

# 3) 原创：不输出转载链接，前台显示「作者：XXX」
python article_agent.py --url "https://文章地址" --original --source-name "张三"

# 4) 批量：多个 URL 用逗号分隔，可自定义输出目录
python article_agent.py --url "url1,url2,url3" --out "D:\workbuddy\drafts"
```

| 参数 | 说明 |
|---|---|
| `--url` | 文章网址，支持逗号分隔多个（与 `--file` 二选一） |
| `--file` | 本地文件（txt/html）：跳过抓取直接当原文，用于站点反爬抓不到时人工粘贴 |
| `--source-url` | 原文链接（配合 `--file`，用于转载标注与入库查重） |
| `--provider` | 服务商，默认 `deepseek`（也可写在配置文件里） |
| `--words` | 目标字数，默认 500（允许 ±12%） |
| `--source-name` | 来源名称，不填则由模型从原文判断 |
| `--original` | 标记原创（`is_original=1`，不输出转载链接） |
| `--tags` | 手动指定标签，逗号分隔（覆盖模型结果） |
| `--out` | 输出目录，默认 `output/` |
| `--api-key` / `--model` / `--base` | 覆盖服务商预设 |
| `--llm-timeout` | 大模型超时秒数，默认按服务商预设 |
| `--max-tokens` | 输出上限 tokens，默认按服务商（智谱/本地 8192，其它 4096） |
| `--push` | 生成后自动提交到站点入库接口，写入**草稿**等后台审核 |
| `--api-url` / `--api-token` | 入库接口地址与令牌（默认取 `config.local.json` 的 `site_api`） |
| `--class1` / `--class2` | 写入的栏目 id（默认取配置） |
| `--force` | 入库时跳过查重，强制新增 |
| `--dry-run` | 只抓取，不调用大模型 |
| `--no-footnote` | 不生成「本文根据 XX 整理」结尾 |
| `--timeout` | 抓取超时秒数，默认 30 |

## 四、输出

```
output/
  <时间戳>_<域名>.json        直接对应米拓后台字段，程序化入库用
  <时间戳>_<域名>.md          人工审阅用（元信息 + 正文预览 + ⚠️ 待核对项）
  <时间戳>_<域名>.source.txt  抓到的原文，留档便于比对
```

JSON 字段与后台对应关系：

| JSON | 米拓后台字段 |
|---|---|
| `title` | 标题 |
| `ctitle` | SEO 标题 |
| `keywords` | 关键词 |
| `description` | 描述（meta description） |
| `content_html` | 正文（直接粘进编辑器） |
| `publisher` | 来源 / 作者 |
| `source_url` | 来源链接 |
| `is_original` | 是否原创 |
| `tag` | 标签（`|` 分隔） |

## 五、自动质检

脚本会对生成结果做三项检查，结果写入 `.md` 的「需要人工核对」：

1. **字数**：超出 450~550 时自动让模型调整一次
2. **数字一致性**：输出中出现原文没有的数字 → 疑似幻觉，列出来
3. **照抄检查**：与原文连续重合 ≥16 字的地方 → 列出来，避免被判重复内容

## 六、抓取说明

三级兜底：`requests` → `trafilatura.fetch_url` → `Jina Reader`（`https://r.jina.ai/`）。

已知限制：
- 微信公众号、知乎、需登录或强反爬的站点通常抓不到 → 请人工复制正文
- Jina Reader 在国内网络经常连不上（SSL 报错），只作兜底
- 政府站部分域名在本地网络不通（如 `www.scio.gov.cn` 返回 502）

**每次都先跑 `--dry-run`**，确认抓到了正文再正式生成。

## 七、常见问题

**Q：报错「该站是 JS 反爬挑战页（加速乐类 __jsl_clearance）」怎么办？**

这类站点（不少政府站、部分新闻站）第一次请求返回 521 + 一段 JS，要求浏览器执行脚本拿到
`__jsl_clearance` cookie 再来。第一段挑战有工具能算，但第二段是重度混淆代码，**纯 HTTP 抓取
过不去**。三条出路，从省事到费事：

1. **换同一内容的转载镜像**（推荐）—— 发布会/政策稿几乎都会被转载，
   实测可抓的有：中国中医药网 `cntcm.com.cn`、国家中医药局 `natcm.gov.cn`、
   新浪、搜狐、中国网等
2. **人工复制正文 → `--file`**：浏览器能正常打开，把正文存成 txt（首行放标题），
   然后 `--file 正文.txt --source-url 原网址` 照常跑完改写与入库
3. 用浏览器渲染方案（Playwright/Selenium）—— 重，且无反爬绕过保证，一般不值得

**Q：报错里出现「502，长度 0」和「521」两条？**

说明本机有代理（`HTTP_PROXY`/系统代理），代理先返回 502，脚本自动改直连后又拿到站点的真实响应。
脚本已内置「代理失败自动直连重试」，日志里会同时打印两条，便于判断是网络问题还是站点拦截。

**Q：抓取一直超时？**

检查 `HTTP_PROXY` / `HTTPS_PROXY` 环境变量：如果代理节点访问某些站点不稳定，
可以临时清空让脚本直连 —— `$env:HTTP_PROXY=''; $env:HTTPS_PROXY=''`。

**Q：报错 401「令牌已过期或验证不正确」，但密钥明明是对的？**

密钥读错来源了。脚本按这个优先级取密钥：

```
--api-key  >  环境变量 LLM_API_KEY  >  当前服务商的专属环境变量  >  config.local.json  >  预设默认值
```

踩过的坑：系统里存在**用户级持久环境变量 `DEEPSEEK_API_KEY`**，早期版本会把它当成所有服务商的
密钥，于是拿 DeepSeek 的 key 去请求智谱 → 401。现已修正为「只认当前服务商的专属环境变量」，
并且每次运行都会打印密钥来源，方便核对：

```
[服务商] zhipu｜https://open.bigmodel.cn/api/paas/v4｜glm-4.5-flash（智谱 GLM-4-Flash，免费）
[参数] 目标 500 字｜输出上限 8192 tokens｜超时 300s
[密钥] 9a51dc***ornl（来源：config.local.json）
```

**Q：报错「模型返回空内容」？**

思考型模型把 token 预算全用在"想"上了。换非思考模型（如 `glm-4-flash`），或用
`--max-tokens 16384` 加大预算。

**Q：文字写到一半断了？**

同样是把 `max_tokens` 用完导致的。脚本的「截断检查」会提示「疑似被截断」，加大
`--max-tokens` 即可。

**Q：报告里提示"疑似连续照抄 16 字以上"怎么办？**

照抄检查是拿输出与原文做 16 字连续片段比对。原文越短（<800 字），重叠概率越高，
提示里往往包含机构名、日期这类无法改写的固定表述。看具体内容判断即可，不必逐条改。

**Q：字数总是不达标？**

提示词里已经给了**分节配额**（导语 X 字 + 3 节 × Y 字）。如果首轮偏短，脚本会自动让模型
调整一次（`--retry`，默认开）。若两轮都不达标，可适当放宽或收紧 `--words`。

## 八、入库：一条龙（贴 URL → 生成 → 后台审核发布）

> 数据库只有一个：接口用站点自带的 `config/config_db.php` 连接，**部署到线上就是连线上库**；
> 本地 XAMPP 跑读的也是同一份配置，连的是同一个库，写入结果完全一致。

### 8.1 部署到站点并配置令牌（只需一次）

接口文件 `tools/api_add_news.php` 随代码走，但**令牌配置文件不在版本库**，需在服务器上创建一次：

```bash
cd /站点目录/tools
cp api_add_news.config.example.php api_add_news.config.php
php -r "echo bin2hex(random_bytes(24));"     # 生成随机令牌，填进配置
vi api_add_news.config.php                    # 改 token；核对 class1/class2 栏目 id
```

再把同一个令牌填到本地 `tools/article_agent/config.local.json`：

```json
"site_api": {
  "url": "https://www.chuanzhongyi.com/tools/api_add_news.php",
  "token": "刚生成的那个令牌",
  "class1": 101,
  "class2": 106
}
```

自检（返回 `"code":0` 即通）：

```bash
curl -s -X POST https://www.chuanzhongyi.com/tools/api_add_news.php -d "token=令牌&action=ping"
```

**服务器还没部署时**，可以先用本机地址跑（两边是同一个库，写入效果相同）：

```powershell
python article_agent.py --url "..." --push --api-url "http://localhost/tools/api_add_news.php"
```

### 8.2 用法

```powershell
# 生成并直接写入后台草稿
python article_agent.py --url "https://文章地址" --source-name "中国中医药网" --push

# 指定栏目（107 = 药食同源）
python article_agent.py --url "..." --push --class2 107

# 跳过查重，强制新增
python article_agent.py --url "..." --push --force
```

### 8.3 接口做了什么

| 约束 | 说明 |
|---|---|
| **只写草稿** | `displaytype=0`（MetInfo 原生「待审核」）：不进前台列表、不进站点地图、不进站内搜索 |
| **防重复** | 按「规范化来源链接」+「标题」查重；命中返回 HTTP 409 与已有 id，不重复插入 |
| **栏目白名单** | 只允许写入配置里列出的栏目，防止写进别的模块 |
| **鉴权** | token 定时比较（`hash_equals`）+ 可选 IP 白名单 + 每小时写入上限（默认 60 篇） |
| **安全清洗** | 正文剥离 `<script>` / `onclick` / `javascript:`，只留白名单标签；标题等转义存储 |
| **全程留痕** | 每次调用（含鉴权失败、重复、限流）记一行 JSON 到 `tools/logs/api_add_news.log` |

### 8.4 两种草稿模式的取舍（均已实测）

| `draft_mode` | 前台列表 | 直链 URL | 后台位置 |
|---|---|---|---|
| `displaytype`（默认） | 不出现 | **能打开**（MetInfo 原生行为，`get_one_list_contents` 只拦 recycle） | 正常内容列表，直接编辑 |
| `recycle` | 不出现 | **打不开**（渲染 404 页） | 回收站，需先「还原」再编辑 |

介意「草稿被直链看到」就改 `recycle`；代价是每次审核前多一点还原操作。

### 8.5 接口参数速查

完整说明见 `tools/api_add_news.php` 头部注释。

| 参数 | 说明 |
|---|---|
| `token` | 必填，接口令牌 |
| `title` / `content_html` | 必填（标题 ≥4 字，清洗后正文 ≥100 字） |
| `ctitle` / `keywords` / `description` / `tag` / `publisher` / `source_url` / `is_original` | 选填 |
| `class1` / `class2` | 选填，必须在白名单内 |
| `force` | 跳过查重，强制新增 |
| `dry_run` | 只校验不写库 |
| `action=ping` | 健康检查：返回站点、栏目、内容总数/草稿数、限流状态 |

返回码：`0` 成功 · `1001` 已存在(HTTP 409) · `1002` 参数错(400) · `1003` 鉴权失败(403) · `1004` 超限(429) · `1005` 服务端错(500)

### 8.6 安全建议（上线后建议收紧一层）

接口上线后即对公网开放（当前只靠 token 防护），建议任选其一收紧：

| 做法 | 改哪里 | 效果 |
|---|---|---|
| IP 白名单（推荐） | `tools/api_add_news.config.php` 的 `ip_allow` 填允许的来源 IP | 只有这些 IP 能调用 |
| 只允许本机 | `tools/.htaccess` 里 `Require all granted` → `Require local` | 公网／局域网都调不到 |
| 降频 | `rate_per_hour`（默认 60 篇/小时） | 万一带 token 泄露，损失可控 |

三项互不冲突，可以叠加；token 本身也建议定期更换（改完同步更新 `config.local.json`）。

## 九、注意事项

- **密钥不要提交**：`config.local.json` 已 gitignore；脚本里没有任何硬编码密钥
- 本目录含 `.htaccess`（`Require all denied`），防止通过网站访问到脚本
- 转载内容请注明来源、控制转载比例，AI 生成内容按国内规定需保留 AI 标识
- 建议流程：脚本生成 → 人工审阅 `.md`（看「待核对」）→ 粘贴进后台 → 发布
