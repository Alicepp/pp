    <div class="wish2 center wish-bg clearfix">
        <div class="wish-lf"></div>
        <div class="wish-rt wish1-rt">
            <div class="buy-brand">已选车系<em>（最多可选5个）</em></div>
            <ul class="select-list">
            </ul>
            <div class="wish-buttom">
                <div class="pre-but page-btn" to="wish1">上一步</div>
                <div class="next-but page-btn" to="wish3">下一步</div>
            </div>
        </div>
    </div>
    {%script%}
    require.async(['./wish2.js'],function(App){
    var app=new App;
    app.init()
    });
    {%/script%}