{%extends file="gmall/widget/page/detail/info/info.tpl"%}
{%block name="info_var"%}
{%$emaoprice=$matrixItem.price%}
{%$number=$matrixItem.num%}
{%/block%}
{%block name="info_input"%}
<input type="hidden" name="color" value=""/>
<input type="hidden" name="gId" value="{%$carInfo.id%}"/>
<input type="hidden" name="gType" value="2"/>
<input type="hidden" name="partsid" value="{%$matrixKey%}"/>
<input type="hidden" name="formhash" value="{%$tplData.formHash%}"/>
{%/block%}
{%block name="info_auto"%}
{%/block%}
{%block name="info_color"%}
{%/block%}
{%block name="info_dzc"%}
<div class="dl-box">
    <div class="group-list">
        {%$k=0%}
        {%foreach $tplData.parts.group as $i=>$item%}
        <dl class="dl-group grouptype-{%$item.type%}"  groupId="{%$item.id%}">

            <dt>{%$item.groupName%}：</dt>
            <dd>
                {%foreach $item.parts as $i=>$part%}
                <a id="parts-item-{%$part.id%}" title="{%$part.partsName%}" groupId="{%$item.id%}" partId="{%$part.id%}" class="parts-item {%if $part@first%}selected{%/if%} " href="javascript:void(0)">
                    {%if $item.type==2%}
                    <div class="parts-item-img">
                        <img src="{%$part.image%}" alt=""/>
                    </div>
                    <div class="parts-item-name" >
                        {%$part.partsName%}
                    </div>
                    {%else%}
                    <div class="parts-item-txt ">
                        <span>{%$part.partsName%}</span>
                    </div>
                    {%/if%}
                </a>
                {%/foreach%}
            </dd>
        </dl>
        {%$k=$k+1%}
        {%/foreach%}
    </div>
</div>
{%/block%}
{%block name="info_group"%}
{%/block%}
{%block name="info_group_btns"%}
{%/block%}