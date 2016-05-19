{%widget name="gmobile:widget/page/user/nav.tpl" cls5="active"%}

{%require name="gmobile:widget/page/user/myOrders/fenqi-orders.css"%}
{%foreach $tplData.orderList.list as $item%}
	<div class="myOrder">
		<div class="mo-Box">
			<div class="orderTit">
				<p>
					<img class="orderIcon" src="images/orderIcon.png">
					<span>订单状态：<span class="cRed">
						{%if $item.status4.showline == 1%}
							{%$item.status4.statusName%}
						{%elseif $item.status3.showline == 1 %}
							{%$item.status3.statusName%}
						{%elseif $item.status2.showline == 1 %}
							{%$item.status2.statusName%}
						{%elseif $item.status1.showline == 1 %}
							{%$item.status1.statusName%}
						{%/if%}
					</span></span>
				</p>
				<div class="orderRes">
						<p class="orTmr">订单号：{%$item.orderId|cat:''%}</p>
					<p class="orTmr">下单时间：{%$item.addTime|date_format:"%Y-%m-%d %H:%M:%S"%}</p>
        </div>
			</div>
			<div class="orderCon box">
				<div class="cimgbox flex1">
					<img src="{%$item.image[0]%}" class="carImg"/>
				</div>
				
				<div class="carText flex1">
					<p>{%$item.autoName%}</p>
                    {%if $item.colorName%}
                    <p>车身颜色：{%$item.colorName%}</p>
                    {%/if%}
                    {%if $item.partsInfo%}
                    {%foreach $item.partsInfo as $i=>$part%}
                    <p>{%$part.groupName%}：{%$part.partsName%}</p>
                    {%/foreach%}
                    {%/if%}
				</div>
			</div>
		</div>
		<div class="mo-Box orderState">
			{%if $item.status1.showline == 1 %}
				<p class="cRed"><span class="oSm"><i class="oSmFis"></i><img src="images/orderState.png"></span><span class="oStxt"><span class="oStt">{%$item.status1.statusName%}</span>  {%$item.status1.time|date_format:"%Y-%m-%d %H:%M:%S"%}</span></p>
			{%/if%}

			{%if $item.status2.showline == 1 %}
				<p class="cRed"><span class="oSm"><i></i><img src="images/orderState.png"></span><span class="oStxt"><span class="oStt">{%$item.status2.statusName%}</span>   {%$item.status2.time|date_format:"%Y-%m-%d %H:%M:%S"%}</span></p>
			{%/if%}

			{%if $item.status3.showline == 1 %}
				<p class="cRed"><span class="oSm"><i></i><img src="images/orderState.png"></span><span class="oStxt"><span class="oStt">{%$item.status3.statusName%}</span>   {%$item.status3.time|date_format:"%Y-%m-%d %H:%M:%S"%}</span></p>
			{%/if%}

			{%if $item.status4.showline == 1 %}
				<p class="cRed"><span class="oSm"><i></i><img src="images/orderState.png"></span><span class="oStxt"><span class="oStt">{%$item.status4.statusName%}</span>  {%$item.status4.time|date_format:"%Y-%m-%d %H:%M:%S"%}</span></p>
			{%/if%}
		</div>

		<div class="mo-Box orderPlisi">
			<p class="oTitBtn clear">
				<a href="/homecp/shangcheng/?c=order&a=detail&oId={%$item.goodOrderId%}" class="btn-carPre fl">查看购车订金</a>
				<a href="javascript:;" class="btn-rBox fr"><img src="images/rboxUp.png" class="rboxDown rboxBg">点击收起订单信息</a>
			</p>
			<div class="orderTlist">
				<p class="orderText"><span class="orTL">一猫价：</span><span class="cRed">
				{%$item.emaoPrice|format_price%}</span></p>
				<p class="orderText"><span class="orTL">指导价：</span>{%$item.price%}万</p>
				<p class="orderText clear"><span class="orTL">所选金融机构：</span>{%$item.bankName%}<span class="fr"><img class="bankBg" src="http://img.emao.net/{%$item.logo%}"></span></p>
				<p class="orderText"><span class="orTL">所选金融方案：</span>{%$item.planName%}</p>
				<p class="orderText"><span class="orTL">购车人：</span>{%$item.name%}</p>
				<p class="orderText"><span class="orTL">手机号：</span>{%$item.phone%}</p>
				<p class="orderText"><span class="orTL">所选提车店：</span>{%$item.dealer.name%}</p>
                {%if $item.gift.name%}
				<p class="orderText"><span class="orTL">我的赠品：</span>{%$item.gift.name%}</p>
                {%/if%}
				<p class="orderText"><span class="orTL">提车电话：</span>{%$item.dealer.telephone%}</p>
				<p class="orderText"><span class="orTL">提车地址：</span>{%$item.dealer.address%} </p>
			</div>
		</div>

		<div class="mo-Box orderPlisi">
			<p class="oTitBtn clear">
				<span class="cSpan fl">分期信息</span>
				<a href="javascript:;" class="btn-rBox fr"><img src="images/rboxDown.png" class="rboxDown rboxBg">点击收起贷款信息</a>
			</p>
			<div class="orderTlist">
				<p class="orderText"><span class="orTL">首付比例：</span>{%$item.firstPayVal%}</p>
				<p class="orderText"><span class="orTL">分期期数：</span>{%$item.rateNumName%}</p>
				<p class="orderText"><span class="orTL">首付金额：</span>{%$item.firstPayMoney%}元</p>
				<p class="orderText"><span class="orTL">贷款金额：</span>{%$item.loanMoney%}元 (不包含尾款)</p>
				<p class="orderText"><span class="orTL">尾款金额：</span>{%$item.endMoney%}元</p>
				<p class="orderText"><span class="orTL">月供金额：</span>{%$item.rateMonth%}元（相当于日供{%$item.day_rateMonth%}元）</p>
				<p class="orderText"><span class="orTL">年利率：</span>{%$item.rate|string_format:'%.2f'%}%</p>
				<p class="orderText"><span class="orTL">手续费：</span>{%$item.showPro|string_format:'%.2f'%}元</p>
				{%if $item.freeNum%}
					<p class="orderText"><span class="orTL">免息月份：</span>{%$item.freeNum%}个月</p>
				{%/if%}
				
				<p class="orderText"><span class="orTL">{%$item.codeTypeName%}：</span>{%$item.codeVal%}</p>
			</div>

		</div>
		<p class="cRed ord-tisi">资格审核通过后签订购车合同并支付合同金，车到 后按金融公司标准支付首付及月供。</p>
</div>
{%/foreach%}

{%script%}
require.async('./order-detail.js',function(detail){
	detail.bindEvent();
});
{%/script%}