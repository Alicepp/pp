{%block name="info_var"%}
    {%$emaoprice=$carInfo.defemaoPrice%}
    {%$number=$color.number%}
{%/block%}
{%block name="info_top"%}
<div class="mall-car">
    <div class="mall-car-info">
        {%block name="info_time"%}
        <div class="info-time" >
               {%if $carInfo.__saleState==1||$carInfo.__groupGood.__tuanState==1%}
                <span class="txt-time">
                开售时间：<span class="time-out">
                    {%$carInfo.sellTime|date_format:'%Y-%m-%d'%}
                    {%$carInfo.sellTime|date_format:'%H:%M'%}
                    </span>
                {%elseif $carInfo.__saleState==2||$carInfo.__groupGood.__tuanState==2%}
                    {%if $carInfo.sellType!=4%}
                    <span class="down-time" nowTime="{%$tplData.__serverTimeFormat%}" endTime="{%$carInfo.formatEndSellTime%}">&nbsp;</span>后&nbsp;结束
                    {%/if%}
                {%else%}
                <span class="txt-time">已结束
                </span>
                {%/if%}
                </span>
        </div>
        {%/block%}
        <div class="car-lit">{%$carTit%}</div>
        <div class="car-desc">{%$carInfo.sellLead%}</div>
        {%block name="info_price"%}
        <div class="line-box">
            <div class="car-quan-price">一猫价：
                <span class="fullprice">
                     {%$emaoPrice|format_price%}
                </span>
                <span class="car-dikou dikou-del">
                    厂商指导价：
                    <span class="guidePrice">{%$carInfo.defPrice%}</span>万
                </span>
            </div>
        </div>
        {%/block%}

        {%block name="tuan_price"%}
        <div class="line-box">
            <div class="tuan-price">
                巨惠价：
                <span class="priceDiscount" price="{%$emaoprice%}"
                discount="{%$carInfo.__groupGood.__emaodiscount%}">
                {%($emaoprice-$carInfo.__groupGood.__emaodiscount)|format_price%}
                </span>
            </div>
            <div class="car-quan-price tuan-color">
                {%if $carInfo.__groupGood.__emaodiscount>0%}
                一猫价：
                <span class="fullprice">
                     {%$emaoPrice|format_price%}
                </span>
                <span class="car-dikou dikou-del">
                    厂商指导价：
                    <span class="guidePrice">{%$carInfo.defPrice%}</span>万
                </span>
                {%else%}
                <span class="car-dikou dikou-del" style="padding-left: 0">
                    厂商指导价：
                    <span class="guidePrice">{%$carInfo.defPrice%}</span>万
                </span>
                {%/if%}

            </div>
        </div>
        {%/block%}
        {%block name="see_car"%}
        {%/block%}
        {%block name="tuan_progress"%}
        {%$precent=($carInfo.__groupGood.minGroupnum/$carInfo.__groupGood.maxGroupnum*100)%}
        {%if $carInfo.__groupGood.maxGroupnum%}
        <div class="line-box">
            {%if $carInfo.__groupGood.groupNum<$carInfo.__groupGood.maxGroupnum%}
            <div class="progress-box">
                <div class="tuan-over">
                    已报<em>{%$carInfo.__groupGood.groupNum%}</em>人
                    <i></i>
                </div>
                <div class="progress-hui">
                    <div class="progress-bar" style="width:0;"></div>
                    <div class="line2" style="left:{%$precent%}%"></div>

                </div>
                {%if $carInfo.__groupGood.minGroupnum>0%}
                <div class="tuan-complete" style="left:{%$precent%}%">
                    <i></i>
                    <div class="persons">{%$carInfo.__groupGood.minGroupnum%}人成功</div>
                    <div class="sucess">
                        <s></s>
                        活动成功
                    </div>
                </div>
                {%/if%}
                <div class="tuan-count">
                    共{%$carInfo.__groupGood.maxGroupnum%}人
                </div>
            </div>
            {%else%}
            <span class="line-tit">
            活动人数：
            </span>
            <span class="line-txt">
             已到上限<span class="font-red">{%$carInfo.__groupGood.maxGroupnum%}</span>人
            </span>
            {%/if%}
        </div>
        {%else%}
        <div class="line-box">
            <span class="line-tit">
            活动人数：
            </span>
            <span class="line-txt">
                <span class="font-red">{%$carInfo.__groupGood.groupNum%}</span>人参加
                {%if ($carInfo.__groupGood.minGroupnum>0)&&($carInfo.__groupGood.groupNum<$carInfo.__groupGood.minGroupnum)%}
                <span class="font-hui">（最低人数：{%$carInfo.__groupGood.minGroupnum%}人）</span>
                {%/if%}
            </span>
        </div>
        {%/if%}
        {%block name="tuan-explain"%}
        {%/block%}
        {%/block%}
    </div>
