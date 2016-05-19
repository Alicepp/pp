<ul class="gc-order  gc-order-3">
    <li>
        <label>适用车型：</label>
        <span>{%$tplData.autoName%}</span>
    </li>
    <li>
        <label>一 猫 价：</label>
        <span>{%$tplData.emaoPrice|format_price%}</span>
    </li>
    {%foreach $tplData.partsGroup.parts as $i=>$item%}
    <li>
        <label>{%$item.groupName%}：</label>
        <span>
            {%if $item.image&&$item.groupType==2%}
            <img src="{%$item.image%}" style="display: inline-block;height: 26px;margin-right:3px;vertical-align: middle;"/>
            {%/if%}
            {%$item.partsName%}
        </span>
    </li>
    {%/foreach%}
    {%if $giftInfo.name%}
    <li>
        <label>一猫赠品：</label>
        <span class="gc-gift"></span>
        <span>{%$giftInfo.name%}</span>
    </li>
    {%/if%}
</ul>