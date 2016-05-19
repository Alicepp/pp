{%extends file="gmall/widget/page/detail/info/info.tpl"%}
{%block name="info_top"%}
<div class="car-price-box">
    <div class="car-price car-price2">
        <div class="car-top">
        <span class="price-lit">抵扣券：</span>
        <span class="mao-price dikouprice">{%$tplData.coupon.sellPrice%}元</span>
        <span class="span-di">抵</span>
        <span class="mao-price car-kuan">{%$tplData.coupon.faceValue|format_price%}</span>
        </div>

        <div class="car-bot">
            {%if $carInfo.bargainType==2%}
            <span>一猫价：</span>
            <span class="mao-price emaoprice">{%$emaoprice|format_price%}</span>
            <span class="shi-price line-through">指导价：<span class="guidePrice">{%$carInfo.defPrice%}</span>万</span>
            {%else%}
            <span class="shi-price ">指导价：<span class="guidePrice">{%$carInfo.defPrice%}</span>万</span>
            {%/if%}
        </div>
    </div>
    {%if $carInfo.sellType!=4%}
    <div class="time-box">
        <div class="end-time"><i></i>剩余时间:<span class="time-txt" nowTime="{%$smarty.now|date_format:'%Y/%m/%d,%H:%M:%S'%}" endTime="{%$carInfo.formatEndSellTime%}"></span></div>
    </div>
    {%/if%}
</div>
{%/block%}
{%block name="info_input"%}
<input type="hidden" name="color" value=""/>
<input type="hidden" name="gId" value="{%$carInfo.id%}"/>
<input type="hidden" name="gType" value="1"/>
<input type="hidden" name="formhash" value="{%$tplData.formHash%}"/>
<input type="hidden" name="depositId" value="0" />
{%/block%}
{%block name="info_shou"%}
<dl class="shou-quan">
    <dt>抵扣券说明：</dt>
    <dd>
        <p class="col">{%$tplData.coupon.couponDesc%}</p>
    </dd>
</dl>
{%/block%}
{%block name="info_payType"%}
{%/block%}
{%block name="info_group"%}
{%/block%}
{%block name="info_group_btns"%}
{%/block%}