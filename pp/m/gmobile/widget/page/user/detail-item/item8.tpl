<!--
    @require "item.less"
-->
{%extends file="gmobile/widget/page/user/detail-item/item.tpl"%}
 {%block name="item_info"%}
    <div class="detail-dl box">
        <div class="detail-dt">活动名称：</div>
        <div class="flex1">{%$tplData.orderInfo.goodsName%}</div>
    </div>
    <div class="detail-dl box">
        <div class="detail-dt">活动品牌：</div>
        <div class="flex1">{%$tplData.group.serieNamesString%}</div>
    </div>
    <div class="detail-dl box">
        <div class="detail-dt">活动时间：</div>
        <div class="flex1">{%$groupInfo.tuanHuodongtime|date_format:'%Y-%m-%d'%}</div>
    </div>
    <div class="detail-dl box">
        <div class="detail-dt">报 名 费：</div>
        <div class="flex1"><em>{%$groupInfo.entryPrice%}元</em></div>
    </div>
    {%if count($tplData.orderInfo.gift)>0%}
    <div class="detail-gift detail-dl box">
        <div class="detail-dt">一猫赠品：</div>
        <div class="flex1">
            {%foreach $tplData.orderInfo.gift as $item%}
            <p class="gift-item">{%$item.name%}</p>
            {%/foreach%}
        </div>
    </div>
    {%/if%}
    {%if $groupInfo.content%}
    <div class="detail-dl box">
        <div class="detail-dt">活动说明：</div>
        <div class="flex1">{%$groupInfo.content%}</div>
    </div>
    {%/if%}
 {%/block%}

