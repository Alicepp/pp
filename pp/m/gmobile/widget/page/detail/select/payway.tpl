<article class="popview page-selectPayway" >
    <header class="pop-headbar box">
        <div class="btn-return"></div>
        <div class="bar-lit flex1">付款方式</div>
    </header>
    <section class="select-bd">
        <ul class="select-list select-autoHight">
            {%foreach $tplData.autoDeposit as $i=>$item%}
            <li class="select-item center-v" data-id="{%$item.id%}">
                <span class="pay-box" data-id="{%$item.id%}">
                        {%if $item.isFull%}
                        <label>全款<em class="fullprice">{%$item.deposit|format_price%}</em>
                            {%if $carInfo.discount&&$carInfo.discount!=0.00%}
                            <span class="gift">（全额支付车款立<em>减{%$carInfo.discount|format_price%}</em>）</span>
                            {%/if%}
                        </label>
                        {%else%}
                        <label>意向金<em>{%$item.deposit|format_price%}</em>+到店支付尾款
                        </label>
                        {%/if%}
                        {%if $item.depositDes%}
                        <label class="pay-item-info">
                            (说明：{%$item.depositDes%})
                        </label>
                        {%/if%}
                </span>
                {%if $item.giftInfo.name%}
                <br/>
                <span class="gift"><span class="gift-desc">{%$item.giftInfo.name%}</span></span>
                {%/if%}
            </li>
            {%/foreach%}
        </ul>
    </section>

</article>
{%script%}
    require.async('./selectView.js',function(View){
    var view=new View({pageCls:'page-selectPayway'});
        view.init('deposit');
    });
{%/script%}