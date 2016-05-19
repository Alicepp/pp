{%extends file="gmobile/widget/gooditem/gooditem.tpl"%}
{%block name="item_var"%}
{%$isTuan=1%}
{%/block%}
{%block name="item_price"%}
<div class="car-price-box">
    <em class="car-price-em">报名费：{%$list.group.entryPrice%}元</em>
    {%if $list.group.groupNum>0%}
    <span class="car-group-num"><b>{%$list.group.groupNum%}人报名</b></span>
    {%/if%}
</div>
<p class="car-brand-p">
    <b>参与品牌：{%$list.group.serieNamesString%}
    </b>
</p>
{%/block%}
{%block name="item_tags"%}
    <div class="car-posbox zhengche">
    巨惠购
    </div>
{%/block%}