</div>
{%/block%}



<div class="car-summary cartype-{%$carInfo.__lastCategory.tpl%}">
<form class="car-form" action="/pay/xianshitemai/step-1/" method="post">
    <input type="hidden" name="color" value=""/>
    <input type="hidden" name="gId" value="{%$carInfo.id%}"/>
    <input type="hidden" name="formhash" value="{%$tplData.formHash%}"/>
    <input type="hidden" name="pId" value=""/>
    <input type="hidden" name="depositId" value=""/>
    {%block name="info_input"%}
    <input type="hidden" name="autoId" value="{%$goodInfo.autoId%}"/>
    <input type="hidden" name="gType" value="2"/>
    {%/block%}
    {%block name="info_shou"%}
    {%/block%}

    {%block name="info_auto"%}
    <dl class="dl-auto borderBt box" pageCls="page-carStyle">
        <dt class="center">选择车型</dt>
        <dd class="choose-auto flex1 center-v" data-id="{%$goodInfo.autoId%}">
            {%$goodInfo.__autoName%}
        </dd>
    </dl>
    {%/block%}
    {%block name="info_color"%}
    <dl class="dl-color borderBt box" pageCls="page-selectColor">
        <dt class="center">选择颜色</dt>
        <dd class="choose-color flex1 center-v">
            {%if $color.number>0%}
            <span class="color-box color{%$color.color%}" data-id="{%$color.color%}"></span>
            <span class="car-amount">{%$color.colorName%}&nbsp;
                {%if $carInfo.stockType==2%}
                    {%if $color.number>10%}
                    现车充足
                    {%else%}
                    少量现车
                    {%/if%}
                {%else%}
                    还剩{%$color.number%}辆
                {%/if%}
            </span>
            {%else%}
            <span class="color-box color{%$color.color%}" data-id="{%$color.color%}"></span>
            <span class="car-amount">{%$color.colorName%}&nbsp;已售罄</span>
            {%/if%}
        </dd>
    </dl>
    {%/block%}
    {%block name="info_di"%}
    {%/block%}
    {%block name="info_number"%}
    {%/block%}
    {%block name="info_payType"%}
    <dl class="borderBt box"  pageCls="page-selectPayway">
        <dt class="center">付款方式</dt>
        <dd class="choose-deposit flex1 center-v">
            {%$item=$deposit%}
                <span class="pay-box" data-id="{%$item.id%}">
                    {%if $item.isFull%}
                    <label>全款<em>{%$emaoPrice|format_price%}</em>
                        {%if $carInfo.discount&&$carInfo.discount!=0.00%}
                        <span class="gift">（全额支付车款立减<em>{%$carInfo.discount%}元</em>）</span>
                        {%/if%}
                    </label>
                    {%else%}
                    <label>意向金<em>{%$item.deposit%}元</em>+到店支付尾款
                    </label>

                    {%/if%}
                    {%if $item.depositDes%}
                    <label class="pay-item-info">
                        (说明：{%$item.depositDes%})
                    </label>
                    {%/if%}
                </span>
            {%if $item.giftInfo.name%}
            <br/>
            <span class="gift"><span class="gift-desc">{%$item.giftInfo.name%}</span></span>
            {%/if%}

        </dd>
    </dl>
    {%/block%}
    <dl class="chooose-deposit borderBt box">
        {%widget name="gmobile:widget/page/detail/info/dealer.tpl"%}
    </dl>

</form>
</div>
{%script%}
require.async('common:widget/ui/plugin/iscroll.js',function(iScroll){
    var $cares=$('.see-serie-car');
    for(var i=0,item,$item;i<$cares.length;i++){
      item=$cares[i];
      $item=$(item);
      var itemWidth=$item.width();
      var ulWidth=$item.find('ul').width();
      $item.find('.serie-list').width(ulWidth+2);
      if(ulWidth>itemWidth){
        var myScroll = new iScroll(item,{
            hScroll: true,
            useTransform: true,
            hScrollbar: false,
            vScroll: false,
            checkDOMChanges: false
         });
      }
    }
});


{%/script%}
