
<div class="car-price-box">
    <div class="car-price car-price1">
        <div class="price-lit">一猫价:<span class="mao-price emaoprice"><strong>{%$carInfo.defemaoPrice|format_price:0%}</strong>{%$carInfo.defemaoPrice|format_price:1%}</span></div>
        <div class="shi-price line-through">指导价：<span class="guidePrice">{%$carInfo.price%}</span>万</div>
    </div>
    {%if $carInfo.sellType!=4%}
    <div class="time-box">
        <div class="end-time"><i></i>剩余时间:<span class="time-txt" nowTime="{%$smarty.now|date_format:'%Y/%m/%d,%H:%M:%S'%}" endTime="{%$carInfo.formatEndSellTime%}"></span></div>
    </div>
    {%/if%}
</div>
<div class="car-summary">
<form class="car-form" action="{%$url.home%}pay/xianshitemai/step-1/" method="post">
    <input type="hidden" name="color" value=""/>
    <input type="hidden" name="gId" value="{%$carInfo.id%}"/>
    <input type="hidden" name="gType" value="2"/>
    <input type="hidden" name="formhash" value="{%$tplData.formHash%}"/>

    <dl class="dl-color">
        <dt>车型颜色 :</dt>
        <dd>
            <div class="choose-color clearfix">
                {%foreach $tplData.amount as $i=>$item%}
                <div  id="color-{%$item.color%}"  class="item {%if $item.default==1%}selected{%/if%}" data-id="{%$item.color%}">
                    <a href="javascript:void(0)" class="color-box color{%$item.color%}">
                    </a>
                    <div class="car-amount none">{%$item.colorName%}</div>
                </div>
                {%/foreach%}
            </div>

        </dd>
    </dl>
    <dl class="dl-number">
        <dt>库存数量 :</dt>
        <dd num="{%$color.number%}">
            {%if $color.number>0%}
            还剩<em>{%$color.number%}</em>辆
            {%else%}
            售罄
            {%/if%}
        </dd>
    </dl>


    <dl>
        <dt>付款方式 :</dt>

        <dd>
            {%foreach $tplData.autoDeposit as $i=>$item%}

            <p class="pay-box">

                <input type="radio" class="payType" name="depositId" value="{%$item.id%}" {%if $item.isDef%}{%$giftDesc=$item.giftInfo.name%} checked="checked"{%/if%}/>
                {%if $item.isFull%}
                <label>全款<em class="fullprice">{%$item.deposit|format_price%}</em>
                    {%if $carInfo.discount&&$carInfo.discount!=0%}
                    <span class="gift">（全额支付车款立<em>减{%$carInfo.discount|format_price%}</em>）</span>
                    {%/if%}
                </label>
                {%else%}
                <label>意向金<em>{%$item.deposit|format_price%}</em>+到店支付尾款
                </label>
                {%/if%}
            </p>

            {%/foreach%}
        </dd>
    </dl>
    <dl class="dl-selectdom">
        <dt>购车经销商 :</dt>
        <dd>
            <select name="provinceId" id="provinceId" value="{%$point.provinceId%}">
                {%foreach $points.province as $i=>$province%}
                <option value="{%$province['ProvinceId']%}" {%if $province['ProvinceId']==$point.provinceId%}selected="selected"{%/if%}>
                {%$province['ProvinceName']%}
            </option>
            {%/foreach%}
        </select>
        <select name="cityId" id="cityId" value="{%$point.cityId%}">
            {%foreach $points.city[$point.provinceId] as $i=>$city%}
            <option value="{%$city['cityId']%}" {%if $city['cityId']==$point.cityId%}selected="selected"{%/if%}>
            {%$city['cityName']%}
        </option>
        {%/foreach%}
    </select>
</dd>
</dl>
<dl class="dl-selectdom">
<dt></dt>
<dd class="shop-address">
    <select name="pId" id="dealerid" value="{%$point.dealerid%}">
        {%foreach $points.dealer[$point.cityId] as $i=>$dealer%}
        <option value="{%$dealer['dealerid']%}" {%if $dealer['dealerid']==$point.dealerid%}selected="selected"{%/if%}>
        {%$dealer['name']%}
    </option>
    {%/foreach%}
</select>
<span class="showMap"><i></i>查看地图</span>
</dd>
        </dl>


<div class="dl-submit goods-type-{%$carInfo.__saleState%}">
<div class="qiang-btns" style="{%if $carInfo.isSeckill==1%}display:none;{%/if%}">
    <dl class="qiang-buy goods1">
        <dt><a class="buy-but btn-remind" href="javascript:void(0)">开售提醒</a></dt>
        <dd class="time-out"><i></i>开售时间：
                    <span>
                    {%$carInfo.sellTime|date_format:'%Y-%m-%d %H:%M'%}
                    </span>
        </dd>
    </dl>
    <dl class="qiang-buy goods2">
        <dt>
            <a class="buy-but qiangBtn" id="btn-qiang-1" href="javascript:void(0)">立即抢购</a>

            {%if $carInfo.isInstallment==1%}
            <a class="buy-but qiangBtn fenqiBtn btn-fenqi"  href="javascript:void(0)">分期付款</a>
            {%/if%}
        </dt>
    </dl>
    <dl class="qiang-buy goods3">
        <dt><a class="buy-but btn-disable" href="javascript:void(0)">已售罄</a></dt>
    </dl>
    <dl class="qiang-buy goods4">
        <dt><a class="buy-but btn-disable" href="javascript:void(0)">已结束</a></dt>
    </dl>
</div>
{%if $carInfo.isSeckill==1%}
<div class="buy-but msBtn" id="ms-btn" style="display: none">获取抢购资格</div>
{%/if%}
<div class="dl-gift" style="{%if $giftDesc%}display:block;{%/if%}" >
    一猫赠品 :<span class="gift"><span class="gift-desc">{%$giftDesc%}</span></span>
</div>
</div>
<dl class="detail-server">
<dt>一猫承诺：</dt>
<dd>
    <span class="bargain-price"><i></i>特价车源</span>
    <span class="pay-worry"><i></i>支付无忧</span>
    <span class="promise"><i></i>提车保证</span>
    <span class="sale-after"><i></i>4s店售后服务</span>
</dd>
</dl>
        </form>
        </div>
        {%script%}
        require.async('./info.js',function(info){
        info.init();
        });
        {%/script%}