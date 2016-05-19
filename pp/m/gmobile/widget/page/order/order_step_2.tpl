{%$dataPrice=$tplData%}
<!--
    @require "order_step.less"
-->
<div class="order-tt center">订单支付</div>
<section id="chooseWay" class="order-wrap">
   	<div class="order-box">
	   <h3 class="column-tt">省钱买车只需3步！</h3>
	   <ul class="order-step">
		   <li><i>1</i>填写购车信息并核对订单</li>
		   <li class="cur"><i>2</i>选择支付方式</li>
		   <li><i>3</i>购买成功</li>
	   </ul>
   	</div>
   	<div class="order-box">
   		<h3 class="column-tt">
   			选择支付方式
   		</h3>
   		<div class="pay-way-wrap">
   			<form id="goPay" action="/payredirect/" method="post" >
	   			<dl class="pay-way" data-name = "ZHIFUBAO">
		   			<dt class="alipay"></dt>
		   			<dd>
		   				<h3>支付宝</h3>
		   				<p>推荐支付宝用户使用</p>
		   				<span class="checked"></span>
		   			</dd>
		   		</dl>
		   		<dl class="pay-way" data-name = "WEIXIN" style="display: none;">
					<dt class="weixin"></dt>
					<dd>
						<h3>微信</h3>
						<p>推荐微信宝用户使用</p>
						<span class="unchecked"></span>
					</dd>
				</dl>
		   		<dl class="pay-way yl-tag" style="display: none">
		   			<dt class="yl"></dt>
		   			<dd>
		   				<h3>银行卡支付</h3>
		   				<p>支付行用卡.储蓄卡.无需开通网银</p>
		   				<span class="unchecked"></span>
		   			</dd>
		   		</dl>
		   		<input id="unionCard" type="hidden" value="ZHIFUBAO">
		   		<input type="hidden" name="orderId" value="{%$dataPrice.orderId%}"/>
	   		</form>
   		</div>
   	</div>
   	<p class="lock-info">车辆已成功锁定，请您在 <strong>30分钟</strong> 内进行网上支付，否则车辆将自动释放给其他用户</p>
