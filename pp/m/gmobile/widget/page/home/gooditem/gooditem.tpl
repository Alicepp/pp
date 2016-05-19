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

<a class="mall-product gooditem" href="/car/{%$list.id%}.html?type={%$typeMap[$list.tpl]%}">
    <div class="mall-img">
        {%if $list.isActivity==1%}
        <div class="one-icon5"></div>
        {%/if%}
        <div class="car-pro">
            <div class="car-layer2">{%$list.goodsName%}</div>
            <div class="car-desc">{%$list.sellLead%}</div>
            {%block name="item_price"%}
            <div class="car-price-layer"><span>{%$list.defemaoPrice|format_price%}{%if $list.multiple>1%}起{%/if%}</span><span class="guide-pirce">指导价：{%$list.defPrice%}万</span></div>
            {%/block%}
            <div class="buy-qiang">立即抢购</div>
        </div>
        {%block name="item_tags"%}
        <div class="car-posbox zhengche">
            一口价
        </div>
        {%/block%}
        <div class="car-img">
            <img lazy-src="{%$list.mainImg%}" alt="一猫{%$list.goodsName%}实时价格"/>
        </div>
    </div>
</a>
