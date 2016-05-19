<!--
    @require "item.less"
-->
{%extends file="gmobile/widget/page/user/list-item/item.tpl"%}
{%block name="info_text"%}
    <div class="dl box">
        <span class="dt">报名费：</span>
        <span class="dd">{%$orderInfo.group.entryPrice%}元</span>
    </div>
{%/block%}
{%block name="info_gift"%}
{%if count($orderInfo.gift)>0%}
    <div class="gifts" >
        {%foreach $orderInfo.gift as $item%}
        <p class="gift-item">{%$item.name%}</p>
        {%/foreach%}
    </div>
{%/if%}
{%/block%}