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
{%/block%}
{%block name="tuan_price"%}

    <div class="car-quan-price">
        抵扣券：<em>{%$tplData.coupon.sellPrice%}元</em><br />
        <span class="car-dikou">到店抵扣
            <span class="font-red">
                <span class="priceAdd" price="{%$tplData.coupon.faceValue%}"
                      add="{%$carInfo.__groupGood.__coupdiscount%}">
                    {%$carInfo.__groupGood.__coupdiscount+$tplData.coupon.faceValue%}
                </span>元
            </span>
            现金
        </span>
    </div>
    <div class="emao-price-info">
        {%if $carInfo.bargainType==2%}
            <span class="padr10">一猫价：
                <span class="fullprice">
                {%$emaoprice|format_price%}
                </span>
            </span>
            <span class="car-dikou line-through">（厂商指导价：
                 <span class="guidePrice">
                {%$carInfo.defPrice%}
                 </span>
                万）
            </span>
        {%else%}
        <span class="car-dikou">厂商指导价：
             <span class="guidePrice">
            {%$carInfo.defPrice%}
             </span>
            万
        </span>
        {%/if%}
    </div>

{%/block%}
{%block name="info_di"%}
    {%$gift=$tplData.autoDeposit[0].giftInfo%}
    {%if $gift.name%}
        <dl class="dl-gift borderBt box" >
            <dt class="center">一猫赠品</dt>
            <dd class="no-bg flex1 center-v">
            <span class="gift"><span class="gift-desc">{%$gift.name%}</span></span>
            </dd>
        </dl>
    {%/if%}
{%/block%}
{%block name="info_payType"%}
{%/block%}

