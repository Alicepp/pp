<article class="page-wish1 page-wish">
    <div class="wish-bd">
        {%foreach $tplData.brand.data as $k=>$list%}
        <dl class="wish-dl">
            <dt>{%$k%}</dt>
            <dd class="brand-dd">
            {%foreach $list as $data%}
                <div class="box-item " id="brand-item-{%$data.id%}" data-id="{%$data.id%}" data-name="{%$data.brandName%}" >
                    {%$data.brandName%}
                </div>
            {%/foreach%}
            </dd>
        </dl>
        {%/foreach%}
        <div class="wish-serie height0">
            <div class="arr-up"></div>
            <ul>
            </ul>
        </div>
        <div class="wish-model height0">
            <div class="arr-up"></div>
            <ul>
            </ul>
        </div>

    </div>
    <footer class="wish-ft-fixed box center borderbox height0">
            <div class="prev-btn page-btn">上一步</div>
            <div class="flex1"> <span>最多选择5个：</span><span class="page-num">0/5</span></div>
            <div class="next-btn page-btn" pageCls="page-wish2">下一步</div>
    </footer>
</article>
{%script%}
require.async(['./wish1.js'],function(App){
var app=new App();
        app.init();
});
{%/script%}