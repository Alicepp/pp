<ul class="gc-order">
    <li>
        <label>适用车型：</label>
        <span>{%$tplData.autoName%}</span>
    </li>
    <li>
        <label>一 猫 价：</label>
        <span>{%$tplData.emaoPrice|format_price%}</span>
    </li>
    <li>
        <label>颜 色：</label>
        <span>{%$tplData.color%}</span>
    </li>
    {%if $giftInfo.name%}
    <li>
        <label>一猫赠品：</label>
        <ul class="gift-wrap">
            <li>
                <span class="gc-gift"></span>
                <span>{%$giftInfo.name%}</span>
            </li>
        </ul>
    </li>
    {%/if%}
    {%if $tplData.gType == 2%}
    <li>
        <label>购车意向金：</label>
        <strong class="price-online" price="{%$tplData.orderPrice%}" >{%$tplData.orderPrice%}元</strong>
    </li>
    {%else%}
    <li>
        <label>购车全款：</label>
        <strong class="price-online" price="{%$tplData.orderPrice%}">{%$tplData.orderPrice%}元</strong>
	   				<span class="price-online-add price-allprice" price="{%$tplData.discount%}" emaoPrice="{%$tplData.emaoPrice%}">
	   					{%if $tplData.discount%}
	   					（{%$tplData.emaoPrice%}元-%$tplData.discount%}元）
	   					{%/if%}
        </span>
    </li>
    {%/if%}
</ul>