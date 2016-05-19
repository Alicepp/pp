<div class="wish-wrap">
    <div class="wish1 center wish-bg clearfix">
        <div class="wish-lf wish1-lf">
            <div class="buy-brand">
                选择您想购买的品牌
            </div>
            {%foreach $tplData.brand.data as $k=>$list%}
                <dl class="brand-dl">
                    <dt>{%$k%}</dt>
                    {%foreach $list as $data%}
                        <dd class="brand-item" id="brand-item-{%$data.id%}" data-id="{%$data.id%}" data-name="{%$data.brandName%}" >
                            <a href="javascript:void(0);">{%$data.brandName%}</a>
                        </dd>
                    {%/foreach%}
                </dl>
            {%/foreach%}


        </div>
        <div class="wish-rt wish1-rt">
            <div class="buy-brand">已选品牌<em>（最多可选5个）</em></div>
            <ul class="select-list">
            </ul>
            <div class="wish-buttom">
                <div class="next-but page-btn" to="wish2">下一步</div>
            </div>
        </div>
    </div>
    {%widget name="gmall:widget/page/wish/wish2.tpl"%}
    {%widget name="gmall:widget/page/wish/wish3.tpl"%}
</div>

{%script%}
require.async(['./wish1.js'],function(App){
var app=new App();
        app.init();
});
{%/script%}