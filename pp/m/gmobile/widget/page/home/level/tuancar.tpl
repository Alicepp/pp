
{%$len=$datas.len%}
{%$index=($len-($len%2))%}
<div class="hot-sale hot-border box level-nav level-nav-{%$datas.id%}" data-id="{%$datas.id%}"
        style="color:{%$datas.color%};border-color:{%$datas.color%};"
        >
    <div class="hot-sale-lit flex1" style="color:{%$datas.color%}">{%$datas.tit%}</div>
    <a class="moreLink now-sale-more" href="{%$datas.searchurl%}" >更多&gt;</a>
</div>
<div class="products clearfix">
<div class="products-list">

        {%$i=0%}
        {%foreach $datas.goods as $item%}
        {%if $i>=$index||$i>=4%}
        {%break%}
        {%/if%}
        {%if ($i%2)==1%}
        {%$cls='lastitem'%}
        {%else%}
        {%$cls=''%}
        {%/if%}
        {%$i=($i+1)%}
        {%widget name="gmobile:widget/tuanitem/tuanitem`$item.tpl`.tpl" list=$item cls=$cls%}
        {%/foreach%}

</div>
</div>
