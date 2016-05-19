<!--
    @require "item.less"
-->
{%extends file="gmobile/widget/page/user/list-item/item.tpl"%}
{%block name="info_tuanState"%}
{%/block%}
{%block name="info_text"%}
    <div class="dl box">
        <div class="dt">意向金：</div>
        <div class="dd">{%$orderInfo.couponSellPrice%}元</div>
    </div>
    <div class="dl box">
        <div class="dt">到店抵扣：</div>
        <div class="dd cor-hui"><em>{%$orderInfo.couponValue%}元</em></div>
    </div>
{%/block%}