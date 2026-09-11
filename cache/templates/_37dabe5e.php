<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$editor['title']=$editor['title']?$editor['title']:$word['contentdetail'];
$editor['name']=$editor['name']?$editor['name']:'content';
$editor['marks']=isset($editor['marks'])?$editor['marks']:1;
$editor['value']=$editor['value']?$editor['value']:($data['list']?$data['list']['content']:'');
if($data['list']){
	$data['classnow']=intval($data['list']['class3'])?$data['list']['class3']:(intval($data['list']['class2'])?$data['list']['class2']:$data['list']['class1']);
}
$editor['value']=htmlspecialchars($editor['value']);
?>
  <?php if(!$editor['no_title']){ ?>
<h3 class='example-title'><?php echo $editor['title'];?>  <?php if($editor['marks']){ ?><?php echo $word['marks'];?><?php } ?>  <?php if($data['n']=='about'){ ?><a href="<?php echo $url['site_admin'];?>#/column" target="_blank" class="text-help ml-2"><?php echo $word['admin_colunmmanage_v6'];?></a><?php } ?></h3>
<?php } ?>
<dl>
	  <?php if($editor['dt']){ ?>
	<dt>
		<label class='form-control-label'><?php echo $editor['dt'];?>  <?php if($editor['marks']){ ?><?php echo $word['marks'];?><?php } ?></label>
	</dt>
	<?php } ?>
	<dd class='clearfix'>
		  <?php if($data['n']=='product'){ ?>
		<?php
		$checkbox_time=time();
		for ($i = 1; $i < 5; $i++) {
			$product_content[]=array(
				'value'=>$data['list']['content'.$i]
			);
		}
		?>
		<div class="nav nav-underline product-details-navtab position-relative" data-url="<?php echo $url['own_name'];?>c=product_admin&a=doGetColumnSeting">
			<a class="nav-link active" data-toggle="tab" href="#product-content-<?php echo $checkbox_time;?>"></a>
			        <?php
            $sub = is_array($product_content) ? count($product_content) : 0;
            $cycleindex = 50;

            if(!is_array($product_content) && $product_content){
                $product_content = explode('|',$product_content);
            }

            foreach ($product_content as $index => $val) {
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
			<?php $v['sort']=$v['_index']+1; ?>
			<a class="nav-link" data-toggle="tab" href="#product-content<?php echo $v['sort'];?>-<?php echo $checkbox_time;?>"></a>
			<?php }?>
			<button type="button" class="btn btn-outline-primary ml-2 position-absolute" style="right:0;top: 0;" data-toggle="modal" data-target=".product-details-tabset-modal" data-modal-url="ui_set/page_config/?n=column&c=index&a=doGetClassExtInfo&module=3&id=0&from=admin&classnow=<?php echo $data['classnow'];?>" data-modal-title="<?php echo $word['settings_tab'];?>" data-modal-style="z-index:1702;" data-modal-type="centered"><?php echo $word['settings_tab'];?></button>
		</div>
		<div class="tab-content mt-2 product-details-content hide">
			<div class="tab-pane fade show active" id="product-content-<?php echo $checkbox_time;?>">
				<textarea name="<?php echo $editor['name'];?>" data-plugin='editor' data-editor-y='  <?php if($editor['height']){ ?><?php echo $editor['height'];?><?php }else{ ?>500<?php } ?>' hidden></textarea>
				<script>`<?php echo $editor['value'];?>`;</script>
			</div>
			        <?php
            $sub = is_array($product_content) ? count($product_content) : 0;
            $cycleindex = 50;

            if(!is_array($product_content) && $product_content){
                $product_content = explode('|',$product_content);
            }

            foreach ($product_content as $index => $val) {
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
			<?php
			$v['sort']=$v['_index']+1;
			$v['value']=htmlspecialchars($v['value']);
			?>
			<div class="tab-pane fade" id="product-content<?php echo $v['sort'];?>-<?php echo $checkbox_time;?>">
				<textarea name="content<?php echo $v['sort'];?>" data-plugin='editor' data-editor-y='  <?php if($editor['height']){ ?><?php echo $editor['height'];?><?php }else{ ?>500<?php } ?>' hidden></textarea>
				<script>`<?php echo $v['value'];?>`;</script>
			</div>
			<?php }?>
		</div>
		<?php }else{ ?>
		<textarea name="<?php echo $editor['name'];?>" data-plugin='editor' data-editor-x="<?php echo $editor['width'];?>" data-editor-y='  <?php if($editor['height']){ ?><?php echo $editor['height'];?><?php }else{ ?>500<?php } ?>' hidden></textarea>
		<script>`<?php echo $editor['value'];?>`;</script>
		  <?php if($editor['tips']){ ?>
		<span class="text-help ml-2"><?php echo $editor['tips'];?></span>
		<?php } ?>
		<?php } ?>
	</dd>
</dl>
<?php unset($editor); ?>