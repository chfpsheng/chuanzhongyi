<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<th data-table-columnclass="text-center" width="50" data-order_info="hits|asc,desc"><?php echo $word['visitcount'];?></th>
<th data-table-columnclass="text-center" width="100" data-order_info="updatetime|asc,desc"><?php echo $word['updatetime'];?></th>
<th data-table-columnclass="text-center" width="100">
	<select class="form-control w-a d-inline-block" style="max-width: 100px;" name='search_type' data-table-search>
		<option value=''><?php echo $word['smstips64'];?></option>
		<option value='1'><?php echo $word['displaytype2'];?></option>
		<option value='2'><?php echo $word['recom'];?></option>
		<option value='3'><?php echo $word['top'];?></option>
		<option value='4'>草稿</option>
	</select>
</th>
<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<th data-table-columnclass="text-center" width="80"><?php echo $word['sort'];?><span role="button" class="ml-1" data-plugin="webuiPopover" data-trigger="hover" data-animation="pop" data-width="300" data-padding="0" data-content="<?php echo $word['article4'];?>"><i class="icon fa-question-circle-o text-primary h6 my-0"></i></span></th>
<th width="150"><?php echo $word['operate'];?></th>