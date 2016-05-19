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
    "8"=>"tg-hdt",
    "9"=>"tg-hdt"
]%}

<a class="gooditem {%$cls%}" href="/car/{%$list.id%}.html?type={%$typeMap[$list.tpl]%}" target="_blank">
    <div class="item-border"></div>
    <div class="item-cont">
        <div class="item-top">
            {%block name="item_tags"%}
            <div class="deals_tags">
                <span class="yikou">一口价</span>
            </div>
            {%/block%}
            <div class="car-img">
                <img lazy-src="{%$list.mainImg%}" alt="一猫{%$list.goodsName%}实时价格"/>
                {%if $list.sellType==2%}<!--限时特惠-->
                <div class="time-limit"></div>
                {%/if%}
            </div>
            {%block name="item_price"%}
            <div class="car-price-box">
            {%if $isTuan%}
                <p class="car-price-em">
                    <em >
                        巨惠价：{%$list.group.groupPrice|format_price%}
                    </em>
                    <span class="small-price line-through">指导价：{%$list.defPrice%}万</span>
                </p>
                <p class="car-price-p">
                    {%if $list.fall>0%}
                    <span class="mark-down">最高降{%$list.fall|format_price%}</span>
                    {%/if%}
                    {%if $list.group.groupNum>0%}
                    <b class="car-group-num">{%$list.group.groupNum%}人报名</b>
                    {%/if%}
                </p>
            {%else%}
                <p class="car-price-em">
                    <em>
                    一猫价:{%$list.defemaoPrice|format_price%}{%if $list.multiple>1%}起{%/if%}
                    </em>
                </p>
                <p class="car-price-p">
                    {%if $list.fall>0%}
                    <span class="mark-down">最高降{%$list.fall|format_price%}</span>
                    {%/if%}
                    <span class="small-price line-through">指导价：{%$list.defPrice%}万</span>
                </p>
            {%/if%}
            </div>
            {%/block%}
        </div>
        <div class="item-bottom">
            <h3 title="{%$list.goodsName%}">{%$list.goodsName%}</h3>
            <p class="products-desc" title="{%$list.sellLead%}">{%$list.sellLead%}</p>
            {%if $list.sellType==2%}<!--限时特惠-->
            <p class="limit-box">
                <i></i>限时抢：<span class="home-time" nowTime="{%$smarty.now|date_format:'%Y/%m/%d,%H:%M:%S'%}" endTime="{%$list.endSellTimeFormat%}"></span>
            </p>
            {%/if%}
        </div>

    </div>
    {%if $list.isActivity==1%}
    <div class="fall5000"></div>
    {%/if%}
</a>
