<article class="popview page-selectColor">
    <header class="pop-headbar box">
        <div class="btn-return"></div>
        <div class="bar-lit flex1">选择颜色</div>
    </header>
    <section class="select-bd">

        <ul class="select-list">
            {%foreach $tplData.amount as $i=>$item%}
            <li class="select-item center-v {%if $item.number==0%}disabled{%/if%}" data-id="{%$item.color%}">
                <div class="color-box color{%$item.color%}" data-id="{%$item.color%}"></div>
                <div class="color-name">{%$item.colorName%}</div>
                {%if $item.number>0%}
                <div class="color-amount">(
                    {%if $carInfo.stockType==2%}
                        {%if $item.number>10%}
                        现车充足
                        {%else%}
                        少量现车
                        {%/if%}
                    {%else%}
                        还剩{%$item.number%}辆
                    {%/if%}
                    )</div>
                {%else%}
                <div class="color-amount">(售罄)</div>
                {%/if%}
            </li>
            {%/foreach%}
        </ul>
    </section>
</article>
        {%script%}
            require.async('./selectView.js',function(View){
                var view=new View({pageCls:'page-selectColor'});
                view.initList=function(list){
                    var tpl='';
                    for(var i=0,color;i<list.length;i++){
                        color=list[i];
                        color.number=color.number-0;
                        tpl+='<li data-id="'+color.color+'"  class="select-item center-v ">';
                        tpl+='<div class="color-box color'+color.color+'"></div>';
                        tpl+='<div class="color-name">'+color.colorName+'</div>';
                        if(color.number>0){
                            tpl+='<div class="color-amount">还剩'+color.number+'辆</div>';
                        }else{
                            tpl+='<div class="color-amount">(售罄)</div>';
                        }
                        tpl+='</li>';
                    }
                    view.$el.find('.select-list').html(tpl);
                }
                view.init('colors');
            });
        {%/script%}