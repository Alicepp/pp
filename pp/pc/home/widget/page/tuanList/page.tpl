<div class="top-banner">
    <div class="banner-slide">
        <ul class="slide-ul">
            {%foreach $tplData.adList as $i=>$item%}
            <li class="slide-li" style="background-color: #{%$item.bgcolor%}">
                <a href="{%$item.linkUrl%}" target="_blank">
                    <img src="{%$item.pic%}" alt=""/>
                </a>
            </li>
            {%/foreach%}
        </ul>
        <ul class="slide-dot">
            {%foreach $tplData.adList as $i=>$item%}
            <li></li>
            {%/foreach%}
        </ul>
    </div>
    <div class="tuan-overview">
        <div class="overview-tit">
            <div class="tuan-num">{%$tplData.autoList.count%}</div>
            <p>今日活动</p>
        </div>
        <div class="overview-part">
            <span class="txt">
                已参与人数<span class="part-num">{%$tplData.tuanNum|default:0%}</span>
            </span>
        </div>
        <div class="overview-date">
            <span class="txt">
                {%$smarty.now|date_format:'%Y-%m-%d'%}
            </span>
        </div>

    </div>

</div>
<link rel="import" href="goodslist.tpl?__inline">
{%script%}
require.async('./app.js',function(app){
app.init();
})
{%/script%}