<!--
    @require "gooditem.less"
-->
{%extends file="home/widget/gooditem/gooditem.tpl"%}
{%block name="item_var"%}
{%$isTuan=1%}
{%/block%}
{%block name="item_price"%}
<div class="car-price-box">
    <p class="car-price-em">
        <em>
        {%$list.couponInfo.sellPrice%}元抵{%$list.group.curDiscount+$list.couponInfo.faceValue%}元
        </em>
        {%if $list.bargainType==2%}
        <span class="small-price">一猫价：{%$list.defemaoPrice|format_price%}</span>
        {%/if%}
    </p>
    <p class="car-price-p">
        {%if $list.fall>0%}
        <span class="mark-down">最高降{%$list.fall|format_price%}</span>
        {%/if%}
        {%if $list.group.groupNum>0%}
        <b class="car-group-num">{%$list.group.groupNum%}人报名</b>
        {%/if%}
    </p>
</div>
{%/block%}
{%block name="item_tags"%}
<div class="deals_tags">
<span class="yikou">巨惠购</span>
</div>
{%/block%}
