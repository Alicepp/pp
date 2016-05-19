{%extends file="gmall/widget/page/detail/info/info.tpl"%}
{%block name="info_input"%}
    <input type="hidden" name="color" value=""/>
    <input type="hidden" name="gId" value="{%$carInfo.id%}"/>
    <input type="hidden" name="gType" value="2"/>
    <input type="hidden" name="formhash" value="{%$tplData.formHash%}"/>
{%/block%}
{%block name="info_group"%}
{%/block%}
{%block name="info_group_btns"%}
{%/block%}