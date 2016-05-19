<!--
    @require "tuanitem.less"
-->
{%extends file="home/widget/tuanitem/homeitem.tpl"%}
{%block name="item_info"%}
<div class="item-bottom">
    <p class="tuan-date">活动时间：{%$list.group.tuanHuodongtime|date_format:'%Y-%m-%d'%}</p>
    <p class="tuan-num">已报名：{%$list.group.groupNum%}人</p>
    <div class="tuan-btn">立即报名</div>
</div>
{%/block%}