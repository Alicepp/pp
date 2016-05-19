{%$navList=array("活动详情","活动时间","配置参数","服务保障")%}
{%$qiangBtnTxt="立即抢购"%}
{%if $carInfo.__lastCategory.tpl==8||$carInfo.__lastCategory.tpl==9%}
{%$navList=array("活动详情","活动时间","服务保障")%}
{%$qiangBtnTxt="立即报名"%}
{%/if%}
<div class="page-center mar-top10">
    <div class="detail-product">
        <div class="detail-lit clearfix">
            <div class="lit-img"></div>
            <div class="lit-tit">
                <h1>{%$carTit|escape:none%}</h1>
                <p>{%$carInfo.sellLead%}</p>
            </div>
            {%if $tplData.currdealer.dealer%}
            <div class="shop-box">
                <div class="shop-hd" >
                    <a class="shop-hd-name" title="进入店铺" href="{%$tplData.currdealer.dealer.url%}" target="_blank">
                        {%$tplData.currdealer.dealer.shortName%}官方旗舰店
                    </a>
                    <span class="online-ser" >
                    </span>
                    <a class="enter-shop" title="进入店铺" href="{%$tplData.currdealer.dealer.url%}">
                    </a>
                </div>
                <div class="shop-floor">
                    <div class="shop-inline">
                        <div class="company-info">
                            <div class="company-item1">
                                {%if $tplData.currdealer.dealer.logo%}
                                <div class="img-logo">
                                    <img src="{%$tplData.currdealer.dealer.logo%}" alt=""/>
                                </div>
                                {%/if%}
                                <div class="grade">
                                    <span class="grade-img" title="商城认证店铺"></span>
                                    <span class="grade-num">[&nbsp;&nbsp;综合评分 <em>{%$tplData.currdealer.score.avg_score%}</em>&nbsp;&nbsp;]</span>
                                </div>
                            </div>
                            <div class="ser-phone">
                                <span class="ser-lit">客服电话：</span>
                                <span class="ser-num">{%$tplData.currdealer.dealer.telephone%}</span>
                            </div>

                            <div class="enter-dian">
                                <a href="{%$tplData.currdealer.dealer.url%}">进入店铺</a>
                            </div>
                        </div>
                        {%if $tplData.currdealer.wap_code_img%}
                        <div class="qr-code">
                            <div class="code-img">
                                <img src="{%$tplData.currdealer.wap_code_img%}" alt=""/>
                            </div>
                            <div class="code-font">
                                手机扫描二维码<br/>
                                商城店铺带着走
                            </div>
                        </div>
                        {%/if%}
                    </div>
                </div>



            </div>
            {%/if%}
        </div>
        <div class="detail-ctbox">
            <div class="detail-lf">
                {%widget name="gmall:widget/page/detail/slide/slide.tpl"%}
                {%widget name="gmall:widget/page/detail/share/share.tpl"%}
            </div>
            <div class="detail-rt" >
                {%widget name="gmall:widget/page/detail/info/info`$carInfo.__lastCategory.tpl`.tpl"%}

            </div>
        </div>
        <form action="/fenqi/" class="fenqiForm"  method="post" style="display: none">
            <input type="hidden" name="color" value=""/>
            <input type="hidden" name="gId" value="{%$carInfo.id%}"/>
            <input type="hidden" name="pId" value=""/>
            <input type="hidden" name="autoId" value=""/>
            <input type="hidden" name="partsid" value=""/>
            <input type="hidden" name="dealerid" value="{%$point.dealerid%}"/>
            <input type="hidden" name="depositId" value=""/>


        </form>
    </div>
