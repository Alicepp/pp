<article class="popview page-carStyle">
    <header class="pop-headbar box">
        <div class="btn-return"></div>
        <div class="bar-lit flex1">选择车型</div>
    </header>
    <section class="select-bd">
        <ul class="select-list auto-list">
            {%foreach $goodsInfo as $i=>$good%}
            <li class="select-item center-v {%if $good@first%}selected{%/if%}" data-id="{%$good[0]['autoId']%}" data-name="{%$good[0]['__autoName']%}">
                {%$good[0]['__autoName']%}
            </li>
            {%/foreach%}
        </ul>
    </section>
</article>
        {%script%}
        require.async('./selectView.js',function(View){
        var view=new View({pageCls:'page-carStyle'});
        view.init('goodsAuto');
            if($('#autoId')[0]){
            $('#autoId')[0].selectedIndex=0
            }
        });
        {%/script%}

