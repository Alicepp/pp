<!--
    @require "page.less"
-->
<div class="detail-bar">
    <div class="detail-center">
        <div class="detail-item">
            当前位置 ：
            <strong>
                <a href="http://mall.emao.com">商品列表</a>
            </strong>&gt;<span>选择分期方案</span>
        </div>
    </div>
</div>
<div class="staging-center">
    {%if count($tplData.bank)>0%}
    {%foreach $tplData.bank as $i=>$item%}
        {%widget name='gmall:widget/page/installment2/bank/bank.tpl'%}
    {%/foreach%}
    {%else%}
    <div class="nobank">您选择的城市不支持分期付款，请&nbsp;&nbsp;<a href="javascript:history.back();">选择其他城市</a></div>
    {%/if%}
</div>

