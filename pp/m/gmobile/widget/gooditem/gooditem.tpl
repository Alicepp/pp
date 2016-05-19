{%block name="item_var"%}

{%/block%}
{%if $list.defemaoPrice<=0%}
{%$list.defemaoPrice=$list.minPrice%}
{%/if%}
{%if $list.defPrice<=0%}
{%$list.defPrice=$list.price%}
{%/if%}
{%$typeMap=[
    "1"=>"ykj",
    "2"=>"dkq",
    "3"=>"dzc",
    "5"=>"tg-ykj",
    "6"=>"tg-dkq",
    "7"=>"tg-dzc",
    "8"=>"tg-hdt"
]%}
<a class="mall-car gooditem" href="/car/{%$list.id%}.html?type={%$typeMap[$list.tpl]%}">
    {%if $list.isActivity==1%}
    <div class="one-icon5"></div>
    {%/if%}
    <div class="mall-car-pic center">

        <img lazy-src="{%$list.mainImg%}" alt="一猫{%$list.goodsName%}实时价格"/>
    </div>
    <div class="mall-car-info">
        <div class="car-lit">{%$list.goodsName%}</div>
        <div class="car-desc">{%$list.sellLead%}</div>
        {%block name="item_price"%}
            {%if $isTuan%}
            <div class="car-price-box">
                <em class="car-price-em">巨惠价：{%$list.group.groupPrice|format_price%}</em>
                <span class="small-price line-through">指导价：{%$list.defPrice%}万</span>
            </div>
            {%if $list.group.groupNum>0%}
            <div class="car-group-num"><b>{%$list.group.groupNum%}人报名</b></div>
            {%/if%}
            {%else%}
            <div class="car-price-box">
                <em class="car-price-em">
                一猫价：{%$list.defemaoPrice|format_price%}
                </em>
                {%if $list.multiple>1%}起{%/if%}
                <span class="small-price line-through">指导价：{%$list.defPrice%}万</span>
            </div>
            {%/if%}
        {%/block%}
    </div>
    {%block name="item_tags"%}
        <div class="car-posbox zhengche">
            一口价
        </div>
    {%/block%}
</a>