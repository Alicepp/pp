<!--
    @require "user.less"
-->
<div class="user-wap">
	{%if $smarty.get.ot==3%}
	{%widget name="gmobile:widget/page/user/nav.tpl" cls6="active"%}
	{%else%}
	{%widget name="gmobile:widget/page/user/nav.tpl" cls2="active"%}
	{%/if%}
    {%$num=count($tplData.orderList.data.data)%}
    <div class="list-con">
        {%widget name="gmobile:widget/page/user/list-data.tpl"%}
    </div>
    {%widget name="gmobile:widget/page/user/none.tpl" num=$num%}
</div>
{%script%}
require.async('./user.js',function(user){

user.init();
user.bindLoadMore();
});
{%/script%}