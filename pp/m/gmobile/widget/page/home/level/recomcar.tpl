<div class="hot-sale hot-border box level-nav level-nav-{%$datas.id%}" id="level-nav-{%$datas.id%}"  data-id="{%$datas.id%}"
           style="border-color:{%$datas.color%};"
        >
    <div class="hot-sale-lit flex1" style="color:{%$datas.color%}">{%$datas.tit%}</div>
    <a href="{%$datas.searchurl%}" class="now-sale-more">更多></a>
</div>
<div class="ajax-html">
    {%foreach $datas.goods as $item%}
    {%widget name="gmobile:widget/page/home/gooditem/gooditem`$item.tpl`.tpl" list=$item%}
    {%/foreach%}
</div>