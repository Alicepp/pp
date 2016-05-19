
<div id="userNav">
	<ul class="user-nav">
	    <li class="{%$cls2%}"><a href="{%$url.user%}?c=users/order&a=index">我的购车订单</a></li>
	    <li class="{%$cls6%}"><a href="{%$url.user%}?c=users/order&a=index&ot=3">巨惠购</a></li>
	    <li class="{%$cls5%}"><a href="{%$url.user%}?c=user/installmentorder&a=index">我的分期订单</a></li>
	    <li class="{%$cls3%}"><a href="{%$url.user%}?c=user/follow&a=followingset">我关注的商品</a></li>
	    <li class="{%$cls4%}"><a href="{%$url.user%}?c=sms&a=getsmsset">提醒设置</a></li>
    </ul>
</div>
{%script%}
	require.async('common:widget/ui/plugin/iscroll.js',function(iScroll){
			var oWe = $(".user-nav").width() + 5;
            var $active=$('.user-nav .active');
			$("#userNav").width("100%");
			$(".user-nav").width(oWe);
            var lineW=$("#userNav").width();
			if(oWe <= lineW){
				$(".user-nav").width(lineW);
			}
			var myScroll = new iScroll(document.getElementById('userNav'),{
			        hScroll: true,
			        useTransform: false,
			        hScrollbar: false,
			        vScroll: false,
			        checkDOMChanges: true
			});
            var activeLeft=Math.floor($active.offset().left);
            var activeWidth=Math.floor($active.width());
            var curLeft=Math.max(lineW-(activeLeft+activeWidth),lineW-oWe)
            if(curLeft<0){
            $(".user-nav").css('left',curLeft)
            }
		});
	
{%/script%}