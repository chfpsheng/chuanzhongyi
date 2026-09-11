<?php defined('IN_MET') or exit('No permission'); ?>
<include file="head.php" page="showactivity" />
<section class="met-content animsition">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 met-cons">
                <div class="met-shownews-header">
                    <h1>{$data.title}</h1>
                    <div class="info">
                        <span><i class="fa fa-calendar"></i>{$data.updatetime}</span>
                        <span><i class="icon wb-eye"></i>{$data.hits}</span>
                    </div>
                </div>
                <div class="met-editor lazyload clearfix">
                    <div class="editorlightgallery">{$data.content}</div>
                </div>
                <div class="met-shownews-footer"><pagination /></div>
            </div>
        </div>
    </div>
</section>
<include file="foot.php" />
