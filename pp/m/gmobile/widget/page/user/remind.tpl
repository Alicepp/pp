<!--
    @require "user.less"
-->
<div class="user-wap">
    {%widget name="gmobile:widget/page/user/nav.tpl" cls4="active"%}
    {%$num=0%}
    {%foreach $tplData.data as $i=>$item%}
    {%if $item.sms==0&&$item.gid%}
    {%$num=$num+1%}
    <div class="remind-set">
        <div class="list-center">
            {%$carInfo=$item['carinfo']%}
            {%$carTit=($carInfo['brandName']|cat:"-"|cat:$carInfo['serieName']|cat:"-"|cat:$carInfo['autoName'])%}
            {%$carTit=$item['goodsName']%}
            {%widget name="gmobile:widget/page/user/info/info`$item.goodsType`.tpl" item=$item carTit=$carTit%}
            <div class="remind-liter">我不想买这辆车了 <span class="remind-btn remind-cancel" data-id="{%$item.gid%}">取消提醒</span></div>
        </div>
    </div>
    {%/if%}
    {%/foreach%}
    {%widget name="gmobile:widget/page/user/none.tpl" num=$num%}

</div>
{%script%}
require.async('./user.js',function(user){
 user.init({url:'{%$url.home%}?c=users/order&a=lists'});
})

{%/script%}