<!--
    @require "installment.less"
-->
<!--class bar-->
<div class="detail-bar">
    <div class="detail-center">
        <div class="detail-item">
            当前位置 ：
            <strong>
                <a href="http://mall.emao.com/">商品列表</a>
            </strong>><strong>
                <a class="fenqiBtn" href="javascript:void(0)">选择分期方案</a>
            </strong>><strong>
                <a class="zizhiBtn" href="javascript:void(0)">分期购车资质提交</a>
            </strong>><span>确认订单信息</span>
        </div>
    </div>
</div>

<div class="confirm">
	<h4 class="confirm-greet"><span>尊敬的（{%$tplData.name%}）您好：</span></h4>
    <div class="confirm-wait">
        {%if $tplData.deposit%}
        <p>一猫已经收到您的购车意向金，同时也将提车相关信息以短信形式发送到您的手机中，请查收！</p>
        {%else%}
        <p>你的分期订单信息提交成功，一猫会尽快处理您的分期申请，请耐心等待。</p>
        {%/if%}
        <p>如有任何疑问可致电4008903881进行咨询</p>
    </div>
    <div class="confirm-infor clearfix">
        <div class="confirm-inpic">
            <a href="#">
                <img src="{%$tplData['image'][0]%}">
            </a>
        </div>
        <div class="confirm-detail">
        {%if ($tplData.autoName)%}
            <p>所选车型：{%$tplData.autoName%}</p>
        {%else%}
            <p>所选车型：{%$tplData.goodsName%}</p>
        {%/if%}
        {%if ($tplData.colorName)%}    
            <p>车辆颜色：{%$tplData.colorName%}</p>
        {%/if%}
            <p>市场价：<span class="delete-line" scprice="{%$tplData.price%}" id="sc-price">{%$tplData.price%}万</span></p>
            <p>一猫价：<span class="bigger-red">{%$tplData.emaoPrice|format_price%}</span></p>
            {%if $tplData.deposit%}
            <p style="color:#db161e;">已付意向金：{%$tplData.deposit|format_price%}</p>
            {%/if%}
        </div>
    </div>
    <div class="confirm-claaical clearfix">
        <span>所选银行</span>
        <span>首付金额</span>
        <span>贷款金额</span>
        <span>尾款金额</span>
        <span>分期期数</span>
        <span>预计月利息</span>
        <span>月供金额</span>
        <span>年利率</span>
    </div>
    <div class="confirm-claaical confirm-price clearfix">
        <span>{%$tplData.bankName%}</span>
        <span>{%$tplData.firstPayMoney%}元</span>
        <span>{%$tplData.loanMoney%}元</span>
        <span>
            {%if $tplData.endMoney%}
            {%$tplData.endMoney%}元
            {%else%}无
            {%/if%}
        </span>
        <span>{%$tplData['rateEnum'][$tplData['rateNum']]%}</span>
        <span id="con-lixi">{%$tplData.rateIntMoney%}元</span>
        <span id="con-yue" ratemoney="{%$tplData.rateMonth%}">{%$tplData.rateMonth%}</span>
        <span id="con-lilv" yuelilv="{%$tplData.rate*100%}">{%$tplData.rate*100%}%</span>
    </div>
    <div class="confirm-other">
        {%if ({%$tplData.freeNum%})%}
            {%if ($tplData.freeNum != 0)%}
            <h6>恭喜您，您获得 {%$tplData.freeNum%} 个月的免息优惠</h6>
            {%/if%}
        {%/if%}
        <div class="confirm-oin clearfix">
            <div class="confirm-oinlist">
                <div class="confirm-xiang clearfix">
                    <cite>购车人姓名：</cite>
                    <span>{%$tplData.name%}</span>
                </div>
                <div class="confirm-xiang clearfix">
                    <cite>{%$tplData['codeTypeEnum'][$tplData['codeType']]%}：</cite>
                    <span>{%$tplData.codeVal%}</span>
                </div>
                <div class="confirm-xiang clearfix">
                    <cite>手机号：</cite>
                    <span>{%$tplData.phone%}</span>
                </div>
                {%if $tplData.flow!=2%}
                <div class="confirm-xiang clearfix">
                    <cite>年龄：</cite>
                    <span>{%$tplData.age%}</span>
                </div>
                {%/if%}
                {%if ({%$tplData.extendEdu%} != '')%}
                <div class="confirm-xiang clearfix">
                    <cite>学历及专业：</cite>
                    <span>{%$tplData.extendEdu%}</span>
                </div>
                {%/if%}
                {%if ($tplData.extendName)%}
                <div class="confirm-xiang clearfix">
                    <cite>紧急联系人：</cite>
                    <span>{%$tplData.extendName%}</span>
                </div>
                {%/if%}
                {%if ($tplData.extendIncome)%}
                    {%if ($tplData.extendIncome != 0.00)%}
                    <div class="confirm-xiang clearfix">
                        <cite>年收入：</cite>
                        <span>{%$tplData.extendIncome%}万元</span>
                    </div>
                    {%/if%}
                {%/if%}
                {%if $tplData.takeTime%}
                <div class="confirm-xiang clearfix">
                    <cite>预计提车时间：</cite>
                    <span>{%$tplData.takeTime%}</span>
                </div>
                {%/if%}
            </div>
            <div class="confirm-oinlist">
                <div class="confirm-xiang clearfix">
                    <cite>城市：</cite>
                    <span>
                        {%if $tplData.cityName%}
                        {%$tplData.cityName%}
                        {%else%}
                        {%$tplData.carCityName%}
                        {%/if%}
                    </span>
                </div>
                {%if $tplData.flow!=2%}
                <div class="confirm-xiang clearfix">
                    <cite>职业：</cite>
                    <span>{%$tplData['occupationEnum'][$tplData['occupation']]%}</span>
                </div>
                <div class="confirm-xiang clearfix">
                    <cite>住房状况：</cite>
                    <span>{%$tplData['houseEnum'][$tplData['house']]%}</span>
                </div>
                <div class="confirm-xiang clearfix">
                    <cite>社保情况：</cite>
                    <span>{%$tplData['securityEnum'][$tplData['security']]%}</span>
                </div>
                {%/if%}
                {%if ($tplData.extendLoan)%}
                <div class="confirm-xiang clearfix">
                    <cite>是否有贷款：</cite>
                    <span>{%$tplData['loanEnum'][$tplData['extendLoan']]%}</span>
                </div>
                {%/if%}
                {%if ($tplData.extendPhone)%}
                <div class="confirm-xiang clearfix">
                    <cite>紧急联系人联系方式：</cite>
                    <span>{%$tplData.extendPhone%}</span>
                </div>
                {%/if%}

            </div>
            {%if ($tplData.remark)%}
            <div class="confirm-qita">
                <div class="confirm-xiang clearfix">
                    <cite>其他需求：</cite>
                    <span>{%$tplData.remark%}</span>
                </div>
            </div>
            {%/if%}
        </div>
    </div>
</div>

<div class="confirm-jump clearfix">
    <span><em class="confirm-count">60</em>秒后将自动跳转到个人中心</span>
    <cite>|</cite>
    <a href="http://i.emao.com/homecp/shangcheng/loan/" class="directjump">直接跳转</a>
    <a href="http://www.emao.com" class="returnindex">返回一猫首页</a>
</div>


{%script%}
require.async('./confirm.js',function(confirm){
    confirm.init();
});
{%/script%}
