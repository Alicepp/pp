<div class="order-box pay-box">
    <div class="pack-up">
        <p>点击收起贷款信息</p>
        <p class="p-open">点击展开贷款信息</p>
    </div>
    <div class="pay-info">
        <dl class="pay-dl">
            <dt>首付金额：</dt>
            <dd>{%$tplData.firstPayMoney|default:'0.00'%}元</dd>
        </dl>
        <dl class="pay-dl">
            <dt>贷款金额：</dt>
            <dd>{%$tplData.loanMoney|default:'0.00'%}元（注：不包含尾款）</dd>
        </dl>
        {%if $tplData.endMoney>0%}
        <dl class="pay-dl">
            <dt>尾款金额：</dt>
            <dd>{%$tplData.endMoney|default:'0.00'%}元（注：最后一期只需要还清尾款）</dd>
        </dl>
        {%/if%}
        <dl class="pay-dl">
            <dt>期数：</dt>
            <dd>{%$tplData.stagValue%}期</dd>
        </dl>
        <dl class="pay-dl">
            <dt>年利率：</dt>
            <dd>{%($tplData.rate*100)|string_format:"%.2f"%}%{%if $tplData.rateEndTime%}（{%$tplData.rateEndTime%}截止）{%/if%}</dd>
        </dl>
        <dl class="pay-dl">
            <dt>月供：</dt>
            <dd>{%$tplData.monthMoney|default:'0.00'%}元（相当于日供：{%($tplData.monthMoney/30)|default:'0.00'|string_format:"%.2f"%}元）</dd>
        </dl>
<!--        {%if $tplData.countMoney%}
        <dl class="pay-dl">
            <dt>手续费：</dt>
            <dd>{%$tplData.countMoney|default:'0.00'%}元</dd>
        </dl>
        {%/if%}-->
    </div>
</div>