{%block name="info_var"%}
    {%$emaoprice=$carInfo.defemaoPrice%}
    {%$number=$color.number%}

{%/block%}
{%$giftDesc=$tplData.autoDeposit[0].giftInfo.name%}
{%foreach $tplData.autoDeposit as $i=>$item%}
{%if $item.isDef%}
{%$giftDesc=$item.giftInfo.name%}
{%/if%}
{%/foreach%}
{%block name="info_top"%}
<div class="car-price-box">
    {%if $carInfo.__groupGood%}
    <div class="car-price car-price3 car-price{%$carInfo.__lastCategory.tpl%}">
        <div class="price-lit">巨惠价：
            <span class="priceDiscount priceEm" price="{%$emaoprice%}"
                                         discount="{%$carInfo.__groupGood.__emaodiscount%}">
                    {%($emaoprice-$carInfo.__groupGood.__emaodiscount)|format_price%}
                    </span>
        </div>
        <div class="price-lit">
            {%if $carInfo.__groupGood.__emaodiscount>0%}
            一猫价：<span class="mao-price fullprice">{%$emaoprice|format_price%}</span>
            <span class="shi-price left-price line-through">指导价：<span class="guidePrice">{%$carInfo.defPrice%}</span>万</span>
            {%else%}
            <span class="shi-price line-through">指导价：<span class="guidePrice">{%$carInfo.defPrice%}</span>万</span>
            {%/if%}
        </div>
    </div>
    {%else%}
        <div class="car-price car-price{%$carInfo.__lastCategory.tpl%}">
            <div class="price-lit">一猫价：<span class="mao-price fullprice">{%$emaoprice|format_price%}</span></div>
            <div class="shi-price line-through">指导价：<span class="guidePrice">{%$carInfo.defPrice%}</span>万</div>
        </div>
        {%if $carInfo.sellType!=4%}
        <div class="time-box">
            <div class="end-time"><i></i>剩余时间:<span class="time-txt" nowTime="{%$smarty.now|date_format:'%Y/%m/%d,%H:%M:%S'%}" endTime="{%$carInfo.formatEndSellTime%}"></span></div>
        </div>
        {%/if%}
    {%/if%}

</div>
{%/block%}

