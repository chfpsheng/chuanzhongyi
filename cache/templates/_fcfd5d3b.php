<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<div class="content-relation-body">
    <div class="clearfix">
        <div data-plugin='select-linkage' data-select-url='<?php echo $url['adminurl'];?>n=relation&c=relation_admin&a=doGetClasslist' data-required="1" data-value_key="value" data-data_val_key="module" class="clearfix mr-3 float-left">
            <select name="class1" class="form-control mr-1 w-a prov float-left"></select>
            <select name="class2" class="form-control mr-1 w-a city float-left"></select>
            <select name="class3" class="form-control mr-1 w-a dist float-left"></select>
        </div>
        <div class="input-group w-a float-left">
            <input type="search" name="keyword" placeholder="搜索" class="form-control" data-table-search="#content-relation-list">
            <div class="input-group-append">
                <div class="input-group-text btn bg-none px-2"><i class="input-search-icon fa-search" aria-hidden="true"></i></div>
            </div>
        </div>
    </div>
    <form action="" method="post" data-content_info="<?php echo $data['module'];?>|<?php echo $data['content_id'];?>">
        <input type="hidden" name="classid" value="0" data-table-search="#content-relation-list">
        <table class="table table-hover dataTable w-100 mt-2" id="content-relation-list" data-ajaxurl="<?php echo $url['adminurl'];?>n=relation&c=relation_admin&a=doGetDatelist" data-plugin="checkAll" data-datatable_order="#content-relation-list">
            <thead>
                <tr>
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
                    <th><?php echo $word['title'];?></th>
                    <th data-table-columnclass="text-center"><?php echo $word['state'];?></th>
                    <th><?php echo $word['operate'];?></th>
                </tr>
            </thead>
            <tbody>
                <?php $colspan=3; ?>
                <?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<tr>
	<td colspan="<?php echo $colspan;?>">
		<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<div class="text-center py-5 <?php echo $loader_class;?>"><?php echo $word['fliptext2'];?></div>
<?php unset($loader_class); ?>
	</td>
</tr>
            </tbody>
            <?php
            $colspan = 3;
            $submit_text = $_M['word']['relation_add'];
            $foot_save_no=1;
            ?>
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

                    <button type="button" class="btn btn-light mr-1"><?php echo $word['relation_cancel'];?></button>
                    <button type="submit" class='btn btn-outline-666 px-4'><?php echo $submit_text;?></button>
                </th>
            </tfoot>
        </table>
    </form>
</div>