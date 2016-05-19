{%widget name="common:widget/header/header.tpl" urlSuffix="juhuigou/list-0-1.html"%}
<div class="top-banner">
    <div class="banner-slide">
        <ul class="slide-ul swiper-wrapper">
            {%foreach $tplData.adList as $i=>$item%}
            <li class="slide-li swiper-slide" style="background-color: #{%$item.bgcolor%}">
                <a href="{%$item.linkUrl%}" style="background-image: url({%$item.pic%})" target="_blank">
                </a>
            </li>
            {%/foreach%}
        </ul>
        <ul class="slide-dot swiper-pagination">
            {%foreach $tplData.adList as $i=>$item%}
            <li></li>
            {%/foreach%}
        </ul>
    </div>


</div>
<div class="tuan-overtime">
    <div class="tuan-overview">
        <div class="overview-tit">

            <p>今日活动：<span class="tuan-num">{%$tplData.autoList.count%}</span></p>
            <div class="overview-date">
            <span class="txt">
                {%$smarty.now|date_format:'%Y-%m-%d'%}
            </span>
            </div>
        </div>
        <div class="overview-bd">
            <div class="overview-part">
            <span class="txt">
                已参与人数：<span class="part-num">{%$tplData.tuanNum|default:0%}</span>
            </span>
            </div>

        </div>


    </div>
</div>
<div class="pro-list">
    <link rel="import" href="listData.tpl?__inline"/>
</div>
<div class="down-load">
    向上加载更多
</div>
<div class="load-img"><img src="img/load2.gif" alt=""/></div>
{%widget name="common:widget/footer/footer.tpl"%}
{%widget name="common:widget/gotop/gotop.tpl"%}
{%script%}
require.async('./app.js',function(app){
        app.init();
});
{%/script%}