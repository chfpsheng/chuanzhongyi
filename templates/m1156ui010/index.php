<?php defined('IN_MET') or exit('No permission'); ?>
<include file="head.php" page="index"/>
<ui name="column_list" style="met_m1156_7" id="2" />
<ui name="show_list" style="met_m1156_7" id="3" />
<ui name="product_list" style="met_m1156_7" id="4" />
<ui name="img_list" style="met_m1156_7" id="5" />
<ui name="news_list" style="met_m1156_7" id="6" />
<ui name="case_list" style="met_m1156_7" id="7" />
<ui name="feedback_list" style="met_m1156_7" id="8" />
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "{$c.met_webname}",
  "url": "{$_M['url']['web_site']}",
  "logo": "{$_M['url']['web_site']}{$c.met_logo}"
}
</script>

<include file="foot.php" />