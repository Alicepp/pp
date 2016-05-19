{%extends file="gmobile/widget/page/detail/info/info.tpl"%}
{%block name="info_var"%}
{%$emaoprice=$matrixItem.price%}
{%$number=$matrixItem.num%}
{%/block%}
{%block name="info_input"%}
<input type="hidden" name="partsid" value="{%$matrixKey%}"/>
<input type="hidden" name="gType" value="2"/>
{%/block%}
{%block name="info_auto"%}
{%/block%}
{%block name="info_color"%}
    <dl class="borderBt box" pageCls="page-fitting">
    <dt class="center">选择配件</dt>
    <dd class="choose-parts flex1 center-v" data-id="{%$matrixKey%}">
        已选<span class="font-red">{%count($tplData.parts.group)%}</span>件/可选{%$tplData.parts.partsNum%}件
    </dd>
    <!--<dd num="{%$color.number%}" class="partsNumdd  flex1 center-v">-->
    <!--{%if $matrixItem.num>0%}-->
    <!--还剩{%$matrixItem.num%}辆-->
    <!--{%else%}-->
    <!--售罄-->
    <!--{%/if%}-->
    <!--</dd>-->
    </dl>
{%/block%}
{%block name="tuan_price"%}
{%/block%}
{%block name="tuan_progress"%}
{%/block%}