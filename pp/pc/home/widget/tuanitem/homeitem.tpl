<!--
    @require "tuanitem.less"
-->
{%extends file="home/widget/tuanitem/tuanitem.tpl"%}
{%block name="item_var"%}
{%$itemCls="tuanitem-home"%}
{%/block%}
{%block name="item_img"%}
<div class="item-top">
    <img lazy-src="{%$list.mainImg%}" alt="一猫{%$list.goodsName%}实时价格"/>
</div>
{%/block%}
{%block name="item_info"%}
<div class="item-bottom">
    <p class="tuan-date">截止时间：{%$list.endSellTime|date_format:'%Y-%m-%d'%}</p>
    <p class="tuan-num">已购：{%$list.group.groupNum%}人</p>
    <div class="tuan-btn">立即抢购</div>
</div>
{%/block%}