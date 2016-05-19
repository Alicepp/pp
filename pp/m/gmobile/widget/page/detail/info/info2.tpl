{%extends file="gmobile/widget/page/detail/info/info.tpl"%}
{%block name="info_var"%}
{%$emaoprice=$carInfo.defemaoPrice%}
{%$number=$color.number%}
{%/block%}
{%block name="info_input"%}
<input type="hidden" name="autoId" value="{%$goodInfo.autoId%}"/>
<input type="hidden" name="gType" value="1"/>
{%/block%}
{%block name="info_price"%}
<div class="line-box">
    {%if $carInfo.bargainType==2%}
    <div class="car-quan-price">抵扣券：<em>{%$tplData.coupon.sellPrice%}元</em><span class="car-dikou">到店抵扣<span class="font-red">{%$tplData.coupon.faceValue%}元</span>现金</span></div>
    <div class="emao-price-info">
    <span>一猫价：
        <span class="fullprice">
        {%$emaoprice|format_price%}
        </span>
    </span>
    <span class="zhidao-pad dikou-del">（厂商指导价：
         <span class="guidePrice">
        {%$carInfo.defPrice%}
         </span>
        万）
    </span>
    </div>
    {%else%}
    <div class="car-quan-price padr10">抵扣券：<em>{%$tplData.coupon.sellPrice%}元</em>
    <span class="car-dikou dikou-del">（厂商指导价：
        <span class="guidePrice">
        {%$carInfo.defPrice%}
        </span>
        万）
    </span>
    </div>
    <div class="emao-price-info">
    到店议价后再抵扣<span class="font-red">
    {%$tplData.coupon.faceValue%}
    元</span>现金
    </div>
    {%/if%}
</div>
{%/block%}
{%block name="info_di"%}
    {%$gift=$tplData.autoDeposit[0].giftInfo%}
    <dl class="dl-gift borderBt box" >
        <dt class="center">到店抵扣</dt>
        <dd class="no-bg flex1 center-v">
        {%$tplData.coupon.faceValue%}元 现金<br/>
        {%if $gift.name%}
        <span class="gift"><span class="gift-desc">{%$gift.name%}</span></span>
        {%/if%}
        </dd>
    </dl>
{%/block%}
{%block name="info_payType"%}
{%/block%}
{%block name="tuan_price"%}
{%/block%}
{%block name="tuan_progress"%}
{%/block%}
