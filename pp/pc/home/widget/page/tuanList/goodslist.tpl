<!--
    @require "goodslist.less"
-->
<div class="goodslist tuanlist page-center">
    <div class="goods-ul clearfix">
    {%foreach $tplData.autoList.data as $i=>$item%}
        {%widget name="home:widget/tuanitem/tuanitem`$item.tpl`.tpl" list=$item%}
     {%/foreach%}
    </div>
    <div class="ad-banner" style="display: none">
        <a href=""><img src="../home/temp/pic4.png" alt=""/></a>
    </div>
</div>
{%widget name="home:widget/paging/paging.tpl"%}
{%if count($tplData.autoList.data)==0%}
<link rel="import" href="noresult.tpl?__inline">
{%/if%}
{%widget name="common:widget/wish/wish.tpl"%}