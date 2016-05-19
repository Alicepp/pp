<!--
    @require "item.less"
-->
{%extends file="gmobile/widget/page/user/detail-item/item.tpl"%}
{%block name="item_parts"%}
    {%foreach $tplData.orderInfo.partsGroup as $i=>$item%}
    {%if $item.groupName%}
        <div class="detail-dl box">
            <div class="detail-dt">{%$item.groupName%}：</div>
            <div class="">
            {%if $item.image&&$item.groupType==2%}
            <img src="{%$item.image%}" style="display: inline-block; height: 26px;margin-right:3px"/>
            {%/if%}
            {%$item.partsName%}
            </div>
        </div>
    {%/if%}
    {%/foreach%}
{%/block%}