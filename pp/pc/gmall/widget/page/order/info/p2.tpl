<ul class="gc-order">
    <li>
        <label>适用车型：</label>
        <span>{%$tplData.autoName%}</span>
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
    <li>
        <label>购车意向金：</label>
        <strong class="price-online" price="{%$tplData.orderPrice%}" >{%$tplData.orderPrice%}元</strong>
    </li>

</ul>