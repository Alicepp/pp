{%$keymap=("_"|cat:$matrixKey|cat:"_")%}
<article class="popview page-fitting wrapper">
    <header class="pop-headbar box">
        <div class="btn-return"></div>
        <div class="bar-lit flex1">选择配件</div>
    </header>
    <section class="select-fit">
        <ul class="select-list fit-bg">
            {%foreach $tplData.parts.group as $i=>$item%}
            {%if $item.type==2%}
            <li class="fit-li center-v fit-li-cpad">
                <div class="fit-name">{%$item.groupName%}</div>
                <div class="fit-select flex1">
                    {%foreach $item.parts as $k=>$part%}
                    <div class="fit-item fit-item-mar
                    {%if $keymap|strpos:$part.id!==false%}active{%/if%}"
                         data-id="{%$part.id%}">
                        <span class="fit-item-b">
                            <img src="{%$part.image%}" alt=""/>
                        </span>
                        <div class="fit-item-name">{%$part.partsName%}</div>
                    </div>
                    {%/foreach%}
                </div>
            </li>
            {%else%}
            <li class="fit-li center-v">
                <div class="fit-name">{%$item.groupName%}</div>
                <div class="fit-select flex1">
                {%foreach $item.parts as $k=>$part%}
                <div class="fit-item {%if $keymap|strpos:$part.id!==false%}active{%/if%}"
                     data-id="{%$part.id%}">
                    <div class="fit-item-txt">{%$part.partsName%}</div>
                </div>
                {%/foreach%}
                </div>
            </li>
            {%/if%}
            {%/foreach%}
        </ul>
        <div class="que-btn">确认</div>
    </section>
</article>
{%script%}
require.async('./fittingView.js',function(View){
var view=new View({pageCls:'page-fitting'});
view.init('parts');
});
{%/script%}