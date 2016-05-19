
{%if $carInfo.__groupGood%}
<div class="qiang-btns flex1 center" style="">
    <ul class="center borderbox ul-submit goods-type-{%$carInfo.__groupGood.__tuanState%}">
        <li class="btn-remind flex1" pageCls="page-remined">开售提醒</li>
        {%if $carInfo.__lastCategory.tpl==8||$carInfo.__lastCategory.tpl==9%}
        <li class="btn-qiang flex1" id="btn-qiang-1" onclick="ga('send','event','gmall_wap','ljbaoming1_wap','{%$carInfo.id%}');">{%$qiangBtnTxt%}</li>
        {%else%}
        <li class="btn-qiang flex1" id="btn-qiang-1" onclick="ga('send','event','gmall_wap','ljqianggou1_wap','{%$carInfo.id%}');">{%$qiangBtnTxt%}</li>
        {%/if%}
        <li class="btn-disable flex1">活动结束</li>
        <li class="btn-disable flex1">活动结束</li>
    </ul>
</div>
{%else%}
<div class="qiang-btns flex1 center" style="{%if $carInfo.isSeckill==1%}display:none;{%/if%}">
    <ul class="center borderbox ul-submit goods-type-{%$carInfo.__saleState%}">
        <li class="btn-remind flex1" pageCls="page-remined">开售提醒</li>
        <li class="btn-qiang flex1" id="btn-qiang-1">立即抢购</li>
        <li class="btn-disable flex1">已卖光</li>
        <li class="btn-disable flex1">已结束</li>
        {%if $carInfo.isInstallment==1%}
        <li class="btn-fenqi flex1">分期付款</li>
        {%/if%}
    </ul>
</div>
{%if $carInfo.isSeckill==1%}
<div class="buy-but msBtn" id="ms-btn" style="display: none">获取抢购资格</div>
{%/if%}
{%/if%}
