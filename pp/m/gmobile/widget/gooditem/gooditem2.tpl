<!--
    @require "gooditem.less"
-->
{%extends file="gmobile/widget/gooditem/gooditem.tpl"%}
{%block name="item_price"%}
<div class="car-price-box">
    <em class="car-price-em">{%$list.couponInfo.sellPrice%}元抵{%$list.couponInfo.faceValue%}元</em>
</div>
{%/block%}
{%block name="item_tags"%}
<div class="car-posbox car-quan">
    抵扣券
</div>
{%/block%}
