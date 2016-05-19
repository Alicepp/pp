<!--
    @require "order_step.less"
-->
<div class="order-tt center">订单支付</div>
<section class="order-wrap">
   	<div class="order-box">
	   <h3 class="column-tt">省钱买车只需3步！</h3>
	   <ul class="order-step">
		   <li><i>1</i>填写购车信息并核对订单</li>
		   <li><i>2</i>选择支付方式</li>
		   <li class="cur"><i>3</i>购买成功</li>
	   </ul>
	</div>
   	<div class="pay-s">
   		<h2>恭喜您，购买成功！</h2>
   		<p>一猫新车商城已收到您的{%$tplData.tpl_payType%}，同时也将提车相关信息以短信形式发送到手机中，请您查收！</p>
   		<ul>
   			<li><a class="see-pay" href="{%$tplData.tpl_payedOrdersUrl%}" >查看订单</a>(<span class="time-num">10</span>s后自动跳转)</li>
   		</ul>
   	</div>
</section>

        {%script%}
        ;(function(){
            function downTime($el,callback){
                   var time=$el.html()||'';
                   var callee=arguments.callee;
                   var that=this;
                    time=$.trim(time)-0;
                    that.timer&&clearTimeout(that.timer);
                    if(time<=0){
                        callback&&callback.call(this);
                        return
                    };
                    that.timer=setTimeout(function(){
                        $el.html(--time);
                        callee.call(that,$el,callback)
                    },1000);


            }
            $.fn.downTime=function(callback){
                for(var i=0;i<this.length;i++){
                  downTime.call(this[i],$(this[i]),callback)
                }
            }
            $('.time-num').downTime(function(){
                var href=$('.see-pay').attr('href');
                href&&(location.href=href);
            });
        })();
        require.async('common:widget/ui/base/log.js',function(log){
            ga('send','event','gmall_wap','fukuan_success1_wap','{%$tplData.tpl_orderId%}');
        });
        {%/script%}