<div class="car-summary cartype-{%$carInfo.__lastCategory.tpl%}">
<form class="car-form" action="/pay/xianshitemai/step-1/" method="post">
    {%block name="info_input"%}
    <input type="hidden" name="color" value=""/>
    <input type="hidden" name="gId" value="{%$carInfo.id%}"/>
    <input type="hidden" name="gType" value="2"/>
    <input type="hidden" name="formhash" value="{%$tplData.formHash%}"/>
    {%/block%}
    {%block name="info_dzc"%}
    {%/block%}
    {%block name="info_activity"%}
    <div class="dl-box">
        {%block name="info_auto"%}
        <dl class="dl-auto padding-bot">
            <dt>适用车型 :</dt>
            <dd>
                <select name="autoId" id="autoId">
                    {%foreach $goodsInfo as $i=>$good%}
                    <option value="{%$good[0]['autoId']%}">
                        {%$good[0]['__autoName']%}
                    </option>
                    {%/foreach%}
                </select>
            </dd>
        </dl>
        {%/block%}
        {%block name="info_color"%}
        <dl class="dl-color">
            <dt class="">车型颜色 :</dt>
            <dd>
                <div class="choose-color clearfix">
                    {%foreach $goodsInfo[0] as $i=>$item%}
                    <div id="color-{%$item.color%}"  class="item {%if $item.default==1%}selected{%/if%}" data-id="{%$item.color%}" >

                        <a href="javascript:void(0)" class="color-box color{%$item.color%}">
                        </a>
                        <div class="car-amount none">{%$item.colorName%}</div>
                    </div>
                    {%/foreach%}
                </div>

            </dd>
        </dl>
        {%/block%}
        {%block name="info_number"%}
            <dl class="dl-number">
                <dt>库存数量 :</dt>
                <dd num="{%$number%}">
                    {%if $number>0%}
                        {%if $carInfo.stockType==2%}
                           {%if $number>10%}
                            现车充足
                           {%else%}
                            少量现车
                           {%/if%}
                        {%else%}
                            还剩{%$number%}辆
                        {%/if%}
                    {%else%}
                    售罄
                    {%/if%}
                </dd>
            </dl>
        {%/block%}
        {%block name="info_payType"%}
        <dl class="dl-pay">
            <dt>付款方式 :</dt>

            <dd>
                {%foreach $tplData.autoDeposit as $i=>$item%}
                <p class="pay-box">
                    <input type="radio" class="payType" name="depositId" value="{%$item.id%}" {%if $item.isDef%} checked="checked"{%/if%}/>
                    {%if $item.isFull%}
                    <label>全款<em class="fullprice">{%$item.deposit|format_price%}</em>
                        {%if $carInfo.discount&&$carInfo.discount!=0%}
                        <span class="gift">（全额支付车款立<em>减{%$carInfo.discount%}元</em>）</span>
                        {%/if%}
                    </label>
                    {%else%}
                    <label>意向金<em>{%$item.deposit%}元</em>+到店支付尾款
                    </label>
                    {%/if%}
                    {%if $item.depositDes%}
                        <span class="pay-item-info">
                            (说明：{%$item.depositDes%})
                        </span>
                    {%/if%}

                </p>

                {%/foreach%}
            </dd>
        </dl>
        {%/block%}
    </div>
    {%/block%}
    {%block name="info_gift"%}
    <div class="dl-box">
        <dl class="dl-address margin-bot5">
            <dt>购车地点 :</dt>
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
            <dd class="shop-address padding-top" >
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
        <dl class="dl-gift " style="{%if $giftDesc%}display:block;{%/if%}" >
            <dt>一猫赠品 :</dt>
            <dd>
                <div class="gift"><span class="gift-desc">{%$giftDesc%}</span></div>
            </dd>
        </dl>
    </div>
    {%/block%}
    {%block name="info_group"%}
        {%block name="tuan-explain"%}
        {%/block%}
        <div class="dl-box">

        <dl class="dl-activeNum">
            <dt class="c-dt">参加人数：</dt>
            {%if $carInfo.__groupGood.maxGroupnum>0%}
                {%if $carInfo.__groupGood.groupNum<$carInfo.__groupGood.maxGroupnum%}
                <dd class="act-num">
                    {%$hprecent=($carInfo.__groupGood.groupNum/$carInfo.__groupGood.maxGroupnum*100)%}
                    {%$precent=($carInfo.__groupGood.minGroupnum/$carInfo.__groupGood.maxGroupnum*100)%}
                    <div class="progress-box progress-box-top">
                        {%if $carInfo.__groupGood.groupNum<$carInfo.__groupGood.maxGroupnum%}
                        <div class="tuan-over">
                            已报<em>{%$carInfo.__groupGood.groupNum%}</em>人<br/>
                            <i><img src="/static/lib/img/public/xsj2.png"></i>
                        </div>
                        {%/if%}
                        <div class="progress-hui">
                            <div class="progress-bar" style="width:{%$hprecent%}%;"></div>
                            <div class="line2" style="left:{%$precent%}%"></div>

                        </div>
                        {%if $carInfo.__groupGood.minGroupnum>0%}
                        <div class="tuan-complete" style="left:{%$precent%}%">
                            <div class="persons">{%$carInfo.__groupGood.minGroupnum%}人成功</div>
                            <div class="sucess">
                                活动成功
                            </div>
                        </div>
                        {%/if%}
                        <div class="tuan-count">
                            共{%$carInfo.__groupGood.maxGroupnum%}人
                        </div>
                    </div>
                </dd>
                {%else%}
                <dd >
                    已到上限<span class="font-red">{%$carInfo.__groupGood.maxGroupnum%}</span>人
                </dd>
                {%/if%}
            {%else%}
            <dd>
                <span class="font-red">{%$carInfo.__groupGood.groupNum%}</span>人参加
                {%if ($carInfo.__groupGood.minGroupnum>0)&&($carInfo.__groupGood.groupNum<$carInfo.__groupGood.minGroupnum)%}

                <span class="font-hui">（最低人数：{%$carInfo.__groupGood.minGroupnum%}人）</span>
                {%/if%}
            </dd>
            {%/if%}

        </dl>
        </div>
    {%/block%}

    {%block name="info_group_btns"%}
    <div class="dl-box-20 dl-group-btns border-bot">
        {%block name="info_enprice"%}
        {%/block%}
            <div class="state">
                <ul class="ul-submit goods-type-{%$carInfo.__groupGood.__tuanState%}">
                    <li class="btngroup goods1 btn-remind btn-green flex1">开售提醒</li>
                    {%if $carInfo.__lastCategory.tpl==8||$carInfo.__lastCategory.tpl==9%}
                    <li class="btngroup goods2 qiangBtn flex1" id="btn-qiang-1" onclick="ga('send','event','gmall','ljbaoming1','{%$carInfo.id%}');">{%$qiangBtnTxt%}</li>
                    {%else%}
                    <li class="btngroup goods2 qiangBtn flex1" id="btn-qiang-1" onclick="ga('send','event','gmall','ljqianggou1','{%$carInfo.id%}');">{%$qiangBtnTxt%}</li>
                    {%/if%}
                    <li class="btngroup goods3 btn-disable flex1">活动结束</li>
                    <li class="btngroup goods4 btn-disable flex1">活动结束</li>
                </ul>
            </div>
          {%block name="info_time"%}
            {%if $carInfo.__groupGood.__tuanState==1%}
            <div class="Countdown"><i></i>开售时间：<span>{%$carInfo.sellTime|date_format:'%Y-%m-%d %H:%M'%}</span></div>
            {%elseif $carInfo.__groupGood.__tuanState==2%}
            {%if $carInfo.sellType!=4%}
            <div class="Countdown"><i></i>剩余时间:<span class="time-txt" nowTime="{%$smarty.now|date_format:'%Y/%m/%d,%H:%M:%S'%}" endTime="{%$carInfo.formatEndSellTime%}"></span></div>
            {%/if%}
            {%/if%}
          {%/block%}
    </div>
    {%/block%}
    {%block name="info_btns"%}
        <div class="dl-box dl-box-20 dl-submit goods-type-{%$carInfo.__saleState%}">
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
                    <a class="buy-but qiangBtn"  id="btn-qiang-1" href="javascript:void(0)">立即抢购</a>
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
        </div>
    {%/block%}
        <div class="dl-box">
            <dl class=" detail-server">
                <dt>一猫承诺：</dt>
                <dd>
                    <span class="bargain-price"><i></i>特价车源</span>
                    <span class="pay-worry"><i></i>支付无忧</span>
                    <span class="promise"><i></i>提车保证</span>
                    <span class="sale-after"><i></i>4s店售后服务</span>
                    {%if $carInfo.isRefund==1&&$carInfo.__lastCategory.tpl>7%}
                    <span class="tuikuan"><i></i>随时退</span>
                    {%/if%}
                </dd>
            </dl>
        </div>
</form>
</div>
{%script%}
    require.async('./info.js',function(info){
    info.init();
    });
{%/script%}