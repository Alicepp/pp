<!--
    @require "gooditem.less"
-->
{%extends file="gmobile/widget/gooditem/gooditem.tpl"%}
{%block name="item_var"%}
{%$isTuan=1%}
{%/block%}
{%block name="item_price"%}
<div class="car-price-box">
    <em class="car-price-em">{%$list.couponInfo.sellPrice%}元抵{%$list.group.curDiscount+$list.couponInfo.faceValue%}元</em>
    {%if $list.bargainType==2%}
    <span class="small-price">一猫价：{%$list.defemaoPrice|format_price%}</span>
    {%/if%}
</div>
{%if $list.group.groupNum>0%}
<div class="car-group-num"><b>{%$list.group.groupNum%}人报名</b></div>
{%/if%}
{%/block%}
{%block name="item_tags"%}
<div class="car-posbox zhengche">
巨惠购
</div>
{%/block%}
