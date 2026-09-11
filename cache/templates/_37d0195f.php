<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<button type="button" class="btn btn-outline-666" table-addlist="<?php echo $table_addlist;?>"   <?php if($table_newid){ ?>data-table-newid='1'<?php } ?>><?php echo $word['add'];?></button>