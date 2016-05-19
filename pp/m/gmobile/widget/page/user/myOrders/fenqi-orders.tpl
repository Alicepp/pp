{%widget name="gmobile:widget/page/user/nav.tpl" cls5="active"%}

<div class="myOrder">
    {%$num=count($tplData.orderList.list)%}
	{%widget name="gmobile:widget/page/user/myOrders/order-page.tpl"%}
    {%widget name="gmobile:widget/page/user/none.tpl" num=$num%}
</div>
{%script%}
require.async('./fenqi-orders.js',function(orderDe){
	orderDe.bindLoadMore();
});
{%/script%}