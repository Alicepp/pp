<div class="pageCls-item bankInfo-item page-bankInfo-{%$item.bankId%}" bankId="{%$item.bankId%}">
    {%widget name='gmobile:widget/head/head.tpl' tit='查看支持城市' toPageCls="page-list"%}
    <div class="box-item ">
        <div class="item-logo center" >
            <img src="http://img.emao.net/{%$item.logo%}"/>
        </div>
        <div class="item-tit">
            {%$item.showName%}
        </div>
        <p class="item-txt">
            {%$item.shortInfo%}
        </p>
    </div>
    {%if $item.advantage%}
    <div class="box-item bankInfo-item">
        <h3>金融公司优势</h3>
        <p class="item-txt">
            {%$item.advantage%}
        </p>
    </div>
    {%/if%}

    {%if $item.people%}
    <div class="box-item bankInfo-item">
        <h3>适合人群</h3>
        <p class="item-txt">
            {%$item.people%}
        </p>
    </div>
    {%/if%}
    {%if $item.disclaimer%}
    <div class="box-item bankInfo-item">
        <h3>免责声明</h3>
        <p class="item-txt">
            {%$item.disclaimer%}
        </p>
    </div>
    {%/if%}
    {%if $item.province%}
    <div class="box-item bankInfo-item">
        <h3>查看支持城市金融购车</h3>
        <div class="select-city">
            <select>
                <option value="0">选择查看支持城市</option>
                {%foreach $item['province'] as $k=>$list%}
                <option value="{%$list.provinceId%}">{%$list.provinceName%}</option>
                {%/foreach%}
            </select>
            <div class="city-box clearfix">
            </div>
        </div>

    </div>
    {%/if%}


</div>
{%script%}
require.async(['./bankInfoView.js'],function(View){
    var view=new View('page-bankInfo-{%$item.bankId%}');
    view.init();
});
{%/script%}