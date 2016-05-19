<!--
    @require "tuanitem.less"
-->
{%extends file="gmobile/widget/tuanitem/tuanitem.tpl"%}
{%block name="item_info"%}
    <div class="item-center">
        <h3 title="{%$list.goodsName%}">{%$list.goodsName%}</h3>
        <p class="products-desc" title="{%$list.description%}">{%$list.description%}</p>
    </div>
    <div class="item-bottom">
        <p class="tuan-date">活动时间：{%$list.group.tuanHuodongtime|date_format:'%Y-%m-%d'%}</p>
        <p class="tuan-num">已报名人数：{%$list.group.groupNum%}人</p>
        <div class="tuan-btn">立即报名</div>
    </div>
{%/block%}