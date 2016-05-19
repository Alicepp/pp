<!--class bar-->
<div class="detail-bar">
    <div class="detail-center">
        <div class="detail-item">
            当前位置 ：
            <strong>
                <a href="http://mall.emao.com">商品列表</a>
            </strong>><span>选择分期方案</span>
        </div>
    </div>
</div>

<div class="install-box">
	<div class="install-plan" carprice="{%$tplData['good'].actualPrice%}" bargainType="{%$tplData['good'].bargainType%}">
		<form method="post" action="http://mall.emao.com/fenqi/write/" class="stallbank" target="_blank">
		{%foreach $tplData.bank as $i=>$item%}
			<div class="install-bank clearfix" bankId="{%$item.bankId%}" procedureType="{%$item['procedureType']%}" procedureVal="{%$item.procedureVal%}" rateTwe="{%$item.rateTwe%}" rateTweFour="{%$item.rateTweFour%}" rateThiSix="{%$item.rateThiSix%}" rateForEight="{%$item.rateForEight%}" rateSixty="{%$item.rateSixty%}">
				<div class="install-card">
					<div class="install-c-im">
						<img src="http://img.emao.net/{%$item.logo%}">
					</div>
					<div class="install-c-look">
						查看支持城市及说明
					</div>
				</div>
				<div class="install-select">
					<div class="install-s-shoufu payment clearfix">
						<span>选择首付</span>
						{%foreach $tplData.firstPayEnum as $ek=>$ev%}
						<a href="javascript:;" firstpay="{%$ek%}">{%$ev%}</a>
						{%/foreach%}
					</div>
					<div class="install-s-shoufu llment llmcurrent clearfix">
						<span>选择分期</span>
						<div class="llmentquan">
							<a href="javascript:;">12个月</a>
							<a href="javascript:;">24个月</a>
							<a href="javascript:;">46个月</a>
							<a href="javascript:;">48个月</a>
							<a href="javascript:;">60个月</a>
						</div>
						{%foreach $item['firstPayPro'] as $key=>$value%}		
						<div class="llmenbox">
							{%foreach $value as $kk=>$vv%}
							<a href="javascript:;" freenum="{%$tplData['bank'][$i][$tplData['stagFreeEnum'][$vv]]%}" stagenum="{%$tplData['stagEnum'][$kk]%}">{%$tplData['stagEnum'][$vv]%}</a>
							{%/foreach %}
						</div>
						{%/foreach%}
					</div>
					<div class="install-jisuan clearfix">
						<span>分期计算结果</span>
						<cite>*此计算结果只供参考，实际金额以银行为准</cite>
					</div>
					<ul class="install-jieguo clearfix">
						<li>首付金额：<span>98800.00</span>元</li>
						<li>贷款金额：<span>550000.00</span>元</li>
						<li>预计月供：<span>7988.00</span>元</li>
						<li>月利率：<span>0.17</span>%</li>
						<li>预计月利息：<span>32454.00</span>元</li>
						<li>手续费：<span>0.00</span>元</li>
						<li class="mianxi">恭喜您，您获得<span>2</span>个月的免息优惠</li>
					</ul>
					<div class="install-tijiao clearfix">
						<input type="submit" value="提交">
					</div>
				</div>
			</div>
		{%/foreach%}
		<input type="hidden" name="bankId" value="" id="bankid">
		<input type="hidden" name="firstPay" value="" id="firstpay">
		<input type="hidden" name="stag" value="" id="stag">
		<input type="hidden" name="gId" value="{%$tplData['goodsId']%}">
		<input type="hidden" name="pId" value="{%$tplData['pointId']%}">
		<input type="hidden" name="color" value="{%$tplData['colorId']%}">
		<input type="hidden" name="partsid" value="{%$tplData['partsId']%}">
		<input type="hidden" name="autoId" value="{%$tplData['autoId']%}">
		<input type="hidden" name="depositId" value="{%$tplData['depositId']%}">
		</form>
	</div>
</div>

<div class="install-fuceng">
	<div class="install-mask"></div>
	<div class="install-support clearfix">
		<a href="javascript:;" class="install-close"></a>
		{%foreach $tplData.bank as $i=>$item%}
		<div class="install-fcyin clearfix">
			<div class="install-m-ico">
				<div class="install-m-ipic"><img src="http://img.emao.net/{%$item.logo%}"></div>
				<div class="install-m-work">
					{%$item.shortInfo%}
				</div>
			</div>
			<div class="install-jianjie">
				<div class="install-jjone">
					<h6><span>金融公司优势</span></h6>
					<p>{%$item.advantage%}</p>
				</div>
                {%if $item.people%}
				<div class="install-jjone">
					<h6><span>适合人群</span></h6>
					<p>{%$item.people%}</p>
				</div>
                {%/if%}
				<div class="install-jjone last-noborder">
					<h6><span>{%$item['fullName']%}支持以下城市进行金融购车</span></h6>
					<select class="install-zhichi">	
						{%foreach $item['province'] as $k=>$list%}
						<option value="{%$list.provinceId%}">{%$list.provinceName%}</option>
						{%/foreach%}
					</select>
					<div class="install-cheng clearfix">
						
					</div>
				</div>
			</div>
			<div class="install-shengming clearfix">
				<div class="install-jjone last-noborder">
                    {%if $item.disclaimer%}
					<h6><span>免责声明</span></h6>
					<p>{%$item.disclaimer%}</p>
                    {%/if%}
				</div>
			</div>
		</div>
		{%/foreach%}
	</div>
</div>
<input type="hidden" id="stagEnum" value='{%$tplData['_stagEnum']%}'>
{%script%}
require.async('./selectbank.js',function(install){
    install.init();
});
{%/script%}