{%widget name="common:widget/header/header.tpl" urlSuffix="car-0-0-0-0-0-0-0-1.html"%}
<section class="list-box">
    <ul class="list-tab box">
        <li class="flex1 list-icon">价格<i></i></li>
        <li class="flex1 filter-btn" >筛选</li>
    </ul>
</section>
<div class="pro-list">
    <link rel="import" href="homeListData.tpl?__inline">
</div>
<div class="down-load">
    向上加载更多
</div>
<div class="load-img"><img src="img/load2.gif" alt=""/></div>
<link rel="import" href="sidebar/sidebar.tpl?__inline">
{%widget name="common:widget/footer/footer.tpl"%}
{%widget name="common:widget/gotop/gotop.tpl"%}
{%script%}
require.async('./app.js',function(app){
        app.init();
});
{%/script%}