<div class="leftnav">
    <ul class="lfnav-ul box borderbox">
        {%$navlist=[]%}
        {%foreach $navData as $id=>$datas%}
        {%if $datas.isLevel%}
        <li class="lfnav-li lfnav-li-{%$datas.id%}" data-id="{%$datas.id%}">
            <span class="lfnav-item lfnav-item-{%$datas.id%}" >
                {%$datas.tit%}
            </span>
        </li>
        {%$k=array_push($navlist,['id'=>$datas.id])%}
        {%/if%}
        {%/foreach%}
        <li class="all-url">
            <a href="{%get_searchurl%}">全部></a>
        </li>
    </ul>
</div>

        {%script%}
        require.async('./leftnav.js',function(leftnav){
        leftnav.init({%$navlist|json_encode|escape:none%});
        })
        {%/script%}