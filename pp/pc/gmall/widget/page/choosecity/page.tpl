<div class="page-choosecity page-center">
    <div class="box-tip">
        对不起，您所在的城市一猫还没有开通，您可以先逛逛其他城市或向我们
        <a href="/?c=index&a=desire" target="_blank">
            提交您的购车愿望
        </a>
    </div>
    {%if $tplData.openCity%}
    <dl class="box-dl">
        <dt>已开通城市</dt>

            {%foreach $tplData.openCity as $i=>$province%}
            <dd>
                <span class="pov">
                    {%$province.provinceName%}：
                </span>
                <span class="city">
                     {%foreach $province.citys as $i=>$item%}
                     <a href="{%get_cityurl city=$item.pinyin%}" title="{%$item.cityName%}">{%$item.cityName%}</a>
                     {%/foreach%}
                </span>
            </dd>
            {%/foreach%}

    </dl>
    {%/if%}





</div>