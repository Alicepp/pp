{%extends file="home/widget/gooditem/gooditem.tpl"%}
{%block name="item_var"%}
{%$isTuan=1%}
{%/block%}
{%block name="item_price"%}
<div class="car-price-box">
    <p class="car-price-em">
    <em>报名费：{%$list.group.entryPrice%}元</em>
    {%if $list.group.groupNum>0%}
    <span class="car-group-num"><b>{%$list.group.groupNum%}人报名</b></span>
    {%/if%}
    </p>
    <p class="car-price-p car-brand-p">
        <b>参与品牌：{%$list.group.serieNamesString%}</b>
    </p>
</div>
{%/block%}
{%block name="item_tags"%}
<div class="deals_tags">
<span class="yikou">巨惠购</span>
</div>
{%/block%}