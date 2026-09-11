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