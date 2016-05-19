
{%$status=[
'1'=>'待付款',
'2'=>'已付款(待提车)',
'3'=>'订单已取消',
'4'=>'提车完成',
'5'=>'退款',
'6'=>'退款申请未通过',
'7'=>'退款申请已通过',
'8'=>'退款完成'
]
%}
{%foreach $tplData.orderList.data.data as $orderInfo%}
{%widget name="gmobile:widget/page/user/list-item/item`$orderInfo.goods.goodsType`.tpl" orderInfo=$orderInfo%}
{%/foreach%}

<script>
    {%if !count($tplData.orderList.data.data)%}
        window.isEnd=1;
    {%/if%}
</script>

