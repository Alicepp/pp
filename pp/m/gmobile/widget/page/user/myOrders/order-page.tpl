{%foreach $tplData.orderList.list as $item%}
<div class="mo-Box">
	<a class="orderLink" href="http://i.m.emao.com/homecp/shangcheng/?c=user/installmentorder&a=detail&id={%$item.orderId|cat:''%}">
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

	<div class="orderTbox">
		<p class="orderText">一猫价：<span class="cRed">{%$item.emaoPrice|format_price%}</span></p>
		<p class="orderText">指导价：{%$item.price%}万</p>
		<p>所选金融机构：{%$item.bankName%}</p>
		<p class="orTmr">订单号：<span class="orderId">{%$item.orderId|cat:''%}</span></p>
		<p class="orTmr">下单时间：{%$item.addTime|date_format:"%Y-%m-%d %H:%M:%S"%}</p>
	</div>
	</a>
</div>
{%/foreach%}