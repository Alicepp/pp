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
{%block name="item_pay"%}
    <div class="detail-dl box">
    <div class="detail-dt">在线支付：</div>
    <div class="flex1">
        <em>{%$tplData.orderInfo.price%}元</em>（应付款）
        {%if $tplData.orderInfo.discount>0 || $tplData.ticketInfo.ticketInfoRes.onlinenum%}
        =
        {%if $tplData.orderInfo.gType!=3%}
        <em>{%$tplData.orderInfo.deposit%}元</em>（意向金）
        {%else%}
        <em>{%$tplData.group.groupPrice%}元</em>(全款)
        {%if $tplData.orderInfo.discount>0%}
        -<em>{%$tplData.orderInfo.discount%}元</em>（全款优惠）
        {%/if%}
        {%/if%}
        {%if $tplData.ticketInfo.ticketInfoRes.onlinenum%}
        -<em>{%$tplData.ticketInfo.ticketInfoRes.onlinePay%}元</em>(优惠券)
        {%/if%}
        {%/if%}
    </div>
    </div>
    <div class="detail-dl box">
    <div class="detail-dt">到店支付：</div>
    {%if $tplData.orderInfo.deposit>0||$tplData.ticketInfo.ticketInfoRes.offlinenum%}
    {%if $tplData.ticketInfo.ticketInfoRes.offlinenum%}
    <div class="flex1"><em>{%$tplData.group.offlinePrice%}元</em>=<em>{%$tplData.group.groupPrice%}元</em>（巨惠价）-<em>{%$tplData.orderInfo.deposit%}元</em>（意向金）-<em>{%$tplData.ticketInfo.ticketInfoRes.offlinePay%}元</em>（优惠券）</div>
    {%else%}
    <div class="flex1"><em>{%$tplData.group.offlinePrice%}元</em>=<em>{%$tplData.group.groupPrice%}元</em>（巨惠价）-<em>{%$tplData.orderInfo.deposit%}元</em>（意向金）</div>
    {%/if%}
    {%else%}
    <div class="flex1"><em>{%$tplData.group.offlinePrice%}元</em></div>
    {%/if%}
    </div>
{%/block%}