</div>
<div class="page-center mar-top20 clearfix">
    {%if $tplData.adlist || $tplData.dealerType%}
    <div class="detail-con-lf">
        {%if $tplData.dealerType%}
        <div class="shop-class-box">
            <div class="shop-nav3">
                <i></i>店铺商品分类
            </div>

            <div class="shop-con">
                {%foreach $tplData.dealerType as $carlist%}
                <dl class="brand-dl">
                    <dt>{%$carlist.subBrandName%}</dt>
                    {%foreach $carlist.list as $serie%}
                    <dd {%if $serie@last%}style="border-bottom:none;"{%/if%}><a href="{%$serie.url%}" target="_blank">{%$serie.serieName%}</a></dd>
                    {%/foreach%}

                </dl>
                {%/foreach%}
            </div>
        </div>
        {%/if%}
        {%if $tplData.adlist%}
            {%foreach $tplData.adlist as $img%}
            <div>
                <a href="{%$img.linkUrl%}" target="_blank"><img src="{%$img.pic%}" alt=""/></a>
            </div>
            {%/foreach%}
        {%/if%}
    </div>
    {%/if%}
    <div class="detail-cont {%if !$tplData.adlist && !$tplData.dealerType%}detail-cont1200{%/if%}">
        <ul class="detail-tab" id="detail-tab">
            {%foreach $navList as $i=>$item%}
            <li switchId="pcContent" class=" {%if $item@first%}active{%/if%}"><a href="javascript:;">{%$item%}</a></li>
            {%/foreach%}

            <li switchId="discuss" class="commentsCount"><a href="javascript:;">商品评价(<em>0</em>)</a></li>

        </ul>
        <div class="detail-tab-wrap">
            <div class="detail-tab-con">
                <div class="detail-tab-head">
                    <div class="detail-tab-name">
                    <span>
                    {%$carTit|escape:none%}
                    </span>
                    </div>
                    {%if $carInfo.__groupGood%}
                    <div class="detail-tab-price goods-type-{%$carInfo.__groupGood.__tuanState%}">
                        {%if $carInfo.__lastCategory.tpl==6%}
                        <span class="detail-mao2">抵扣券</span>
                        <span class="mao-price2 dikouprice"><strong>{%$tplData.coupon.sellPrice%}</strong><em> 元</em></span>
                        {%elseif $carInfo.__lastCategory.tpl==7%}
                        <span class="detail-mao2">巨惠价</span>
                        <span class="priceDiscount priceEm" price="{%$matrixItem.price%}"
                                  discount="{%$carInfo.__groupGood.__emaodiscount%}">
                         {%($matrixItem.price-$carInfo.__groupGood.__emaodiscount)|format_price%}
                        </span>
                        {%elseif $carInfo.__lastCategory.tpl==5%}
                        <span class="detail-mao2">巨惠价</span>
                         <span class="priceDiscount priceEm" price="{%$carInfo.defemaoPrice%}"
                                       discount="{%$carInfo.__groupGood.__emaodiscount%}">
                           {%($carInfo.defemaoPrice-$carInfo.__groupGood.__emaodiscount)|format_price%}
                         </span>
                        {%elseif $carInfo.__lastCategory.tpl==8%}
                        <span class="detail-mao2">报名费</span>
                        <span class="mao-price2"><strong>{%$carInfo.__groupGood.entryPrice%}</strong><em> 元</em></span>

                        {%/if%}


                        <span class="goods1">
                            <span class="detail-tab-but btn-remind btn-green ">开售提醒</span>
                        </span>
                        <span class="goods2">
                            <span class="detail-tab-but qiangBtn " id="btn-qiang-2">{%$qiangBtnTxt%}</span>
                        </span>
                        <span class="goods3">
                            <span class="detail-tab-but btn-disable">活动结束</span>
                        </span>
                        <span class="goods4">
                            <span class="detail-tab-but btn-disable ">活动结束</span>
                        </span>
                    </div>

                    {%else%}
                    <div class="detail-tab-price goods-type-{%$carInfo.__saleState%}">
                        {%if $carInfo.__lastCategory.tpl==2%}
                        <span class="detail-mao2">抵扣券</span>
                        <span class="mao-price2 dikouprice"><strong>{%$tplData.coupon.sellPrice%}</strong><em> 元</em></span>
                        {%elseif $carInfo.__lastCategory.tpl==3%}
                        <span class="detail-mao2">一猫价</span>
                        <span class="mao-price2 emaoprice"><strong>{%$matrixItem.price|format_price:0%}</strong><em>{%$matrixItem.price|format_price:1%}</em></span>
                        {%else%}
                        <span class="detail-mao2">一猫价</span>
                        <span class="mao-price2 emaoprice"><strong>{%$carInfo.defemaoPrice|format_price:0%}</strong><em>{%$carInfo.defemaoPrice|format_price:1%}</em></span>
                        {%/if%}
                        <span class="goods1">
                            <span class="detail-tab-but btn-remind ">开售提醒</span>
                        </span>
                        <span class="goods2">
                            <span class="detail-tab-but qiangBtn " id="btn-qiang-2">{%$qiangBtnTxt%}</span>
                        </span>
                        <span class="goods3">
                            <span class="detail-tab-but btn-disable ">已售罄</span>
                        </span>
                        <span class="goods4">
                            <span class="detail-tab-but btn-disable ">已结束</span>
                        </span>
                    </div>
                    {%/if%}

                </div>
                <ul class="detail-pos-tab">
                    {%foreach $navList as $i=>$item%}
                    <li switchId="pcContent" class="{%if $item@first%}active{%/if%}"><a href="javascript:;">{%$item%}</a></li>
                    {%/foreach%}
                    <li switchId="discuss" class="commentsCount"><a href="javascript:;">商品评价(<em>0</em>)</a></li>


                </ul>
                <div class="hotline">咨询热线：4008903881</div>
            </div>
        </div>
        <div class="detail-plist">
            <div class="pcContent pitem" id="pcContent" >
                {%$carInfo.pcContent|escape:none%}
            </div>
            <div class="pcContent pitem" style="display: none">
                {%$carInfo.huodongContent|escape:none%}
            </div>
            {%if $navList[2]=="配置参数"%}
            <div class="autoparam pitem" id="autoparam" style="display: none">
                {%widget name="gmall:widget/page/detail/autoparam.tpl"%}
            </div>
            {%/if%}
            <div class="pcContent pitem"  style="display: none">
                {%$carInfo.serviceContent|escape:none%}
            </div>
          <div class="pitem discuss" style="display: none">
              <div class="dis-con" >
                  <ul class="dis-list com-score">
                      <li score="10" class="commentsCount10">好评(<em>0</em>)</li>
                      <li score="5" class="commentsCount5">中评(<em>0</em>)</li>
                      <li score="1" class="bad-dis commentsCount1">差评(<em>0</em>)</li>
                  </ul>
                  <div class="discuss" id="discuss" goodsId="{%$tplData.goods.id%}" objType="{%$tplData.objType%}"></div>
                </div>
          </div>
        </div>

    </div>
