
{%$status=[
'1'=>'待付款',
'2'=>'已付款(待提车)',
'3'=>'订单已取消',
'4'=>'提车完成',
'5'=>'退款',
'6'=>'退款申请未通过',
'7'=>'退款申请已通过',
'8'=>'退款完成'
]
%}
{%foreach $tplData.orderList.data.data as $orderInfo%}
<div class="list-box">
    <a href="{%$url.user%}?c=order&a=detail&oId={%$orderInfo.orderId%}">
        <div class="list-center">
            {%if $orderInfo.state <= 4%}
            <div class="order-status done">{%$status[$orderInfo.state]%}</div>
            {%else%}
            <div class="order-status refunded">{%$status[$orderInfo.state]%}</div>
            {%/if%}
            <div class="pro-img center"><img src="{%$orderInfo.mainImage%}" alt=""/></div>
            <div class="pro-name">{%$orderInfo.goods.goodsName%}</div>
            
            {%if $orderInfo.gType==3 || $orderInfo.gType==2%}
            <div class="dl box">
                <div class="dt">一猫价：</div>
                <div class="dd">{%$orderInfo.emaoPrice|format_price%}</div>
            </div>
            {%if $orderInfo.gType!=3%}
            <div class="dl box">
                <div class="dt">购车意向金：</div>
                <div class="dd">{%$orderInfo.deposit%}元</div>
            </div>
            {%else%}
            <div class="dl box">
                <div class="dt">购车全款：</div>
                <div class="dd">{%$orderInfo.emaoPrice|format_price%}</div>
            </div>
            {%/if%}
            {%if $orderInfo.packType==3%}
            {%foreach $orderInfo.partsGroup as $i=>$item%}
            <div class="dl box">
                <div class="dt">{%$item.groupName%}：</div>
                <div class="dd">
                    {%if $item.image&&$item.groupType==2%}
                    <img src="{%$item.image%}" style="display: inline-block;height: 26px;margin-right:3px"/>
                    {%/if%}
                    {%$item.partsName%}
                </div>
            </div>
            {%/foreach%}
            {%/if%}

            {%if $orderInfo.ticketInfo%}
                <div class="dl box">
                    <div class="dt">优惠券：</div>
                    <div class="dd cor-hui">
                        <span>共使用<em>{%$orderInfo.ticketInfo.ticketInfoRes.allnum%}</em>张优惠券</span><br/>
                        {%if $orderInfo.ticketInfo.ticketInfoRes.onlinenum && $orderInfo.ticketInfo.ticketInfoRes.offlinenum%}
                        <span>线上优惠<em>{%$orderInfo.ticketInfo.ticketInfoRes.onlinePay%}</em>元</span><br/>
                        <span>线下优惠 <em>{%$orderInfo.ticketInfo.ticketInfoRes.offlinePay%}</em>元</span>
                        {%elseif $orderInfo.ticketInfo.ticketInfoRes.onlinenum%}
                        <span>线上优惠<em>{%$orderInfo.ticketInfo.ticketInfoRes.onlinePay%}</em>元</span>
                        {%elseif $orderInfo.ticketInfo.ticketInfoRes.offlinenum%}
                        <span>线下优惠 <em>{%$orderInfo.ticketInfo.ticketInfoRes.offlinePay%}</em>元</span>
                        {%/if%}
                    </div>
                </div>
            {%else%}
                <div class="dl box">
                    <div class="dt">优惠券：</div>
                    <div class="dd cor-hui flex1">
                        <span>共使用<em>0</em>张优惠券</span>
                    </div>
                </div>
            {%/if%}
            {%if $orderInfo.deposit>0%}
            {%$orderInfo.goods.discount=0%}
            {%/if%}
            <div class="dl box">
                <div class="dt">在线支付：</div>
                <div class="dd cor-hui flex1">
                    <em>{%$orderInfo.price%}元</em>（应付款）
                    {%if $orderInfo.goods.discount>0||$orderInfo.ticketInfo.ticketInfoRes.onlinenum%}
                        =
                        {%if $orderInfo.gType!=3%}
                        <em>{%$orderInfo.deposit%}元</em>（意向金）
                        {%else%}
                        <em>{%$orderInfo.emaoPrice%}元</em>（全款）
                            {%if $orderInfo.goods.discount>0%}
                            -<em>{%$orderInfo.goods.discount%}元</em>（全款优惠）
                            {%/if%}
                        {%/if%}

                        {%if $orderInfo.ticketInfo.ticketInfoRes.onlinenum%}
                        -<em>{%$orderInfo.ticketInfo.ticketInfoRes.onlinePay%}元</em>（优惠券）
                        {%/if%}
                    {%/if%}
                </div>
            </div>
            <div class="dl box">
                <div class="dt">到店支付：</div>
                {%if $orderInfo.deposit>0||$tplData.ticketInfo.ticketInfoRes.offlinenum%}
                    {%if $orderInfo.ticketInfo.ticketInfoRes.offlinenum%}
                    <div class="dd cor-hui flex1"><em>{%$orderInfo.offlinePrice%}元</em>=<em>{%$orderInfo.emaoPrice%}元</em>-<em>{%$orderInfo.deposit%}元</em>（意向金）-<em>{%$orderInfo.ticketInfo.ticketInfoRes.offlinePay%}元</em>（优惠券）</div>
                    {%else%}
                    <div class="dd cor-hui flex1"><em>{%$orderInfo.offlinePrice%}元</em>=<em>{%$orderInfo.emaoPrice%}元</em>-<em>{%$orderInfo.deposit%}元</em>（意向金）</div>
                    {%/if%}
                {%else%}
                    <div class="dd cor-hui flex1"><em>{%$orderInfo.offlinePrice%}元</em></div>
                {%/if%}
            </div>
            {%else%}
            {%if $orderInfo.goods.bargainType==2%}
            <div class="dl box">
                <div class="dt">一猫价：</div>
                <div class="dd">{%$orderInfo.emaoPrice|format_price%}</div>
            </div>
            {%/if%}
            <div class="dl box">
                <div class="dt">厂商指导价：</div>
                <div class="dd">{%$orderInfo.goods.price%}万</div>
            </div>
            <div class="dl box">
                <div class="dt">购车意向金：</div>
                <div class="dd">{%$orderInfo.couponSellPrice%}元</div>

            </div>
            <div class="dl box">
                <div class="dt">到店抵扣：</div>
                {%if $orderInfo.ticketInfo.ticketInfoRes.offlinenum%}
                <div class="dd cor-hui flex1">共可抵扣<em>{%$orderInfo.offlineReduce%}元</em>=<em>{%$orderInfo.couponValue%}元</em>（抵扣券）+<em>{%$orderInfo.ticketInfo.ticketInfoRes.offlinePay%}元</em>（优惠券）</div>
                {%else%}
                <div class="dd cor-hui"><em>{%$orderInfo.couponValue%}元</em>（抵扣券）</div>
                {%/if%}
            </div>
            {%if $orderInfo.ticketInfo%}
            <div class="dl box">
                <div class="dt">优惠券：</div>
                <div class="dd cor-hui flex1">
                    <span>共使用<em>{%$orderInfo.ticketInfo.ticketInfoRes.allnum%}</em>张优惠券</span><br/>
                    {%if $orderInfo.ticketInfo.ticketInfoRes.onlinenum && $orderInfo.ticketInfo.ticketInfoRes.offlinenum%}
                    <span>线上优惠<em>{%$orderInfo.ticketInfo.ticketInfoRes.onlinePay%}</em>元</span><br/>
                    <span>线下优惠 <em>{%$orderInfo.ticketInfo.ticketInfoRes.offlinePay%}</em>元</span>
                    {%elseif $orderInfo.ticketInfo.ticketInfoRes.onlinenum%}
                    <span>线上优惠<em>{%$orderInfo.ticketInfo.ticketInfoRes.onlinePay%}</em>元</span>
                    {%elseif $orderInfo.ticketInfo.ticketInfoRes.offlinenum%}
                    <span>线下优惠 <em>{%$orderInfo.ticketInfo.ticketInfoRes.offlinePay%}</em>元</span>
                    {%/if%}
                </div>
            </div>
            {%else%}
            <div class="dl box">
                <div class="dt">优惠券：</div>
                <div class="dd cor-hui flex1">
                    <span>共使用<em>0</em>张优惠券</span>
                </div>
            </div>
            {%/if%}
            <div class="dl box">
                <div class="dt">在线应付：</div>
                {%if $orderInfo.ticketInfo.ticketInfoRes.onlinenum%}
                <div class="dd cor-hui flex1"><em>{%$orderInfo.price%}元</em>=<em>{%$orderInfo.couponSellPrice%}元</em>（意向金）-<em>{%$orderInfo.ticketInfo.ticketInfoRes.onlinePay%}元</em>（优惠券）</div>
                {%else%}
                <div class="dd">{%$orderInfo.couponSellPrice%}元</div>
                {%/if%}
            </div>
            {%/if%}
            {%if $orderInfo.gift.name%}
            <div class="gifts">
                <i></i>购车赠送{%$orderInfo.gift.name%}
            </div>
            {%/if%}
        </div>
        <div class="code-box"><a href="javascript:;" class="redBtn">查看详情</a>订单编号：{%$orderInfo.orderId%}<br/>下单时间：{%$orderInfo.insertTime|date_format:'%Y-%m-%d %H:%M'%}</div>
    </a>
</div>
{%/foreach%}

<script>
    {%if !count($tplData.orderList.data.data)%}
        window.isEnd=1;
    {%/if%}
</script>

