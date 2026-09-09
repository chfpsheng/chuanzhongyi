<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$url = HTTP_HOST;
?>
  <?php if($c['met_agents_metmsg']){ ?>
<div class="met-template-right position-absolute"></div>
<?php } ?>
<div class="content">
      <?php if($c['met_agents_metmsg']){ ?>
    <div class="met-tips" data-url="<?php echo $url;?>" data-templates_url="<?php echo $c['templates_url'];?>"></div>
    <?php } ?>
    <div class="met-template-list row">
    </div>
</div>