<!--
    @require "../../gooditem/gooditem.less"
    @require "../../wish/wish.less"
-->
{%$page=($tplData.page|default:1)%}

{%foreach $tplData.carList as $item%}
{%widget name="gmobile:widget/gooditem/gooditem`$item.tpl`.tpl" list=$item%}
{%/foreach%}
{%if $tplData.count==0&&$page==1%}
<input type="hidden" value="--DATA_STATUS:EMPTY--"/>
{%widget name="gmobile:widget/wish/wish.tpl" cls='noResult noMoreResult'%}
{%elseif $tplData.count<($page*10)%}
<div class="noMore center noMoreResult">
    没有更多了。。。
</div>
{%/if%}




