<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$basic_js_time = filemtime(PATH_PUBLIC_THIRD.'admin/basic.js');
$metinfo_js_time = filemtime(PATH_PUBLIC_ADMIN.'js/metinfo.js');
$lang_json_admin_js_time = filemtime(PATH_WEB.'cache/lang_json_admin_'.$_M['lang'].'.js');
?>
</body>
<script>window.MET=<?php echo $data['met_para'];?>;</script>
<script src="<?php echo $url['site'];?>cache/lang_json_admin_<?php echo $_M['langset'];?>.js?<?php echo $lang_json_admin_js_time;?>"></script>
<script src="<?php echo $url['public_third'];?>admin/basic.js?<?php echo $basic_js_time;?>"></script>
<script src="<?php echo $url['public_admin'];?>js/metinfo.js?<?php echo $metinfo_js_time;?>"></script>
</html>