</div>

<div style="display: none;">
    <div class="now-sale">
    <div class="now-sale-sec">限时特卖</div>
    </div>

    <div class="limited-sale">
        <ul class="limited-product">
            {%foreach $tplData.recommend as $i=>$item%}
            <li>
                <a target="_blank" href="{%$url.home%}car/{%$item.id%}.html">
                    <img loadsrc="{%$item.__coverImage%}" alt=""/>
                </a>
                <div class="box-bt box-bt-bg">
                </div>
                <div class="box-bt box-bt-txt">
                    {%$item.goodsName%}
                </div>
                {%if $item.__lastCategory.tpl==2%}
                <div class="limited-info">
                    <div class="car-mao-price">意向金：<em class="big-price">{%$item.__coupon.sellPrice|format_price%}</em>
                    </div>
                </div>
                {%else%}
                <div class="limited-info">
                    <div class="car-mao-price">一猫价：<em class="big-price">{%$item.defemaoPrice|format_price%}</em>
                    </div>
                </div>
                {%/if%}
            </li>
            {%/foreach%}
        </ul>
    </div>
</div>
{%widget name="gmall:widget/page/detail/ms/ms.tpl"%}
{%script%}
    require.async('./detail.async.js',function(detail){
        detail.init();
    });
{%/script%}