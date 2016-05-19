{%extends file="gmobile/widget/page/order/info/info.tpl"%}
{%block name="info_emaoPrice"%}
<li>
<label>巨惠价：</label>
<span>{%$tplData.groupPrice|format_price%}</span>
</li>
{%if $tplData.curDiscount>0%}
<li>
<label>一 猫 价：</label>
<span>{%$tplData.emaoPrice|format_price%}</span>
</li>
{%/if%}
{%/block%}
{%block name="info_color"%}
{%/block%}
{%block name="info_parts"%}
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
{%/block%}