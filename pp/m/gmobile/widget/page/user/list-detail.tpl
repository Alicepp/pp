<!--
    @require "user.less"
-->
{%$autoName=$tplData['orderInfo']['autoName']%}
{%$lit=($autoName['subBrandName']|cat:$autoName['serieName']|cat:$atuoName['autoName'])%}
{%$paid=($tplData.orderInfo.emaoPrice-$tplData.orderInfo.price-$tplData.ticketInfo.ticketInfoRes.offlinePay)%}
{%$paidcou=($tplData.orderInfo.emaoPrice-$tplData.orderInfo.couponValue-$tplData.ticketInfo.ticketInfoRes.offlinePay)%}
{%$gift=$tplData['orderInfo']['gift']%}
{%$giftInfo=($gift['name'])%}
{%$stateList=[
    '1'=>'未审核',
    '2'=>'审核已通过',
    '3'=>'审核未通过',
    '4'=>'已返赠'
]%}
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

{%$groupStatus=[
'1'=>'巨惠购进行中',
'2'=>'巨惠购成功',
'3'=>'巨惠购失败'
]%}

{%if $orderInfo.deposit>0%}
{%$tplData.orderInfo.discount=0%}
{%/if%}

{%if $smarty.get.ot==3%}
{%widget name="gmobile:widget/page/user/nav.tpl" cls6="active"%}
{%else%}
{%widget name="gmobile:widget/page/user/nav.tpl" cls2="active"%}
{%/if%}
{%widget name="gmobile:widget/page/user/detail-item/item`$tplData.orderInfo.goodsType`.tpl" orderInfo=$tplData.orderInfo%}
{%script%}
require.async('./user.js',function(user){
user.init();
});
var map=require('gmobile:widget/map/map.js');
var distanceParent = $('.location-box');
var distanceAddress = $(".distance");
function getLocation(){
    if (navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showPosition);
    }
    else{distanceAddress.innerHTML="该浏览器不支持获取地理位置。";}
}
function showPosition(position){
    var longitude= position.coords.latitude;
    var latitude =position.coords.latitude;
    map.getDistance(longitude, latitude,function(distance){
    distance?distanceParent.html('<i class="location-ico"></i>'+'<strong class="distance">距你'+distance+'</strong>').show():distanceParent.hide();
    });
}
getLocation();
{%/script%}