</section>
<section id="bankList" class="order-wrap hide">
   	<ul class="choose-way box">
   		<li class="cur flex1 borderbox">信用卡</li>
   		<li class="flex1 borderbox">储蓄卡</li>
   	</ul>
   	<p class="lock-info">车辆已成功锁定，请您在 <strong>30分钟</strong> 内进行网上支付，否则车辆将自动释放给其他用户</p>
   	<div class="bank-tt">常用
        <a class="limit-link" href="{%$url.home%}faq/zhifuxiane/">点击查看各渠道支付限额情况</a>
    </div>
   	<section id="bankListWrap">
   		<div class="bank-list-wrap">
	   		<ul class="bank-list">
	   			<li data-name="CMB">
	   				<i class="zsyh"></i>
	   				招商银行
	   			</li>
	   			<li data-name="CCB">
	   				<i class="jsyh"></i>
	   				中国建设银行
	   			</li>
	   			<li data-name="BOCB2C">
	   				<i class="zgyh"></i>
	   				中国银行
	   			</li>
	   			<li data-name="ICBCB2C">
	   				<i class="gsyh"></i>
	   				中国工商银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">G</div>
	   		<ul class="bank-list">
	   			<li data-name="GDB">
	   				<i class="gfyh"></i>
	   				广发银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">P</div>
	   		<ul class="bank-list">
	   			<li data-name="SPABANK">
	   				<i class="payh"></i>
	   				平安银行
	   			</li>
	   			<li data-name="SPDB">
	   				<i class="pfyh"></i>
	   				浦发银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">S</div>
	   		<ul class="bank-list">
	   			<li data-name="SHBANK">
	   				<i class="shyh"></i>
	   				上海银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">X</div>
	   		<ul class="bank-list">
	   			<li data-name="CIB">
	   				<i class="xyyh"></i>
	   				兴业银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">Z</div>
	   		<ul class="bank-list">
	   			<li data-name="CMB">
	   				<i class="zsyh"></i>
	   				招商银行
	   			</li>
	   			<li data-name="CCB">
	   				<i class="jsyh"></i>
	   				中国建设银行
	   			</li>
	   			<li data-name="BOCB2C">
	   				<i class="zgyh"></i>
	   				中国银行
	   			</li>
	   			<li data-name="ICBCB2C">
	   				<i class="gsyh"></i>
	   				中国工商银行
	   			</li>
	   		</ul>
   		</div>
   		<div class="bank-list-wrap hide">
	   		<ul class="bank-list">
	   			<li data-name="CMB-DEBIT">
	   				<i class="zsyh"></i>
	   				招商银行
	   			</li>
	   			<li data-name="CCB-DEBIT">
	   				<i class="jsyh"></i>
	   				中国建设银行
	   			</li>
	   			<li data-name="BOC-DEBIT">
	   				<i class="zgyh"></i>
	   				中国银行
	   			</li>
	   			<li data-name="ICBC-DEBIT">
	   				<i class="gsyh"></i>
	   				中国工商银行
	   			</li>
	   			<li data-name="ABC">
	   				<i class="nyyh"></i>
	   				中国农业银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">G</div>
	   		<ul class="bank-list">
	   			<li data-name="GDB-DEBIT">
	   				<i class="gfyh"></i>
	   				广发银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">J</div>
	   		<ul class="bank-list">
	   			<li data-name="COMM-DEBIT">
	   				<i class="jtyh"></i>
	   				交通银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">P</div>
	   		<ul class="bank-list">
	   			<li data-name="SPA-DEBIT">
	   				<i class="payh"></i>
	   				平安银行
	   			</li>
	   			<li data-name="SPDB-DEBIT">
	   				<i class="pfyh"></i>
	   				浦发银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">X</div>
	   		<ul class="bank-list">
	   			<li data-name="">
	   				<i class="xyyh"></i>
	   				兴业银行
	   			</li>
	   		</ul>
	   		<div class="bank-tt">Z</div>
	   		<ul class="bank-list">
	   			<li data-name="CMB-DEBIT">
	   				<i class="zsyh"></i>
	   				招商银行
	   			</li>
	   			<li data-name="CCB-DEBIT">
	   				<i class="jsyh"></i>
	   				中国建设银行
	   			</li>
	   			<li data-name="BOC-DEBIT">
	   				<i class="zgyh"></i>
	   				中国银行
	   			</li>
	   			<li data-name="ICBC-DEBIT">
	   				<i class="gsyh"></i>
	   				中国工商银行
	   			</li>
	   			<li data-name="ABC">
	   				<i class="nyyh"></i>
	   				中国农业银行
	   			</li>
	   			<li data-name="CEB-DEBIT">
	   				<i class="gdyh"></i>
	   				中国光大银行
	   			</li>
	   			<li data-name="PSBC-DEBIT">
	   				<i class="yzcxyh"></i>
	   				中国邮政储蓄银行
	   			</li>
	   			<li data-name="CMBC">
	   				<i class="msyh"></i>
	   				中国民生银行
	   			</li>
	   			<li data-name="CITIC-DEBIT">
	   				<i class="zxyh"></i>
	   				中信银行
	   			</li>
	   		</ul>
   		</div>
  	</section>
</section>
   	<div class="order-sub">
        {%if $tplData.tpl==5||$tplData.tpl==6||$tplData.tpl==7||$tplData.tpl==8||$tplData.tpl==9%}
        <a class="sub-btn" href="#" id="btn-order-2" onclick="ga('send','event','gmall_wap','fukuan1_wap','{%$tplData.orderId%}');">去支付
        	<span class="order-hint">
				<i></i>
				<em>未提车随时退</em>
			</span>
        </a>
        {%else%}
        <a class="sub-btn" href="#" id="btn-order-2">去支付
        	<span class="order-hint">
				<i></i>
				<em>未提车随时退</em>
			</span>
        </a>
        {%/if%}
        <div class="order-sum">
            <p>实付金额：</p>
            <em>{%$dataPrice.price%}</em>
            <span>元</span>
        </div>
    </div>
{%script%}
    require.async('../../payment/payment.js',function(payment){
        payment.init();
    });
{%/script%}