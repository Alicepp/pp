{%extends file="gmobile/widget/page/detail/info/info.tpl"%}
{%block name="info_var"%}
{%$emaoprice=$carInfo.defemaoPrice%}
{%$number=$color.number%}
{%/block%}
{%block name="info_input"%}
<input type="hidden" name="autoId" value="{%$goodInfo.autoId%}"/>
<input type="hidden" name="gType" value="2"/>
{%/block%}
{%block name="tuan_price"%}
{%/block%}
{%block name="tuan_progress"%}
{%/block%}