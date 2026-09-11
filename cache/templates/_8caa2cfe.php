<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
if (is_array($data) && is_array($data['handle'])) {
    $data = array_merge($data, $data['handle']);
    unset($data['handle']);
}
$data['page_type'] = $data['a'] == 'doeditor' ? 'details' : 'add';
?>
<form method="POST" action="<?php echo $url['own_name'];?>c=<?php echo $data['c'];?>&a=<?php echo $data['a'];?>save&id=<?php echo $data['list']['id'];?>&addtime_l=<?php echo $data['list']['addtime'];?>&no_order=<?php echo $data['list']['no_order'];?>" class='<?php echo $data['n'];?>-<?php echo $data['page_type'];?>-form' data-validate_order=".<?php echo $data['n'];?>-<?php echo $data['page_type'];?>-form" data-submit-ajax='1' enctype="multipart/form-data">
	<div class="metadmin-fmbx">
		  <?php if($data['displayimgs']){ ?><div hidden><?php } ?>
		<h3 class='example-title'><?php echo $word['upfiletips7'];?></h3>
		<dl>
			<dt>
				<label class='form-control-label'>
					<span class="text-danger">*</span>
					<?php echo $word['category'];?>
				</label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					  <?php if($data['n']=='product'){ ?>
					<div class="content-details-column">
						<select name="class" class="form-control mr-3 met-scrollbar scrollbar-grey" data-checked="<?php echo $data['list']['class1'];?>-<?php echo $data['list']['class2'];?>-<?php echo $data['list']['class3'];?><?php echo $data['list']['classother_str'];?>" required multiple data-fv-notEmpty-message="<?php echo $word['selectcolumn'];?>" style="min-height:250px;">
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

                $a = $val;
            ?>
							  <?php if($a['p']['value']){ ?>
							<option value="<?php echo $a['p']['value'];?>-0-0" class="text-wrap"><?php echo $a['p']['name'];?></option>
								  <?php if($a['c']){ ?>
								        <?php
            $sub = is_array($a['c']) ? count($a['c']) : 0;
            $cycleindex = 500;

            if(!is_array($a['c']) && $a['c']){
                $a['c'] = explode('|',$a['c']);
            }

            foreach ($a['c'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $b = $val;
            ?>
								  <?php if($b['n']['value']){ ?>
								<option value="<?php echo $a['p']['value'];?>-<?php echo $b['n']['value'];?>-0" class="text-wrap sub sub2   <?php if($b['_index']==1){ ?>first<?php } ?>"><?php echo $b['n']['name'];?></option>
									  <?php if($b['a']){ ?>
									        <?php
            $sub = is_array($b['a']) ? count($b['a']) : 0;
            $cycleindex = 500;

            if(!is_array($b['a']) && $b['a']){
                $b['a'] = explode('|',$b['a']);
            }

            foreach ($b['a'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $d = $val;
            ?>
									  <?php if($d['s']['value']){ ?>
									<option value="<?php echo $a['p']['value'];?>-<?php echo $b['n']['value'];?>-<?php echo $d['s']['value'];?>" class="text-wrap sub sub3   <?php if($d['_index']==1){ ?>first<?php } ?>"><?php echo $d['s']['name'];?></option>
									<?php } ?>
									<?php }?>
									<?php } ?>
								<?php } ?>
								<?php }?>
								<?php } ?>
							<?php } ?>
							<?php }?>
						</select>
						<input type="hidden" name="class1" value="<?php echo $data['list']['class1'];?>">
						<input type="hidden" name="class2" value="<?php echo $data['list']['class2'];?>">
						<input type="hidden" name="class3" value="<?php echo $data['list']['class3'];?>">
						<input type="hidden" name="classother" value="<?php echo $data['list']['classother'];?>">
					</div>
					<?php }else{ ?>
					<?php
					!$data['list']['class1'] && $data['list']['class1']='';
					!$data['list']['class2'] && $data['list']['class2']='';
					!$data['list']['class3'] && $data['list']['class3']='';
					?>
					<div data-plugin='select-linkage' data-select-url="json" data-required="1" data-value_key="value" class="clearfix float-left mr-3 content-details-column">
						<textarea class="select-linkage-data" hidden><?php echo $data['columnlist_json'];?></textarea>
						<select name="class1" class="form-control mr-1 w-a prov" data-checked="<?php echo $data['list']['class1'];?>" required data-fv-notEmpty-message="<?php echo $word['selectcolumn'];?>"></select>
						<select name="class2" class="form-control mr-1 w-a city" data-checked="<?php echo $data['list']['class2'];?>" required data-fv-notEmpty-message="<?php echo $word['selectcolumn'];?>"></select>
						<select name="class3" class="form-control mr-1 w-a dist" data-checked="<?php echo $data['list']['class3'];?>" required data-fv-notEmpty-message="<?php echo $word['selectcolumn'];?>"></select>
					</div>
					<?php } ?>
                <a href="<?php echo $url['site_admin'];?>#/column" target="_blank" class="text-help"><?php echo $word['admin_colunmmanage_v6'];?></a>
    </div>
				  <?php if($data['n']=='product'){ ?>
				<span class="text-help"><?php echo $word['tips12_v6'];?></span>
				<?php } ?>
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'>
					<span class="text-danger">*</span>
					  <?php if($data['n']=='news'){ ?><?php echo $word['articletitle'];?><?php }else if($data['n']=='product'){ ?><?php echo $word['titletips'];?><?php }else{ ?><?php echo $word['title'];?><?php } ?>
				</label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<input type="text" name="title" value="<?php echo $data['list']['title'];?>" required class="form-control">
				</div>
				<div class="clearfix">
					<span class="text-help text-content float-left"><?php echo $word['text_size'];?><?php echo $word['marks'];?></span>
					<input type="text" name="text_size" value="<?php echo $data['list']['text_size'];?>" data-plugin="select-fontsize" class="form-control d-inline-block mr-2" style="width:100px;">
					<span class="text-help text-content float-left"><?php echo $word['text_color'];?><?php echo $word['marks'];?></span>
					<input type="text" name="text_color" value="<?php echo $data['list']['text_color'];?>" data-plugin="minicolors" class="form-control w-a d-inline-block">
					<span class="text-help ml-2"><?php echo $word['content_style_tips'];?></span>
				</div>
			</dd>
		</dl>