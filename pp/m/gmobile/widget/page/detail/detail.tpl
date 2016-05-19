{%$img=$tplData.image[0]%}
{%foreach $tplData.image as $k=>$item%}
{%$img=$item%}
{%break%}
{%/foreach%}
{%$list=[]%}
{%foreach $tplData.image as $i=>$ad%}
{%if $i>=4%}
{%break%}
{%/if%}
{%$list[$i]=[]%}
{%$list[$i]['content']=($ad|cat:"/100")%}
{%$list[$i]['url']='javascript:;'%}
{%/foreach%}

{%$navList=array("活动详情","活动时间","配置参数","服务保障")%}
{%$qiangBtnTxt="立即抢购"%}
{%$addressTxt="购车地点"%}
{%if $carInfo.__lastCategory.tpl==8||$carInfo.__lastCategory.tpl==9%}
{%$navList=array("活动详情","活动时间","服务保障")%}
{%$qiangBtnTxt="立即报名"%}
{%$addressTxt="活动地点"%}
{%/if%}

<article class="page-detailMain" >

    <section class="detail-menu box">
        <div class="flex1">
            <div class="back-but" onclick="document.referrer?history.back():(location.href='/')"></div>
        </div>
        <div class="att-btn">关注</div>
        <div class="share-btn">分享</div>
        <a class="user-link" href="{%$url['i_m']%}">我的</a>
        <ul class="share-wrap bdsharebuttonbox height0">
            <li><a href="javascript:void(0);"  class="sina  bds_tsina" data-cmd="tsina"></a></li>
            <li><a href="javascript:void(0);" class="txwb  bds_tqq" data-cmd="tqq"></a></li>
            <li><a href="javascript:void(0);" class="qzone  bds_qzone" data-cmd="qzone"></a></li>
        </ul>
    </section>
    <div class="page-detail">
        <header class="detail-header">
            <div class="header-img">
                <article class="car-news-slide clear">
                    <div id="js_focusPic" class="news-wrap"></div>
                </article>
            </div>
        </header>

        {%widget name="gmobile:widget/page/detail/info/info`$carInfo.__lastCategory.tpl`.tpl"%}

        <div class="detail-cont">
            {%widget name="gmobile:widget/page/detail/tablist/tablist.tpl"%}

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
    <footer class="detail-footer">
        <div class="footer-bar-bot box borderbox">
            <div class="box">
                <div class="borderRt">
                    <span class="ask-online" id="ask-online" >在线客服</span>
                </div>

                <div class="borderRt">
                    <a class="phone-contact" href="tel:4008903881">电话咨询</a>
                </div>
                {%if $tplData.currdealer.dealer%}
                <div class="borderRt" style="width: 50px;">
                    <a class="dianpu" href="{%$tplData.currdealer.dealer.url%}">店铺</a>
                </div>
                {%/if%}
            </div>
            {%widget name="gmobile:widget/page/detail/info/foot-btn.tpl"%}

        </div>
    </footer>
    {%widget name="common:widget/footer/footer.tpl"%}
    <div style="height:60px"></div>
    {%widget name="common:widget/gotop/gotop.tpl"%}
</article>
{%widget name="gmobile:widget/page/detail/ms/ms.tpl"%}
{%widget name="gmobile:widget/page/detail/select/carStyle.tpl"%}
{%widget name="gmobile:widget/page/detail/select/map.tpl"%}
{%widget name="gmobile:widget/page/detail/select/fitting.tpl"%}
{%widget name="gmobile:widget/page/detail/select/color.tpl"%}
{%widget name="gmobile:widget/page/detail/select/payway.tpl"%}
{%widget name="gmobile:widget/page/detail/select/remined.tpl"%}
        {%foreach $tplData.parts.group as $i=>$item%}
        {%widget name="gmobile:widget/page/detail/select/parts.tpl" item=$item%}
        {%/foreach%}


{%script%}

require.async('./detailView.js',function(View){
    var ads={%$list|json_encode|escape:none%};
    var imgSrc="{%$img%}";
    var view=new View;
    view.init({'imgSrc':imgSrc,"ads":ads});
});
{%/script%}


