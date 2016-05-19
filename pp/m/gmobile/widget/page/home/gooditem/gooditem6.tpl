{%extends file="gmobile/widget/page/home/gooditem/gooditem.tpl"%}
{%block name="item_price"%}
<div class="car-price-layer">
        <span>{%$list.couponInfo.sellPrice%}元</span>
        抵<span>{%$list.couponInfo.faceValue%}元</span>
</div>
{%/block%}
{%block name="item_tags"%}
<div class="car-posbox car-quan">
    抵扣券
</div>
{%/block%}
