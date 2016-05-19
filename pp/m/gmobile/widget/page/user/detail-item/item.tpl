{%block name="item_var"%}
    {%$autoName=$tplData['orderInfo']['autoName']%}
    {%$lit=($autoName['subBrandName']|cat:$autoName['serieName']|cat:$atuoName['autoName'])%}
    {%$paid=($tplData.orderInfo.emaoPrice-$tplData.orderInfo.price-$tplData.ticketInfo.ticketInfoRes.offlinePay)%}
    {%$paidcou=($tplData.orderInfo.emaoPrice-$tplData.orderInfo.couponValue-$tplData.ticketInfo.ticketInfoRes.offlinePay)%}
    {%$gift=$tplData['orderInfo']['gift']%}
    {%$giftInfo=($gift['name'])%}
    {%$groupInfo=$tplData['group'][$tplData['orderInfo']['goodsId']]%}
    {%$stateList=[
    '1'=>'未审核',
    '2'=>'审核已通过',
    '3'=>'审核未通过',
    '4'=>'已返赠'
    ]%}
    {%$status=[
    '1'=>'待付款',
    '2'=>'已付款(待提车)',
    '3'=>'订单已取消',
    '4'=>'提车完成',
    '5'=>'退款审核中',
    '6'=>'退款申请未通过',
    '7'=>'退款申请已通过',
    '8'=>'退款完成'
    ]
    %}
    {%$groupStatus=[
    '1'=>'未开始',
    '2'=>'巨惠购进行中',
    '3'=>'巨惠购成功',
    '4'=>'巨惠购失败'
    ]%}

    {%if $orderInfo.deposit>0%}
    {%$tplData.orderInfo.discount=0%}
    {%/if%}
    {%if $tplData.orderInfo.state <= 4%}
        {%$orderStatusCls="done"%}
    {%else%}
        {%$orderStatusCls="refunded"%}
    {%/if%}
    {%if $tplData.group.tuanState == 1%}
        {%$tuanStatusCls="iorYes"%}
    {%elseif $tplData.group.tuanState == 2%}
        {%$tuanStatusCls="iorCom"%}
    {%else%}
        {%$tuanStatusCls="iorNo"%}
    {%/if%}
{%/block%}
<div class="user-wap list-detail-box borderbox list-detail-box-{%$tplData.orderInfo.goodsType%}">
    <div class="list-detail">
        <div class="detail-top bgff">
            <div class="order-status {%$orderStatusCls%}">{%$status[$tplData.orderInfo.state]%}</div>
            {%if $groupStatus[$tplData.group.tuanState]%}
            <div class="tuan-status {%$tuanStatusCls%}">{%$groupStatus[$tplData.group.tuanState]%}</div>
            {%/if%}
            <div class="pro-img center">
                <a href="{%$url.home%}car/{%$tplData.orderInfo.goodsId%}.html">
                    <img src="{%$tplData.orderInfo.autoImg%}" alt=""/>
                </a>
            </div>
            <div class="code-box" order-id="{%$tplData.orderInfo.orderId%}">
                <p>
                    订单编号：{%$tplData.orderInfo.orderId%}
                </p>
                <p>
                    下单时间：{%$tplData.orderInfo.insertTime|date_format:'%Y-%m-%d %H:%M'%}
                </p>
            </div>

            <div class="info-border">
            {%block name="item_info"%}
                <div class="detail-dl box">
                    <div class="detail-dt">所选车型：</div>
                    <div class="flex1">{%$tplData.orderInfo.autoNames%}</div>
                </div>
                {%if $tplData.orderInfo.colorName%}
                <div class="detail-dl box">
                    <div class="detail-dt">车身颜色：</div>
                    <div>{%$tplData.orderInfo.colorName%}</div>
                </div>
                {%/if%}
                {%block name="item_price"%}
                {%if $smarty.get.ot==3%}
                <div class="detail-dl box">
                    <div class="detail-dt">巨 惠 价：</div>
                    <em>&nbsp;{%$tplData.group.groupPrice|format_price%}</em>
                </div>
                {%/if%}
                {%if $smarty.get.ot!=3 || $tplData.orderInfo.group.curDiscount>0%}
                <div class="detail-dl box">
                    <div class="detail-dt">一 猫 价：</div>
                    <em>&nbsp;{%$tplData.orderInfo.emaoPrice|format_price%}</em>
                </div>
                {%/if%}
                {%if $tplData.orderInfo.gType!=3%}
                <div class="detail-dl box">
                    <div class="detail-dt">购车意向金：</div>
                    <em>&nbsp;{%$tplData.orderInfo.deposit%}元</em>
                </div>
                {%else%}
                <div class="detail-dl box">
                    <div class="detail-dt">购车全款：</div>
                    <em>&nbsp;{%$tplData.orderInfo.emaoPrice|format_price%}</em>
                </div>
                {%/if%}
                {%/block%}
                {%block name="item_parts"%}

                {%/block%}
                {%block name="item_ticketInfo"%}
                {%if $tplData.ticketInfo%}
                <div class="detail-dl box">
                    <div class="detail-dt">优 惠 券：</div>
                    <div>
                        &nbsp;<span>共使用<em>{%$tplData.ticketInfo.ticketInfoRes.allnum%}</em>张优惠券</span><br/>
                        {%if $tplData.ticketInfo.ticketInfoRes.onlinenum && $tplData.ticketInfo.ticketInfoRes.offlinenum%}
                        &nbsp;<span>线上优惠<em>{%$tplData.ticketInfo.ticketInfoRes.onlinePay%}</em>元</span><br/>
                        &nbsp;<span>线下优惠<em>{%$tplData.ticketInfo.ticketInfoRes.offlinePay%}</em>元</span>
                        {%elseif $tplData.ticketInfo.ticketInfoRes.onlinenum%}
                        &nbsp;<span>线上优惠<em>{%$tplData.ticketInfo.ticketInfoRes.onlinePay%}</em>元</span>
                        {%elseif $tplData.ticketInfo.ticketInfoRes.offlinenum%}
                        &nbsp;<span>线下优惠<em>{%$tplData.ticketInfo.ticketInfoRes.offlinePay%}</em>元</span>
                        {%/if%}
                    </div>
                </div>
                {%else%}
                <div class="detail-dl box">
                    <div class="detail-dt">优 惠 券：</div>
                    <div>
                        &nbsp;<span>共使用<em>0</em>张优惠券</span><br/>
                    </div>
                </div>
                {%/if%}
                {%/block%}
                {%block name="item_pay"%}
                <div class="detail-dl box">
                    <div class="detail-dt">在线支付：</div>
                    <div class="flex1">
                        <em>{%$tplData.orderInfo.price%}元</em>（应付款）
                        {%if $tplData.orderInfo.discount>0 || $tplData.ticketInfo.ticketInfoRes.onlinenum%}
                        =
                        {%if $tplData.orderInfo.gType!=3%}
                        <em>{%$tplData.orderInfo.deposit%}元</em>（意向金）
                        {%else%}
                        <em>{%$tplData.orderInfo.emaoPrice%}元</em>(全款)
                        {%if $tplData.orderInfo.discount>0%}
                        -<em>{%$tplData.orderInfo.discount%}元</em>（全款优惠）
                        {%/if%}
                        {%/if%}
                        {%if $tplData.ticketInfo.ticketInfoRes.onlinenum%}
                        -<em>{%$tplData.ticketInfo.ticketInfoRes.onlinePay%}元</em>(优惠券)
                        {%/if%}
                        {%/if%}
                    </div>
                </div>
                <div class="detail-dl box">
                    <div class="detail-dt">到店支付：</div>
                    {%if $tplData.orderInfo.deposit>0||$tplData.ticketInfo.ticketInfoRes.offlinenum%}
                    {%if $tplData.ticketInfo.ticketInfoRes.offlinenum%}
                    <div class="flex1"><em>{%$tplData.orderInfo.offlinePrice%}元</em>=<em>{%$tplData.orderInfo.emaoPrice%}元</em>-<em>{%$tplData.orderInfo.deposit%}元</em>（意向金）-<em>{%$tplData.ticketInfo.ticketInfoRes.offlinePay%}元</em>（优惠券）</div>
                    {%else%}
                    <div class="flex1"><em>{%$tplData.orderInfo.offlinePrice%}元</em>=<em>{%$tplData.orderInfo.emaoPrice%}元</em>-<em>{%$tplData.orderInfo.deposit%}元</em>（意向金）</div>
                    {%/if%}
                    {%else%}
                    <div class="flex1"><em>{%$tplData.orderInfo.offlinePrice%}元</em></div>
                    {%/if%}
                </div>
                {%/block%}
            {%/block%}
            </div>
        </div>
        {%block name="item_card"%}
        {%if $tplData.orderInfo.state!=1 && $tplData.orderInfo.state!=3%}
        <div class="mention-cars bgff">
            <div class="carQ-box">
                <img src="../img/quan01.png">
                <p>提车券号：</p>
                <span class="carQuan">{%$tplData.orderInfo.code%}</span>
            </div>

            <p class="carqp">提车有效期：{%$tplData.orderInfo.finalTime|date_format:'%Y-%m-%d %H:%M'%}</p>
            <p class="carqp">温馨提示：到店时请出示提车劵号</p>
        </div>
        {%/if%}
        {%/block%}
        <div class="detail-bottom bgff">
            {%block name="item_gift"%}
            {%if $orderInfo.gift.name%}
            <div class="detail-gift detail-dl box ">
                <div class="detail-dt">一猫赠品：</div>
                <div class="flex1">
                    <p class="gift-item">{%$orderInfo.gift.name%}</p>
                </div>
            </div>
            {%/if%}
            {%/block%}
            {%block name="item_buyer"%}
            <div class="buyer-info ">
                <div class="detail-dl box">
                    <div class="detail-dt">购车人：</div>
                    <div class="flex1">{%$tplData.orderInfo.userName%} （说明：下单时填写的真实姓名）</div>
                </div>
                <div class="detail-dl box">
                    <div class="detail-dt">手机号码：</div>
                    <div>{%$tplData.orderInfo.phone%}</div>
                </div>
                {%if $tplData.orderInfo.planFetchTime%}
                <div class="detail-dl box">
                    <div class="detail-dt">预计提车时间：</div>
                    <div>{%$tplData.orderInfo.planFetchTime|date_format:'%Y-%m-%d'%}</div>
                </div>
                {%/if%}

            </div>
            {%/block%}

            {%block name="item_shop"%}
            <div class="car-shop ">
                <div class="detail-dl box">
                    <div class="detail-dt">所选提车店：</div>
                    <div class="location flex1">{%$tplData.orderInfo.pointName%}
                        <span class="location-box">
                            <i class="location-ico"></i>
                            <strong class="distance"></strong>
                        </span>
                    </div>
                </div>
                <div class="detail-dl box">
                    <div class="detail-dt">提车店地址：</div>
                    <div class="flex1">{%$tplData.orderInfo.pointAddr%}</div>
                </div>
            </div>
            {%/block%}

            <ul class="contact-info box ">
                <li class="flex1">
                    <a class="ask-online" id="ask-online" href="javascript:void(0)">
                        <i class="online-kf"></i>在线客服
                    </a>
                </li>
                <li class="flex1">
                    <a href="tel:4008903881">
                        <i class="tel-number"></i>电话咨询
                    </a>
                </li>
            </ul>
            {%if $tplData.orderInfo.state==1||$tplData.orderInfo.state==2||$tplData.orderInfo.state==3||$tplData.orderInfo.state==6%}
            {%widget name="gmobile:widget/page/user/btn/item`$tplData.orderInfo.state`.tpl"%}
            {%/if%}
        </div>
        {%if $tplData.orderInfo.state==4 && $tplData.orderInfo.goodsType!=8 %}
        {%widget name="gmobile:widget/page/user/upload/item`$tplData.invoice.state`.tpl"%}
        {%/if%}
    </div>
</div>