<div class="hot-sale dingzhi-border box level-nav level-nav-{%$datas.id%}" id="level-nav-{%$datas.id%}" data-id="{%$datas.id%}" style="border-color:{%$datas.color%};">
<div class="dingzhi flex1" id="content3" style="color:{%$datas.color%}">{%$datas.tit%}</div>
<a class="now-sale-more" href="{%$datas.searchurl%}">更多></a>
</div>
<div class="ding-img">
{%foreach $datas.goods as $item%}
<a href="{%$item['mlinkUrl']%}" class="cad-ding {%if $item@last%}car-ding-last{%/if%}">
    <img src="{%$item['mpic']%}" alt=""/>
</a>
{%/foreach%}

</div>