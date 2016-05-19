
<div class="page-choosecity page-center">
    {%if !$smarty.get.choosecity%}
    <div class="box-tip">
        对不起，您所在的城市一猫还没有开通，您可以先逛逛其他城市或向我们
        <a href="/?c=index&a=desire" target="_blank">
            提交您的购车愿望
        </a>
    </div>
    {%/if%}
    {%if $tplData.openCity%}
    <dl class="box-dl">
        <dt>已开通城市</dt>
            {%if $tplData.hotCity%}
            <dd class="hotcity">
                    <span class="pov">
                        热门城市：
                    </span>
                    <span class="city">
                         {%foreach $tplData.hotCity as $i=>$item%}
                         <a href="{%get_cityurl city=$item.pinyin%}" title="{%$item.cityName%}">{%$item.cityName%}</a>
                         {%/foreach%}
                    </span>
            </dd>
            {%/if%}

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
{%script%}

function getSearch(key,url){
    var reg=new RegExp(key+"=([^&=?]+)");
    url=url||location.href;
    var matchList=url.match(reg);
    return matchList?matchList[1]:null;
}
!function(){
    var refUrl=getSearch('ref')||'';
    var $cityLink=$('.city a');
    if(refUrl){
        for(var i=0;i<$cityLink.length;i++){
            $cityLink.eq(i).attr('href', $cityLink.eq(i).attr('href')+refUrl);
        }
    }

}()

{%/script%}