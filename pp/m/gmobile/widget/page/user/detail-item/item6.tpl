<!--
    @require "item.less"
-->
{%extends file="gmobile/widget/page/user/detail-item/item.tpl"%}
{%block name="item_price"%}
    {%if $tplData.orderInfo.bargainType==2%}
    <div class="detail-dl box">
        <div class="detail-dt">一 猫 价：</div>
        <em>{%$tplData.orderInfo.emaoPrice|format_price%}</em>
    </div>
    {%/if%}
    <div class="detail-dl box">
        <div class="detail-dt">厂商指导价：</div>
        <em>{%$tplData.orderInfo.guidePrice%}万</em>
    </div>
    <div class="detail-dl box">
        <div class="detail-dt">购车意向金：</div>
        <em>&nbsp;{%$tplData.orderInfo.couponSellPrice%}元</em>
    </div>

{%/block%}
{%block name="item_pay"%}
    <div class="detail-dl box">
        <div class="detail-dt">在线支付：</div>
        {%if $tplData.ticketInfo.ticketInfoRes.onlinenum%}
        <div class="flex1"><em>{%$tplData.orderInfo.price%}元</em>=<em>{%$tplData.orderInfo.couponSellPrice%}元</em>（意向金）-<em>{%$tplData.ticketInfo.ticketInfoRes.onlinePay%}元</em>（优惠券）</div>
        {%else%}
        <div class="flex1"><em>{%$tplData.orderInfo.couponSellPrice%}元</em></div>
        {%/if%}
    </div>
    <div class="detail-dl box">
        <div class="detail-dt">到店抵扣：</div>
        {%if $tplData.ticketInfo.ticketInfoRes.offlinenum%}
        <div class="flex1">共可抵扣<em>{%$tplData.group.offlineReduce%}元</em>=<em>{%$tplData.group.groupPrice%}元</em>（抵扣券）+<em>{%$tplData.ticketInfo.ticketInfoRes.offlinePay%}元</em>（优惠券）</div>
        {%else%}
        <div class="flex1"><em>{%$tplData.group.offlineReduce%}元</em></div>
        {%/if%}
    </div>
{%/block%}