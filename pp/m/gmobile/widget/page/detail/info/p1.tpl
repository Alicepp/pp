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
        <div class="car-quan-price">一猫价：
            <span class="fullprice">
                 {%$emaoPrice|format_price%}
            </span>
            <span class="car-dikou dikou-del">
                厂商指导价：
                <span class="guidePrice">{%$carInfo.price%}</span>万
            </span>
        </div>

    </div>
</div>
<div class="car-summary">
<form class="car-form" action="/pay/xianshitemai/step-1/" method="post">
    <input type="hidden" name="color" value=""/>
    <input type="hidden" name="gId" value="{%$carInfo.id%}"/>
    <input type="hidden" name="gType" value="2"/>
    <input type="hidden" name="formhash" value="{%$tplData.formHash%}"/>
    <input type="hidden" name="pId" value=""/>
    <input type="hidden" name="depositId" value=""/>

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
    <dl class="borderBt box"  pageCls="page-selectPayway">
        <dt>付款方式</dt>
        <dd class="choose-deposit flex1 center-v">
            {%$item=$deposit%}
                <span class="pay-box" data-id="{%$item.id%}">
                    {%if $item.isFull%}
                    <label>全款{%$emaoPrice|format_price:0%}<em>{%$emaoPrice|format_price:1%}</em>
                        {%if $carInfo.discount&&$carInfo.discount!=0.00%}
                        <span class="gift">（全额支付车款立<em>减{%$carInfo.discount|format_price%}</em>）</span>
                        {%/if%}
                    </label>
                    {%else%}
                    <label>意向金<em>{%$item.deposit|format_price%}</em>+到店支付尾款
                    </label>
                    {%/if%}
                </span>
            {%if $item.giftInfo.name%}
            <br/>
            <span class="gift"><span class="gift-desc">{%$item.giftInfo.name%}</span></span>
            {%/if%}

        </dd>
    </dl>
    <dl class="chooose-deposit borderBt box">
        {%widget name="gmobile:widget/page/detail/info/dealer.tpl"%}
    </dl>

</form>
</div>
