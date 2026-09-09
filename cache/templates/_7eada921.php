<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
  <?php if($c['shopv2_goods_set']){ ?>
    <iframe src="<?php echo $url['adminurl'];?>n=product&c=product_admin&a=doindex&module=3&class1=<?php echo $data['class1'];?>&class2=<?php echo $data['class2'];?>&class3=<?php echo $data['class3'];?>&pageset=1&head_no=1" width="100%" style="height:calc(100vh - 182px);" frameborder="0">
<?php }else{ ?>
    <?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
if($data['handle']){
    $data = array_merge($data, $data['handle']);
    unset($data['handle']);
}
$btn_add_file = $btn_add_file ? $btn_add_file : 'edit';
$btn_add_text = $btn_add_text ? $btn_add_text : $word['addinfo'];
$table_order = $table_order ? $table_order : $data['module'] . '-list';
$class_name = $class_name ? $class_name : $data['module'] . '_admin';
$form_action = $form_action ? $form_action : $url['own_name'] . 'c=' . $class_name . '&a=dolistsave';
?>
<form method="POST" action="<?php echo $form_action;?>" data-submit-ajax='1'>
    <div class="clearfix">
          <?php if(!$head_add_none || $dragsort_ok){ ?>
            <div class="float-left">
                  <?php if(!$head_add_none){ ?>
                    <button type="button" class="btn btn-outline-666 btn-content-list-add" data-toggle="modal" data-target=".<?php echo $data['module'];?>-add-modal" data-modal-title="<?php echo $btn_add_text;?>" data-modal-size="xl" data-modal-url="<?php echo $data['module'];?>/<?php echo $btn_add_file;?>/?c=<?php echo $data['module'];?>_admin&a=doadd&class1=<?php echo $data['class1'];?>&class2=<?php echo $data['class2'];?>&class3=<?php echo $data['class3'];?>" data-modal-fullheight="1"><?php echo $btn_add_text;?></button>
                <?php } ?>
                  <?php if($dragsort_ok){ ?><font class="text-danger ml-2"><?php echo $word['admin_content_list1'];?></font><?php } ?>
            </div>
            <div class="float-right">
        <?php } ?>
          <?php if(!$head_column_none){ ?>
            <div data-plugin='select-linkage' data-select-url="json" data-required="1" data-value_key="value" class="d-inline-block mr-2 column-select">
                <textarea class="select-linkage-data" hidden><?php echo $data['columnlist_json'];?></textarea>
                <select name="class1" class="form-control float-left mr-1 w-a prov" data-checked="<?php echo $data['class1'];?>" data-table-search="#<?php echo $table_order;?>" data-table-noreset></select>
                <select name="class2" class="form-control float-left mr-1 w-a city" data-checked="<?php echo $data['class2'];?>" data-table-search="#<?php echo $table_order;?>" data-table-noreset></select>
                <select name="class3" class="form-control float-left mr-1 w-a dist" data-checked="<?php echo $data['class3'];?>" data-table-search="#<?php echo $table_order;?>" data-table-noreset></select>
            </div>
        <?php } ?>
          <?php if(!$head_search_none){ ?>
            <div class="input-group w-a   <?php if(!$head_add_none || $search_right){ ?>float-right<?php }else{ ?>float-left<?php } ?>   <?php if($search_right){ ?> content-list-search-right position-relative<?php } ?>">
                <input type="search" name="keyword" placeholder="<?php echo $word['search'];?>" class="form-control" data-table-search="#<?php echo $table_order;?>">
                <div class="input-group-append">
                    <div class="input-group-text btn bg-none px-2"><i class="input-search-icon fa-search" aria-hidden="true"></i></div>
                </div>
            </div>
        <?php } ?>
          <?php if(!$head_add_none || $dragsort_ok){ ?>
        </div>
        <?php } ?>
    </div>
    <?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$table_order = $table_order ? $table_order : $data['module'] . '-list';
$pagelength = $pagelength ? $pagelength : 20;
$class_name = $class_name ? $class_name : $data['module'] . '_admin';
$table_ajaxurl = $table_ajaxurl ? $table_ajaxurl : $url['own_name'] . 'c=' . $class_name . '&a=dojson_list';
$form_action = $form_action ? $form_action : $url['own_name'] . 'c=' . $class_name . '&a=dolistsave';
?>
<form method="POST" action="<?php echo $form_action;?>" data-submit-ajax='1'>
<table class="table table-hover dataTable w-100   <?php if(!$search_right){ ?>mt-2<?php } ?>" id="<?php echo $table_order;?>" data-ajaxurl="<?php echo $table_ajaxurl;?>" data-plugin="checkAll" data-datatable_order="#<?php echo $table_order;?>" data-table-pageLength="<?php echo $pagelength;?>">
	<thead>
		<tr>
<?php unset($form_action); ?>
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
            <th width="400"><?php echo $word['goods'];?></th>
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
        </tr>
    </thead>
    <tbody data-plugin="dragsort" data-dragsort_order="#content-sort-list">
        <?php $colspan=7; ?>
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
    <?php $colspan=6;$del_type=1; ?>
    <?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$lang_name=$_M['user']['langok'][$_M['lang']]['name'];
?>
<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$del_title=$del_title?$del_title:$word['delete_information'];
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

<button type="button" class="btn btn-light px-4   <?php if($del_type){ ?>btn-content-list-del<?php } ?>"
table-delete data-plugin="alertify" data-type='confirm' data-confirm-title='<?php echo $del_title;?>'
  <?php if($del_url){ ?>data-url="<?php echo $del_url;?>"<?php } ?>
data-head_title="确认删除" data-head_icon="fa-trash-o"
><?php echo $word['delete'];?></button>
					<div class="dropup navbar p-0 d-inline-block">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><?php echo $word['modistauts'];?></button>
						<div class="dropdown-menu contentlist-change-status">
							  <?php if($data['module']<>'job'){ ?>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="comok"><?php echo $word['recom'];?></a>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="comno"><?php echo $word['unrecom'];?></a>
							<div class="dropdown-divider"></div>
							<?php } ?>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="topok"><?php echo $word['top'];?></a>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="topno"><?php echo $word['untop'];?></a>
							<div class="dropdown-divider"></div>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="displayok"><?php echo $word['displaytype'];?></a>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="displayno"><?php echo $word['displaytype2'];?></a>
						</div>
					</div>
					  <?php if($data['module']<>'job'){ ?>
					<div class="dropup d-inline-block">
						<button type="button" class="btn btn-default dropdown-toggle" onClick="dropdownMenuPosition(this)" data-toggle="dropdown" data-submenu><?php echo $word['columnmove1'];?></button>
						<div class="dropdown-menu contentlist-move">
							<div class="dropdown-header font-weight-normal"><?php echo $word['admin_movetocolumn_v6'];?></div>
							<div class="dropdown-divider"></div>
							<?php $submit_type='move'; ?>
							<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
        <?php
            $sub = is_array($data['columnlist']) ? count($data['columnlist']) : 0;
            $cycleindex = 500;

            if(!is_array($data['columnlist']) && $data['columnlist']){
                $data['columnlist'] = explode('|',$data['columnlist']);
            }

            foreach ($data['columnlist'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $v = $val;
            ?>
  <?php if($v['p']['value']<>''){ ?>
  <?php if($v['c']){ ?>
<div class="dropdown dropright dropdown-submenu">
	<a href="javascript:;" class="dropdown-item px-3 dropdown-toggle" onClick="dropdownMenuPosition(this)" data-toggle="dropdown"><?php echo $v['p']['name'];?></a>
	<div class="dropdown-menu">
		        <?php
            $sub = is_array($v['c']) ? count($v['c']) : 0;
            $cycleindex = 500;

            if(!is_array($v['c']) && $v['c']){
                $v['c'] = explode('|',$v['c']);
            }

            foreach ($v['c'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $w = $val;
            ?>
		  <?php if($w['n']['value']<>''){ ?>
		  <?php if($w['a']){ ?>
		<div class="dropdown dropdown-submenu">
			<a href="javascript:;" class="dropdown-item px-3 dropdown-toggle" onClick="dropdownMenuPosition(this)" data-toggle="dropdown"><?php echo $w['n']['name'];?></a>
			<div class="dropdown-menu">
				        <?php
            $sub = is_array($w['a']) ? count($w['a']) : 0;
            $cycleindex = 500;

            if(!is_array($w['a']) && $w['a']){
                $w['a'] = explode('|',$w['a']);
            }

            foreach ($w['a'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $x = $val;
            ?>
				  <?php if($x['s']['value']<>''){ ?>
				<a href="javascript:;" class="dropdown-item px-3" table-delete data-submit_type="<?php echo $submit_type;?>" data-val="<?php echo $v['p']['value'];?>-<?php echo $w['n']['value'];?>-<?php echo $x['s']['value'];?>"><?php echo $x['s']['name'];?></a>
				<?php } ?>
				<?php }?>
			</div>
		</div>
		<?php }else{ ?>
		<a href="javascript:;" class="dropdown-item px-3" table-delete data-submit_type="<?php echo $submit_type;?>" data-val="<?php echo $v['p']['value'];?>-<?php echo $w['n']['value'];?>"><?php echo $w['n']['name'];?></a>
		<?php } ?>
		<?php } ?>
		<?php }?>
	</div>
</div>
<?php }else{ ?>
<a href="javascript:;" class="dropdown-item px-3" table-delete data-submit_type="<?php echo $submit_type;?>" data-val="<?php echo $v['p']['value'];?>"><?php echo $v['p']['name'];?></a>
<?php } ?>
<?php } ?>
<?php }?>
						</div>
					</div>
					<div class="dropup d-inline-block">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-submenu><?php echo $word['Copy'];?></button>
						<div class="dropdown-menu contentlist-copy-langlist">
							<div class="dropdown-header font-weight-normal"><?php echo $word['copyotherlang6'];?></div>
							<div class="dropdown-divider"></div>
							        <?php
            $sub = is_array($_M['user']['langok']) ? count($_M['user']['langok']) : 0;
            $cycleindex = 50;

            if(!is_array($_M['user']['langok']) && $_M['user']['langok']){
                $_M['user']['langok'] = explode('|',$_M['user']['langok']);
            }

            foreach ($_M['user']['langok'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $v = $val;
            ?>
							<a href="javascript:;" class="dropdown-item px-3" data-val="<?php echo $v['mark'];?>"><?php echo $v['name'];?></a>
							<?php }?>
						</div>
					</div>
					<div class="dropup d-inline-block hide contentlist-copy-list">
						<button type="button" class="btn btn-default dropdown-toggle" onClick="dropdownMenuPosition(this)" data-toggle="dropdown" data-submenu><?php echo $word['admin_copytocolumn_v6'];?></button>
						<div class="dropdown-menu contentlist-copy">
						</div>
					</div>
					<input type="hidden" name="tolang" value="<?php echo $_M['lang'];?>">
					<input type="hidden" name="module" value="<?php echo $data['module'];?>">
					<?php } ?>
				</th>
			</tr>
		</tfoot>
	</table>
</form>
<?php } ?>