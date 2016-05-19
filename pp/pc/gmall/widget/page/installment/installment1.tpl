<div class="detail-bar">
    <div class="detail-center">
        <div class="detail-item">
            当前位置 ：
            <strong>
                <a href="http://mall.emao.com/">商品列表</a>
            </strong>><strong>
                <a class="fenqiBtn" href="javascript:void(0)">选择分期方案</a>
            </strong>><span>分期购车资质提交</span>
        </div>
    </div>
</div>

<div class="install-wrap">
	<div class="install-tp">
		<div class="install-lt">
			<div class="lt-info name-info">
				<label><i>*</i>购车人姓名：</label>
				<input type="text" />
				<p class="error-int">输入2-20个汉字或字母</p>
			</div>
			<div class="lt-info info-info">
				<label><i>*</i><em><b></b>身份证</em><em class="jgz"><b></b>军官证</em><em class="cur"><b></b>护照</em></label>
				<input type="text" />
				<p class="error-int">身份证为18位</p>
			</div>
			<div class="lt-info phone-info">
				<label><i>*</i>手机号：</label>
				<input type="text" />
				<p class="error-int">手机号为11位数字</p>
			</div>
			<div class="lt-info age-ingo">
				<label><i>*</i>年龄：</label>
				<input type="text" />
				<p class="error-int">购车人需在18-60周岁之间</p>
			</div>
			{%if $tplData.bank.extendEdu==1%}
			<div class="lt-info education-info" >
				<label>学历及专业：</label>
				<input type="text" />
				<p class="error-int">输入0-20个汉字</p>
			</div>
			{%/if%}
			{%if $tplData.bank.extendName==1%}
			<div class="lt-info contact-info">
				<label>紧急联系人：</label>
				<input type="text" />
				<p class="error-int">输入2-20个汉字或字母</p>
			</div>
			{%/if%}
			{%if $tplData.bank.extendIncome==1%}
			<div class="lt-info income-info">
				<label>年收入</label>
				<span>万元</span><input type="text" /> 
				<p class="error-int">输入0-10个数字</p>
			</div>
			{%/if%}
		</div>
		<div class="install-rt">
			<div class="lt-info city-info" bank="{%$tplData.bank.bankId%}">
				<label><i>*</i>城市：</label>
				<select name="province" class="provinceId" id="province">
				{%foreach $tplData.provinceList as $i=>$item%}                       
					<option value="{%$item.provinceId%}">{%$item.provinceName%}</option>
				{%/foreach%}
				</select>
				<select name="city" class="cityId" id="city">
					<option>城市</option>
				</select>
			</div>
			<div class="lt-info occupation-info">
				<label><i>*</i>职业：</label>
				<select>
				{%foreach $tplData.occupationEnum as $i=>$item%}
					<option value="{%$i%}">{%$item%}</option>
				{%/foreach%}
				</select>
			</div>
			<div class="lt-info housing-info">
				<label><i>*</i>住房情况：</label>
				<select>
				{%foreach $tplData.houseEnum as $k=>$time%}
					<option value="{%$k%}">{%$time%}</option>
				{%/foreach%}
				</select>
			</div>
			<div class="lt-info security-info">
				<label><i>*</i>社保情况：</label>
				<select>
				{%foreach $tplData.securityEnum as $i=>$item%}
					<option value="{%$i%}">{%$item%}</option>
				{%/foreach%}
				</select>
			</div>
			{%if $tplData.bank.extendLoan==1%}
			<div class="lt-info loan-info">
				<label>是否有贷款：</label>
				<select>
					<option value="1">是</option>
					<option value="2">否</option>
				</select>
			</div>
			{%/if%}
			{%if $tplData.bank.extendPhone==1%}
			<div class="lt-info gency-info">
				<label>紧急联系人联系方式：</label>
				<input type="text" />
				<p class="error-int">手机号为11位数字</p>
			</div>
			{%/if%}
		</div>
	</div>

	<div class="install-btm">
		<div class="btm-lt">
			<div class="lt-lt">
				<h4>申请条件：</h4>
				<p>1.年龄在18周岁（含）以上60周岁（含）以下</p>
				<p>2.有完全民事行为能力的中华人民共和国公民</p>
				<p>3.无违约行为和不良信用记录</p>
				<p>4.具备还款意愿和还款能力</p>
				<p>5.金融机构规定的其他条件</p>
			</div>
			<div class="lt-rt">
				<h4>所需材料：</h4>
				<p>1.身份证明材料</p>
				<p>2.工作证明材料</p>
				<p>3.收入证明材料</p>
				<p>4.用途证明材料</p>
				<p>5.金融机构要求的其他材料</p>
			</div>
		</div>
		<div class="btm-rt">
			<span>您的其它需求：</span>
			<div class="rt-rt">
				<textarea maxlength="120"></textarea>
				<em><i>0</i>/120</em>
			</div>
		</div>
	</div>

    <button class="sub-btn">提交申请</button>
</div>
<form class="submitForm" style="display: none">
	<input type="hidden" name="bankId" value="{%$tplData['bank'].bankId%}" id="bankid">
	<input type="hidden" name="firstPay" value="{%$tplData['firstPay']%}" id="firstpay">
	<input type="hidden" name="stag" value="{%$tplData['stag']%}" id="stag">
	<input type="hidden" name="gId" value="{%$tplData['goodsId']%}">
	<input type="hidden" name="pId" value="{%$tplData['pointId']%}">
	<input type="hidden" name="color" value="{%$tplData['colorId']%}">
	<input type="hidden" name="partsid" value="{%$tplData['partsId']%}">
	<input type="hidden" name="autoId" value="{%$tplData['autoId']%}">
	<input type="hidden" name="depositId" value="{%$tplData['depositId']%}">
    <input type="hidden" name="loanRatio" value="{%$tplData['loanRatio']%}">
</form>
<form action="/fenqi/" class="fenqi"  method="post"  style="display: none">
	<input type="hidden" name="gId" value="{%$tplData['goodsId']%}">
	<input type="hidden" name="pId" value="{%$tplData['pointId']%}">
	<input type="hidden" name="color" value="{%$tplData['colorId']%}">
	<input type="hidden" name="partsid" value="{%$tplData['partsId']%}">
	<input type="hidden" name="autoId" value="{%$tplData['autoId']%}">
	<input type="hidden" name="depositId" value="{%$tplData['depositId']%}">
</form>
<div class="mask-wrap">
	<div class="mask-info">
		<em class="mask-close"></em>
		<p></p>
		<button class="close-btn">关闭</button>
	</div>
</div>
{%script%}
require.async('./installment1.js',function(user){
    user.init();
});
{%/script%}