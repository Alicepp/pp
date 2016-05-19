<!--
    @require "order_step.less"
-->
<div class="order-wrap">
   	<ul class="order-step">
		<li><em>省钱买车，只需<strong>3步</strong>：</em></li>
		<li><i>1</i>填写购车信息并核对订单</li>
		<li><span class="order-arrow"></span></li>
		<li><i>2</i>选择支付方式</li>
		<li><span class="order-arrow"></span></li>
		<li class="cur"><i>3</i>购买成功</li>
   	</ul>
   	<div class="pay-s">
   		<h2>恭喜您，购买成功！</h2>
   		<p>一猫特卖商城已收到您的{%$tplData.tpl_payType%}，同时也将提车相关信息以短信形式发送到手机中，请您查收！</p>
   		<ul>
   			<li>订单编号：<span>{%$tplData.tpl_orderId%} </span></li>
   			<li>{%$tplData.tpl_payType%}：<strong>{%$tplData.tpl_payPrice%}元</strong></li>
   		</ul>
   		<p>您还可以：<a class="see-pay" href="{%$tplData.tpl_payedOrdersUrl%}" target="_blank">查看已支付订单</a></p>
   		<div class="pay-s-pic">
   			<img src="{%$tplData.__imgDom%}{%$tplData.tpl_imgPic%}" alt=""/>
   		</div>
   	</div>
</div>
        {%script%}
            setTimeout(function(){ga('send', 'event', 'gmall', 'fukuan_success1','{%$tplData.tpl_orderId%}');},500)
        {%/script%}