<!--
    @require "user.less"
-->
<div class="user-wap">
    <div class="refund-nav">
        <div class="lite">提交退款申请</div>
    </div>
    <div class="refund-box" order-id="{%$tplData.tplOrderId%}">
        <div class="refund-dl box">
            <div class="refund-dt">申请类型：</div>
            <div><input type="radio" checked/> 退款</div>
        </div>
        <div class="refund-dl box">
            {%if $tplData.tpl==8||$tplData.tpl==9%}
            <div class="refund-dt">活动名称：</div>
            <div class="flex1">{%$tplData.tplAutoName%}</div>
            {%else%}
            <div class="refund-dt">退款车型：</div>
            <div class="flex1">{%$tplData.tplAutoName%}</div>
            {%/if%}
        </div>
        <div class="refund-dl box">
            <div class="refund-dt">退款金额：</div>
            <div class="c-red">¥{%$tplData.tplReturnPrice%}元</div>
        </div>
        <div class="refund-dl box">
            <div class="refund-dt">退款原因：</div>
            <div class="flex1">
                <select id="refund-reason">

                    <option value ="0">请选择原因</option>
                    {%foreach $tplData.tplReasonList as $explain%}
                    <option value ="{%$explain.id%}">{%$explain.content%}</option>
                    {%/foreach%}
                </select>
            </div>
        </div>
        <div class="refund-dl box">
            <div class="refund-dt">问题描述：</div>
            <div class="flex1">
                <textarea class="describe" placeholder="请输入退款理由（可不填）" name="describe" clos="20" rows="5"></textarea>
            </div>
        </div>
        <div class="refund-but-box">
            <div class="refund-xiao">取消</div>
            <div class="refund-sub">提交</div>
        </div>
    </div>
</div>

{%script%}
    window.isGroup="{%$tplData.isGroup|default:0%}";
    window.isGroup=window.isGroup-0;
    require.async('./user.js',function(user){
    user.init();
});
{%/script%}