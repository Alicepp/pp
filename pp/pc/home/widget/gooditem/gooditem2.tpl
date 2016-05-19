<!--
    @require "gooditem.less"
-->
{%extends file="home/widget/gooditem/gooditem.tpl"%}
{%block name="item_price"%}
<div class="car-price-box">
    <p class="car-price-em">
        <em>
        {%$list.couponInfo.sellPrice|format_price%}抵{%$list.couponInfo.faceValue|format_price%}
        </em>
        {%if $list.bargainType==2%}
        <span class="small-price">一猫价:{%$list.defemaoPrice|format_price%}</span>
        {%$delCls="line-through"%}
        {%/if%}
    </p>
    <p class="car-price-p">
    {%if $list.fall>0%}
    <span class="mark-down">最高降{%$list.fall|format_price%}</span>
    {%/if%}
    <span class="small-price {%$delCls%}">指导价：{%$list.defPrice%}万</span>
    </p>
</div>
{%/block%}
{%block name="item_tags"%}
<div class="deals_tags">
    <span class="dikou">抵扣券</span>
</div>
{%/block%}

