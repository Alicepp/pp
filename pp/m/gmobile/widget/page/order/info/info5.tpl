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