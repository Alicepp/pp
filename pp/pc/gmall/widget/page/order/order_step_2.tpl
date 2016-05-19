<!--
    @require "order_step.less"
    @require "../pop.less"
-->
<div class="order-wrap">
   	<ul class="order-step">
		<li><em>省钱买车，只需<strong>3步</strong>：</em></li>
		<li><i>1</i>填写购车信息并核对订单</li>
		<li><span class="order-arrow"></span></li>
		<li class="cur"><i>2</i>选择支付方式</li>
		<li><span class="order-arrow"></span></li>
		<li><i>3</i>购买成功</li>
   	</ul>
   	<p class="lock-info">车辆已成功锁定，请您在 <strong>30分钟</strong> 内进行网上支付，否则车辆将自动释放给其他用户</p>
   	<div class="order-pay">
   		<div class="pay-tt">
   			请选择支付方式  <a href="{%$url.home%}faq/zhifuxiane/" target="_blank">点击查看各渠道支付限额情况</a>
   		</div>
   		<form id="goPay" action="{%$url.home%}payredirect/" target="_blank" method="post" >
	   		<h2>支付宝支付</h2>
	   		<ul class="pay-wrap">
		   		<li>
		   			<input id="alipay" type="radio" name="payWay" value="ZHIFUBAO" checked="checked"/>
		   			<label for="alipay" class="pay-way alipay"></label>
		   		</li>
		   	</ul>
	   		<h2>网上银行支付（支持储蓄卡和信用卡）</h2>
	   		<h4>信用卡</h4>
	   		<ul class="pay-wrap">
		   		<li>
		   			<input id="cc-ICBC" type="radio" name="payWay" value="ICBCB2C"/>
		   			<label for="cc-ICBC" class="pay-way icbc"></label>
		   		</li>
		   		<li>
		   			<input id="cc-XYYH" type="radio" name="payWay" value="CIB"/>
		   			<label for="cc-XYYH" class="pay-way xyyh"></label>
		   		</li>
		   		<li>
		   			<input id="cc-SHYH" type="radio" name="payWay" value="SHBANK"/>
		   			<label for="cc-SHYH" class="pay-way shyh"></label>
		   		</li>
		   		<li>
		   			<input id="cc-CMB" type="radio" name="payWay" value="CMB"/>
		   			<label for="cc-CMB" class="pay-way cmb"></label>
		   		</li>
		   		<li>
		   			<input id="cc-CCB" type="radio" name="payWay" value="CCB"/>
		   			<label for="cc-CCB" class="pay-way ccb"></label>
		   		</li>
		   		<li>
		   			<input id="cc-BOC" type="radio" name="payWay" value="BOCB2C"/>
		   			<label for="cc-BOC" class="pay-way boc"></label>
		   		</li>
		   		<li>
		   			<input id="cc-payh" type="radio" name="payWay" value="SPABANK"/>
		   			<label for="cc-payh" class="pay-way payh"></label>
		   		</li>
		   		<!--<li>
		   			<input id="cc-BCM" type="radio" name="payWay" value=""/>
		   			<label for="cc-BCM" class="pay-way bcm"></label>
		   		</li>-->
		   		<!--<li>
		   			<input id="cc-CEB" type="radio" name="payWay" value=""/>
		   			<label for="cc-CEB" class="pay-way ceb"></label>
		   		</li>-->
		   		<li>
		   			<input id="cc-pfyh" type="radio" name="payWay" value="SPDB"/>
		   			<label for="cc-pfyh" class="pay-way pfyh"></label>
		   		</li>
		   		<li>
		   			<input id="cc-gfyh" type="radio" name="payWay" value="GDB"/>
		   			<label for="cc-gfyh" class="pay-way gfyh"></label>
		   		</li>
		   		<!--<li>
		   			<input id="cc-zxyh" type="radio" name="payWay" value=""/>
		   			<label for="cc-zxyh" class="pay-way zxyh"></label>
		   		</li>-->
		   	</ul>
		   	<h4>储蓄卡</h4>
	   		<ul class="pay-wrap">
		   		<li>
		   			<input id="ICBC" type="radio" name="payWay" value="ICBC-DEBIT"/>
		   			<label for="ICBC" class="pay-way icbc"></label>
		   		</li>
		   		<li>
		   			<input id="ABC" type="radio" name="payWay" value="ABC"/>
		   			<label for="ABC" class="pay-way abc"></label>
		   		</li>
		   		<li>
		   			<input id="XYYH" type="radio" name="payWay" value="CIB"/>
		   			<label for="XYYH" class="pay-way xyyh"></label>
		   		</li>
		   		<li>
		   			<input id="CP" type="radio" name="payWay" value="PSBC-DEBIT"/>
		   			<label for="CP" class="pay-way cp"></label>
		   		</li>
		   		<li>
		   			<input id="CMB" type="radio" name="payWay" value="CMB-DEBIT"/>
		   			<label for="CMB" class="pay-way cmb"></label>
		   		</li>
		   		<li>
		   			<input id="CCB" type="radio" name="payWay" value="CCB-DEBIT"/>
		   			<label for="CCB" class="pay-way ccb"></label>
		   		</li>
		   		<li>
		   			<input id="BOC" type="radio" name="payWay" value="BOC-DEBIT"/>
		   			<label for="BOC" class="pay-way boc"></label>
		   		</li>
		   		<li>
		   			<input id="msyh" type="radio" name="payWay" value="CMBC"/>
		   			<label for="msyh" class="pay-way msyh"></label>
		   		</li>
		   		<li>
		   			<input id="BCM" type="radio" name="payWay" value="COMM-DEBIT"/>
		   			<label for="BCM" class="pay-way bcm"></label>
		   		</li>
		   		<li>
		   			<input id="CEB" type="radio" name="payWay" value="CEB-DEBIT"/>
		   			<label for="CEB" class="pay-way ceb"></label>
		   		</li>
		   		<li>
		   			<input id="pfyh" type="radio" name="payWay" value="SPDB-DEBIT"/>
		   			<label for="pfyh" class="pay-way pfyh"></label>
		   		</li>
		   		<li>
		   			<input id="gfyh" type="radio" name="payWay" value="GDB-DEBIT"/>
		   			<label for="gfyh" class="pay-way gfyh"></label>
		   		</li>
		   		<li>
		   			<input id="payh" type="radio" name="payWay" value="SPA-DEBIT"/>
		   			<label for="payh" class="pay-way payh"></label>
		   		</li>
		   		<li>
		   			<input id="zxyh" type="radio" name="payWay" value="CITIC-DEBIT"/>
		   			<label for="zxyh" class="pay-way zxyh"></label>
		   		</li>
		   	</ul>
		   	<input type="hidden" name="orderId" value="{%$tplData.orderId%}"/>
		</form>
   	</div>
   	<div class="order-sub mt0">
        {%if $tplData.tpl==5||$tplData.tpl==6||$tplData.tpl==7||$tplData.tpl==8||$tplData.tpl==9%}
   		<a class="sub-btn" href="javascript:" id="btn-order-2" onclick="ga('send', 'event','gmall','fukuan1','{%$tplData.orderId%}');">去付款</a>
        {%else%}
        <a class="sub-btn" href="javascript:" id="btn-order-2" onclick="return true;">去付款</a>
        {%/if%}
   		<div class="order-sum">实付款： <i></i><em>{%$tplData.price%}</em> <span>元</span></div>
   		<span class="order-hint">
   			<i></i>
   			未提车随时退
   		</span>
   	</div>
</div>
<div class="pop">
    <div class="pop-bg"></div>
    <div class="pop-cont">
	    <div class="pop-cont-bg"></div>
	   	<div class="pop-box">
	   	</div>
	 	<div class="pop-close"></div>
    </div>
</div>
{%script%}
    require.async('../../payment/payment.js',function(payment){
        payment.init("{%$tplData['tpl_payedOrdersUrl']%}");
    });
{%/script%}