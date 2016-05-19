{%block name="info_var"%}
{%if $tplData.gType == 2%}
{%$payType=2%}
{%/if%}
{%$giftInfo=$tplData.giftInfo%}
{%/block%}
<ul class="gc-order gc-order-{%$tplData.tpl%}">
    {%block name="info_autoName"%}
    <li>
        <label>适用车型：</label>
        <span>{%$tplData.autoName%}</span>
    </li>
    {%/block%}
    {%block name="info_emaoPrice"%}
    <li>
        <label>一 猫 价：</label>
        <span class="price-online">{%$tplData.emaoPrice|format_price%}</span>
    </li>
    {%/block%}

    {%block name="info_color"%}
    {%if $tplData.color%}
    <li>
        <label>颜 色：</label>
        <span>{%$tplData.color%}</span>
    </li>
    {%/if%}
    {%/block%}
    {%block name="info_parts"%}
    {%/block%}
    {%block name="info_gift"%}
    {%if $giftInfo.name%}
    <li class="box">
        <label>一猫赠品：</label>
        <ul class="gift-wrap flex1">
            <li >
                <span class="gc-gift"></span>
                <span>{%$giftInfo.name%}</span>
            </li>
        </ul>
    </li>
    {%/if%}
    {%/block%}
</ul>


