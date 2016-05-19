{%extends file="gmall/widget/page/order/info/info.tpl"%}
{%block name="info_color"%}
{%/block%}
{%block name="info_autoName"%}
<li>
    <label>活动品牌：</label>
    <span>{%foreach $tplData.subBrandNameArr as $item%}{%$item%}&nbsp;{%/foreach%}
    </span>
</li>
{%/block%}
{%block name="info_emaoPrice"%}
<li>
    <label>报 名 费：</label>
    <span class="price-online" price="{%$tplData.orderPrice%}">{%$tplData.orderPrice%}元</span>
</li>
{%/block%}
{%block name="info_payType"%}
{%/block%}
{%block name="info_gift"%}
{%if count($giftInfo)>0%}
    <li>
        <label>一猫赠品：</label>
        <ul class="gift-wrap">
            {%foreach $giftInfo as $item%}
            <li>
                <span class="gc-gift"></span>
                <span>{%$item.name%}</span>
            </li>
            {%/foreach%}
        </ul>
    </li>
{%/if%}
{%/block%}
