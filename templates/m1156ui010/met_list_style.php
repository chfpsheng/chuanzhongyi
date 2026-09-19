<?php defined('IN_MET') or exit('No permission'); ?>
<style>
.met-card-list.met-content{background:#fafafa;position:relative;background-position:top center;background-size:100% auto;word-break:break-all;overflow:hidden;padding:30px 0}
.met-card-list .met-img ul{margin:40px -25px 0 -25px}
.met-card-list .met-img ul:after{display:block;clear:both;content:''}
.met-card-list .met-img:after{display:block;content:'';clear:both}
.met-card-list .parent-slide{float:left;list-style:none}
.met-card-list .parent-slide a{display:block;background:#ffffff;position:relative;text-align:left;padding:0;overflow:hidden;cursor:pointer}
.met-card-list .parent-slide a span{display:block;padding:0;overflow:hidden}
.met-card-list .parent-slide a img{max-width:100%;display:block;margin:0 auto;transition:.3s;-moz-transition:.3s;-ms-transition:.3s;-o-transition:.3s;-webkit-transition:.3s}
.met-card-list .parent-slide a:hover img{transform:scale(1.1);-moz-transform:scale(1.1);-ms-transform:scale(1.1);-webkit-transform:scale(1.1);-o-transform:scale(1.1)}
.met-card-list .parent-slide a h4{display:block;font-size:18px;font-weight:normal;margin:25px 20px 0 20px;color:#333333}
.met-card-list .parent-slide a h4.on{padding:12px 20px;margin:0;text-align:center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;transition:.3s;-moz-transition:.3s;-ms-transition:.3s;-o-transition:.3s;-webkit-transition:.3s}
.met-card-list .parent-slide a:hover h4.on{background:#73C4E3;color:#ffffff}
.met-card-list .met_pager{margin:0;text-align:center}
.met-card-list .met_pager .PageText,.met-card-list .met_pager input{display:none}
.met-card-list .met_pager a,.met-card-list .met_pager span{display:inline-block;padding:0 10px;margin:1px;font-size:16px;min-width:40px;height:40px;line-height:40px;text-align:center;background:#ffffff;color:#333333;transition:.3s;-moz-transition:.3s;-ms-transition:.3s;-o-transition:.3s;-webkit-transition:.3s}
.met-card-list .met_pager span{cursor:no-drop}
.met-card-list .met_pager a:hover,.met-card-list .met_pager a.Ahover,.met-card-list .met_pager span:hover{background:#73C4E3;color:#ffffff}
@media (min-width:992px){.met-card-list.met-content{padding:50px 0}}
@media (max-width:1199px){.met-card-list .met-img ul{margin:30px -15px 0 -15px}}
@media (max-width:767px){.met-card-list .met-img ul{margin:15px -7.5px 0 -7.5px}.met-card-list .parent-slide{padding:0 7.5px}}
</style>
