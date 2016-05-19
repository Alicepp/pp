{%$pageCls=('page-selectPart-'|cat:$item.id)%}
<article class="popview {%$pageCls%}" >
    <header class="pop-headbar">
        <div class="btn-return"></div>
    </header>
    <section class="select-bd">
        <div class="select-tit center">{%$item.groupName%}</div>
        <ul class="select-list">
            {%foreach $item.parts as $i=>$part%}
            <li class="select-item center-v {%if $part@first%}selected{%/if%}" data-id="{%$part.id%}" groupId="{%$item.id%}" partId="{%$part.id%}">
                {%if $item.type==2%}
                <img src="{%$part.image%}" alt=""/>
                {%/if%}
                <div class="parts-item-name">
                 {%$part.partsName%}
                </div>

            </li>
            {%/foreach%}
        </ul>
    </section>
</article>
{%script%}
    require.async('./selectView.js',function(View){
    var view=new View({pageCls:'{%$pageCls%}'});
        view.init('parts-{%$item.id%}','parts');
    });
{%/script%}