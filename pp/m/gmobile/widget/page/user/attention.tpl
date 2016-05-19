<!--
    @require "user.less"
-->
<div class="user-wap">
{%widget name="gmobile:widget/page/user/nav.tpl" cls3="active"%}
    {%$num=0%}
{%foreach $tplData.data as $i=>$item%}
    {%if $item.following==1%}
    {%$num=$num+1%}
    <div class="remind-set">
        <div class="list-center">
            {%$carInfo=$item['carinfo']%}
            {%$carTit=($carInfo['brandName']|cat:"-"|cat:$carInfo['serieName']|cat:"-"|cat:$carInfo['autoName'])%}
            {%$carTit=$item['goodsName']%}
            {%widget name="gmobile:widget/page/user/info/info`$item.goodsType`.tpl" item=$item carTit=$carTit%}
            <!--1：未开售 2 抢购 3 已卖光 4 已结束-->
            {%if $item.group.id%}
            {%widget name="gmobile:widget/page/user/info/tbtn`$item.group.__tuanState`.tpl" item=$item%}
            {%else%}
            {%widget name="gmobile:widget/page/user/info/btn`$item.state`.tpl" item=$item%}
            {%/if%}

        </div>
    </div>
    {%/if%}
{%/foreach%}
    {%widget name="gmobile:widget/page/user/none.tpl" num=$num%}
</div>
{%script%}
require.async('./user.js',function(user){
user.init();
})

{%/script%}