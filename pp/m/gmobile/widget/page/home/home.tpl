{%$list=[]%}
{%foreach $tplData.adList as $i=>$ad%}
{%$list[$i]=[]%}
{%$list[$i]['content']=($ad.mpic|default:$ad.pic|cat:"/100")%}
{%$list[$i]['url']=$ad.mlinkUrl%}
{%/foreach%}

<div class="mall-dis">
    {%widget name="common:widget/header/header.tpl"%}
    <article class="car-news-slide clear">
        <div id="js_focusPic" class="news-wrap"></div>
    </article>
    <link rel="import" href="leftnav/leftnav.tpl?__inline">
    {%foreach $navData as $id=>$datas%}
    {%if $datas.isLevel%}
    {%widget name="gmobile:widget/page/home/level/`$datas.tpl`.tpl" datas=$datas%}
    {%/if%}
    {%if $datas.isBannerAd1%}
    <div class="gg"><a href="{%$tplData.bannerAd1.linkUrl%}"><img src="{%$tplData.bannerAd1.pic%}" alt=""/></a></div>
    {%/if%}
    {%/foreach%}
    {%widget name="gmobile:widget/zhihuan/zhihuan.tpl"%}
    {%widget name="gmobile:widget/wish/wish.tpl"%}
    {%widget name="common:widget/footer/footer.tpl"%}
    {%widget name="common:widget/gotop/gotop.tpl"%}
</div>

{%script%}
require.async('./home.js',function(View){
var ads={%$list|json_encode|escape:none%};
var view=new View;
view.init({"ads":ads});

});
{%/script%}
<script>
    (function (G,D,s,c,p) {
        c={//监测配置
            UA:"UA-emao-000001",  //客户项目编号,由系统生成
            NO_FLS:0,
            WITH_REF:1,
            URL:'http://s.emao.net/build/web/js/statistics/iwt-min.js'  //iwt.js的URL位置，请客户自行托管JS文件，只需修改此值
        };
        G._iwt?G._iwt.track(c,p):(G._iwtTQ=G._iwtTQ || []).push([c,p]),!G._iwtLoading && lo();
        function lo(t) {
            G._iwtLoading=1;s=D.createElement("script");s.src=c.URL;
            t=D.getElementsByTagName("script");t=t[t.length-1];
            t.parentNode.insertBefore(s,t);
        }
    })(this,document);
</script>
