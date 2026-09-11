<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$submit_text=$submit_text?$submit_text:$word['Submit'];
?>
<tfoot>
	<tr class="text-wrap">
		<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<th data-table-columnclass="text-center" width="20">
	<div class="custom-control custom-checkbox">
		<input class="checkall-all custom-control-input" type="checkbox">
		<label class="custom-control-label"></label>
	</div>
</th>
		<th colspan="<?php echo $colspan;?>" data-no_column_defs>
			  <?php if(!$foot_save_no){ ?><button type="submit" class='btn btn-primary px-4'   <?php if($foot_submit_type){ ?>data-submit_type="<?php echo $foot_submit_type;?>"<?php } ?>   <?php if($foot_submit_url){ ?>data-url="<?php echo $foot_submit_url;?>"<?php } ?>><?php echo $submit_text;?></button><?php } ?>
