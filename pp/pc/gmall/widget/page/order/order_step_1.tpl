{%$giftInfo=$tplData.giftInfo%}
<!--
    @require "order_step.less"
-->
<div class="order-wrap">
   	<ul class="order-step">
		<li><em>省钱买车，只需<strong>3步</strong>：</em></li>
		<li class="cur"><i>1</i>填写购车信息并核对订单</li>
		<li><span class="order-arrow"></span></li>
		<li><i>2</i>选择支付方式</li>
		<li><span class="order-arrow"></span></li>
		<li><i>3</i>购买成功</li>
   	</ul>
    {%if $tplData.bankId%}
    {%widget name="gmall:widget/page/order/pay/pay.tpl"%}
    {%/if%}
   	<div class="order-check clearfix">
   		<div class="step-lt borderbox">
	   		<p class="tt">填写购车信息</p>
	   		<form action="" method="post">
                <input id="formHash" type="hidden" name="formhash" value="{%$tplData.formhash%}"/>
                <input id="autoId" type="hidden" name="autoId" value="{%$tplData.autoId%}"/>
                <input type="hidden" id="partsid" name="partsid" value="{%$tplData.partsid%}"/>
                <input type="hidden" id="depositId" name="depositId" value="{%$tplData.depositId%}"/>
                <input type="hidden" id="goodsId" name="goodsId" value="{%$tplData.goodsId%}"/>
                <input type="hidden" id="colorId" name="colorId" value="{%$tplData.colorId%}"/>
                <input type="hidden" id="gType" name="gType" value="{%$tplData.gType%}"/>
                <input type="hidden" id="pointId" name="pointId" value="{%$tplData.pointId%}"/>
                <input type="hidden" id="bankId" name="bankId" value="{%$tplData.bankId%}"/>
                <input type="hidden" id="loanRatio" name="loanRatio" value="{%$tplData.loanRatio%}"/>
                <input type="hidden" id="firstPay" name="firstPay" value="{%$tplData.firstPay%}"/>
                <input type="hidden" id="stag" name="stag" value="{%$tplData.stag%}"/>
                <input type="hidden" id="cityId" name="cityId" value="{%$tplData.cityId%}"/>
                <input type="hidden" id="dealerid" name="dealerid" value="{%$tplData.dealerid%}"/>

                <ul class="gc-info">
		   			<li>
		   				<label>购车人：</label>
		   				<input id="username" type="text" maxlength="30" value=""/>
		   				<em><i>*</i>需填写最终购车发票人姓名</em>
		   			</li>
		   			<li>
		   				<label>手机号码：</label>
		   				<input id="phoneNumber" type="text" value="" />
		   				<em><i>*</i>用于接收购车验证码，请确保正确</em>
		   			</li>
		   			<li  style="display: none;">
		   				<label>身份证号：</label>
		   				<input id="IDcard" type="text" value="" />
		   				<em><i>*</i>需填写最终购车发票人身份证号</em>
		   			</li>
		   			<li>
		   				<label>购车城市：</label>
		   				<span>{%$tplData.city%}</span>
		   			</li>

                    <li style="{%if $tplData.bankId%}display:none;{%/if%}">
                        <label>预计提车时间：</label>
                    <span class="calendar-wrap">
                        <input id="calendarDate" name="planFetchTime" type="text" value="{%$smarty.now|date_format:'%Y-%m-%d'%}" readonly="readonly" />
                    </span>
                    </li>

		   			<li>
		   				<label>购车经销商：</label>
		   				<span>{%$tplData.dealerName%}</span>
		   			</li>

		   		</ul>
	   		</form>
	   		<div class="gc-ps">
	   			<span><strong>*</strong> 注：</span><p>如果您想将现有车牌使用于新车，请提前交易旧车或到提车4S经销商办理二手车置换业务</p>
	   		</div>
	   	</div>
	   	<div class="step-rt">
	   		<p class="tt">核对订单</p>
	   		<div class="gc-pic">
	   			<img src="{%$tplData.autoPic%}" alt=""/>
	   		</div>
            {%widget name="gmall:widget/page/order/info/info`$tplData.tpl`.tpl"%}


	   	</div>
   	</div>
    {%if $tplData.ticketCount>0%}
    <div class="order-volume expand"  maxNum="{%$tplData.ticketCount%}">
        <div class="volume-tit">
            <span class="icon-expand">+</span>
            <span class="icon-unexpand">-</span>
            <span class="tit-txt">
                使用优惠券:当前商品最多允许使用<span class="vol-num num-red">{%$tplData.ticketCount%}</span>张优惠券
            </span>
            <a class="my-ticket" href="http://i.emao.com/homecp/shangcheng/coupons/"
                    target="_blank">我的卡券></a>
        </div>
        <div class="volume-bd">
            <ul class="vol-list">
                <li class=" unchoose">
                    <div class="li-volNum">
                        东风标致8月畅想好礼活动
                    </div>
                    <div class="li-volVal ">
                        <span class="num-red">5000元</span>
                    </div>
                    <div class="li-choose"></div>
                </li>
                <li class="">
                    <div class="li-volNum">
                        东风标致8月畅想好礼活动
                    </div>
                    <div class="li-volVal ">
                        <span class="num-red">5000元</span>
                    </div>
                    <div class="li-choose"></div>
                </li>
            </ul>
            <div class="vol-line">
                <lable class="vol-lable">请输入您的一猫优惠券：</lable>
                <span class="vol-inputs">
                    <input type="text"/>
                    <input type="text"/>
                    <input type="text"/>
                    <input type="text"/>
                </span>
                <span class="vol-sure">确定</span>
            </div>
            <p class="vol-info">
                共使用了<span class="num-used num-red">0</span>张优惠券
            </p>

        </div>



    </div>
    {%/if%}
   	<div class="order-sub">
        {%if $tplData.tpl==5||$tplData.tpl==6||$tplData.tpl==7||$tplData.tpl==8||$tplData.tpl==9%}
   		<a class="sub-btn" href="javascript:void(0)" id="btn-order-1" onclick="ga('send','event','gmall','tjorder1','{%$tplData.goodsId%}');">提交订单</a>
   		{%else%}
        <a class="sub-btn" href="javascript:void(0)" id="btn-order-1">提交订单</a>
        {%/if%}
        <div class="order-sum price-online" price="{%$tplData.orderPrice%}">订单金额：
   			<em class="" >{%$tplData.orderPrice%}</em>
   			<span>元</span>
   		</div>
   	</div>
</div>
{%script%}
    require.async('./order.js',function(order){
        order.init({%$tplData.ticket|json_encode|escape:none%});
    });
{%/script%}