{%block name="item_var"%}

{%/block%}

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

<a class="tuanitem {%$itemCls%} {%$cls%}" href="/car/{%$list.id%}.html?type={%$typeMap[$list.tpl]%}">
    {%block name="item_img"%}
    <div class="item-top">
        <img lazy-src="{%$list.mainImg%}" alt="一猫{%$list.goodsName%}实时价格"/>
    </div>
    {%/block%}
    {%block name="item_info"%}
    <div class="item-center">
        <h3 title="{%$list.goodsName%}">{%$list.goodsName%}</h3>
        <p class="products-desc" title="{%$list.description%}">{%$list.description%}</p>
    </div>
    <div class="item-bottom">
        <p class="tuan-date">截止时间：{%$list.endSellTime|date_format:'%Y-%m-%d'%}</p>
        <p class="tuan-num">已购人数：{%$list.group.groupNum%}人</p>
        <div class="tuan-btn" onclick="ga('send','event','gmall_wap','ljbaoming_wap','{%$list.id%}');">立即抢购</div>
    </div>
    {%/block%}
</a>
