{%$groupStatus=[
'1'=>'未开始',
'2'=>'活动进行中',
'3'=>'活动成功',
'4'=>'活动失败'
]%}
<div class="list-box bgff">
    <a href="{%$url.user%}?c=order&a=detail&oId={%$orderInfo.orderId%}&ot={%$smarty.get.ot%}">
        <div class="list-center">
            {%if $orderInfo.state <= 4%}
            <div class="order-status done">{%$status[$orderInfo.state]%}</div>
            {%else%}
            <div class="order-status refunded">{%$status[$orderInfo.state]%}</div>
            {%/if%}
            <div class="pro-img center"><img src="{%$orderInfo.mainImgWap%}" alt=""/></div>
            <div class="pro-name">{%$orderInfo.goods.goodsName%}</div>
            <div class="textBox">
                {%block name="info_text"%}
                    {%if $orderInfo.gType!=3%}
                    <div class="dl box">
                        <div class="dt">意向金：</div>
                        <div class="dd">{%$orderInfo.deposit%}元</div>
                    </div>
                    {%else%}
                    <div class="dl box">
                        <div class="dt">购车全款：</div>
                        <div class="dd">{%$orderInfo.emaoPrice|format_price%}</div>
                    </div>
                    {%/if%}

                    {%if $smarty.get.ot==3%}
                        <div class="dl box">
                            <div class="dt">巨惠价：</div>
                            <div class="dd">{%$orderInfo.group.groupPrice|format_price%}</div>
                        </div>
                    {%else%}
                        <div class="dl box">
                            <div class="dt">一猫价：</div>
                            <div class="dd">{%$orderInfo.emaoPrice|format_price%}</div>
                        </div>
                    {%/if%}
                {%/block%}
                {%block name="info_tuanState"%}
                   {%if $smarty.get.ot==3&&$groupStatus[$orderInfo.group.tuanState]%}
                        <div class="state-tuan">
                            活动状态 : {%$groupStatus[$orderInfo.group.tuanState]%}
                        </div>
                    {%/if%}
                {%/block%}
            {%block name="info_gift"%}
                {%if $orderInfo.gift.name%}
                <div class="gifts">
                    <p class="gift-item">
                        {%$orderInfo.gift.name%}
                    </p>
                </div>
                {%/if%}
            {%/block%}
            </div>
           
            
        </div>
        <div class="code-box">
            <span class="redBtn">查看详情</span>
            订单编号：{%$orderInfo.orderId%}
            <br/>
            下单时间：{%$orderInfo.insertTime|date_format:'%Y-%m-%d %H:%M'%}</div>
    </a>
</div>