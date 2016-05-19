{%$useRange=[
'1'=>'全场通用',
'2'=>'指定商品',
'3'=>'指定商户商品'
]%}

<div class="user-wap">
    {%widget name="gmobile:widget/userHead/userHead.tpl" lit='我的钱包'%}
    <section class="list-box">
        <ul class="list-tab box">
            <li class="flex1 list-icon font-red">我的卡券<i></i></li>
            <li class="flex1">我的猫豆</li>
        </ul>
    </section>
    <!--<div class="list-con">-->
        <div class="card-box">
            {%foreach $tplData.data.data as $cardInfo%}
            {%if $cardInfo.states!=4%}
            <div class="card-quan">
                <div class="{%if $cardInfo.states==1%}card-red{%else%}card-red card-hui{%/if%}">
                    <div class="card-lit">{%$cardInfo.TicketBatch.name%}</div>
                    <div class="card-price">{%$cardInfo.TicketBatch.price%}<em>元</em></div>
                    <div class="quan-code">券号：{%$cardInfo.sn%}</div>
                </div>
                <div class="card-code">
                    有效期：{%$cardInfo.TicketBatch.startTime|date_format:'%Y.%m.%d'%}~{%$cardInfo.TicketBatch.endTime|date_format:'%Y.%m.%d'%}<br />
                    使用范围：{%$useRange[$cardInfo.TicketBatch.useRange]%}
                </div>
                {%if $cardInfo.states==2%}
                <div class="card-used"></div>
                {%elseif $cardInfo.states==3%}
                <div class="card-exp"></div>
                {%/if%}
            </div>
            {%/if%}
            {%/foreach%}
        </div>
    <!--</div>-->
</div>
{%script%}
require.async('./user.js',function(user){

user.init();
});
{%/script%}