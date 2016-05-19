{%$navList=[
    '0'=>[
        'name'=>'商城首页',
        'href'=>'/'
    ],
    '1'=>[
        'name'=>'抵扣券',
        'type'=>'2'
    ],
    '2'=>[
        'name'=>'特价车',
        'type'=>'1'
    ],
    '3'=>[
        'name'=>'定制车',
        'type'=>'3'
    ]
]%}
{%$navList[$navIndex]['cls']='selected'%}

<div class="bar-nav bar-nav-{%$navIndex%}">
    <ul class="center-v">
        {%foreach $navList as $i=>$item%}
            {%if $tplData.searchParam.sellType==$item.type%}
                {%$item.cls='selected'%}
            {%/if%}
            <li class="{%$item.cls%} nav-item-{%$item.type%}">
                {%if $item.type%}
                <a href="{%get_searchurl sellType=$item.type%}">{%$item.name%}</a>
                {%else%}
                <a href="{%$item.href%}">{%$item.name%}</a>
                {%/if%}
            </li>
        {%/foreach%}
    </ul>
</div>


