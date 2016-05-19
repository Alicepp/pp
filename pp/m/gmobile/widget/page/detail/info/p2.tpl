<div class="mall-car">
    <div class="mall-car-info">
        <div class="info-time" >
                {%if $carInfo.__saleState==1%}
                <span class="txt-time">
                开售时间：<span class="time-out">
                    {%$carInfo.sellTime|date_format:'%Y-%m-%d'%}
                    {%$carInfo.sellTime|date_format:'%H:%M'%}
                    </span>
                {%elseif $carInfo.__saleState==2%}
                    {%if $carInfo.sellType!=4%}
                    <span class="down-time" nowTime="{%$tplData.__serverTimeFormat%}" endTime="{%$carInfo.formatEndSellTime%}">&nbsp;</span>后&nbsp;结束
                    {%/if%}
                {%else%}
                <span class="txt-time">已结束
                </span>
                {%/if%}
                </span>
        </div>
        <div class="car-lit">{%$carTit%}</div>
        <div class="car-desc">{%$carInfo.sellLead%}</div>
        {%if $carInfo.bargainType==2%}
        <div class="car-quan-price">抵扣券：<em>{%$tplData.coupon.sellPrice%}元</em><span class="car-dikou">到店抵扣<span class="font-red">{%$tplData.coupon.faceValue%}元</span>现金</span></div>
        <div class="emao-price-info">
            <span>一猫价：
                <span class="fullprice">
                {%$goodInfo.price|format_price%}
                </span>
            </span>
            <span class="zhidao-pad dikou-del">（厂商指导价：
                 <span class="guidePrice">
                {%$goodInfo.guidePrice%}
                 </span>
                万）
            </span>
        </div>
        {%else%}
        <div class="car-quan-price">抵扣券：<em>{%$tplData.coupon.sellPrice%}元</em>
            <span class="car-dikou dikou-del">（厂商指导价：
                <span class="guidePrice">
                {%$goodInfo.guidePrice%}
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
</div>
<div class="car-summary">
<form class="car-form" action="/pay/xianshitemai/step-1/" method="post">
    <input type="hidden" name="color" value=""/>
    <input type="hidden" name="gId" value="{%$carInfo.id%}"/>
    <input type="hidden" name="autoId" value="{%$goodInfo.autoId%}"/>
    <input type="hidden" name="gType" value="1"/>
    <input type="hidden" name="formhash" value="{%$tplData.formHash%}"/>
    <input type="hidden" name="pId" value=""/>
    <input type="hidden" name="depositId" value="0" />
    <dl class="dl-auto borderBt box" pageCls="page-carStyle">
        <dt>选择车型</dt>
        <dd class="choose-auto flex1 center-v" data-id="{%$goodInfo.autoId%}">
            {%$goodInfo.__autoName%}
        </dd>
    </dl>
    <dl class="dl-color borderBt box" pageCls="page-selectColor">
        <dt>选择颜色</dt>
        <dd class="choose-color flex1 center-v">
            {%if $color.number>0%}
            <span class="color-box color{%$color.color%}" data-id="{%$color.color%}"></span>
            <span class="car-amount">{%$color.colorName%}&nbsp;还剩{%$color.number%}辆
            </span>
            {%else%}
            <span class="color-box color{%$color.color%}" data-id="{%$color.color%}"></span>
            <span class="car-amount">{%$color.colorName%}&nbsp;已售罄</span>
            {%/if%}
        </dd>
    </dl>
    {%$gift=$tplData.autoDeposit[0].giftInfo%}

    <dl class="dl-gift borderBt box" >
        <dt>到店抵扣</dt>
        <dd class="no-bg flex1 center-v">
            {%$tplData.coupon.faceValue%}元 现金<br/>
            {%if $gift.name%}
            <span class="gift"><span class="gift-desc">{%$gift.name%}</span></span>
            {%/if%}
        </dd>
    </dl>

    <dl class="borderBt box">
        {%widget name="gmobile:widget/page/detail/info/dealer.tpl"%}
    </dl>
</form>
</div>