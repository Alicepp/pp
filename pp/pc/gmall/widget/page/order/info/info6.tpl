{%extends file="gmall/widget/page/order/info/info.tpl"%}
{%block name="info_var"%}
{%$payType=2%}
{%/block%}
{%block name="info_emaoPrice"%}
{%/block%}
{%block name="info_di"%}
<li>
    <label>到店抵扣：</label>
    <span>{%$tplData.groupPrice|format_price%}</span>
</li>
{%/block%}