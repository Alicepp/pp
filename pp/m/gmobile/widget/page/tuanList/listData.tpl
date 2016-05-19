{%$page=($tplData.page|default:1)%}

{%foreach $tplData.autoList.data as $i=>$item%}
{%widget name="gmobile:widget/tuanitem/tuanitem`$item.tpl`.tpl" list=$item cls="tuanlistitem"%}
{%/foreach%}
{%if $tplData.autoList.count==0&&$page==1%}
<link rel="import" href="noresult.tpl?__inline">
{%widget name="gmobile:widget/wish/wish.tpl" cls='noResult noMoreResult'%}
{%elseif $tplData.autoList.count<($page*10)%}
<div class="noMore center noMoreResult">
    没有更多了。。。
</div>
{%/if%}




