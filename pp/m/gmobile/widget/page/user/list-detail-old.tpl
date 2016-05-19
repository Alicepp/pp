    <div class="info-border">
    <a  style="display: none" href="{%$url.home%}car/{%$tplData.orderInfo.goodsId%}.html" class="detail-pro">{%$tplData.orderInfo.goodsName%}</a>
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
    {%if $tplData.orderInfo.goodsType==1||$tplData.orderInfo.goodsType==3%}
        <div class="detail-dl box">
            <div class="detail-dt">一 猫 价：</div>
            <em>&nbsp;{%$tplData.orderInfo.emaoPrice|format_price%}</em>
        </div>
        {%if $tplData.orderInfo.gType!=3%}
        <div class="detail-dl box">
            <div class="detail-dt">购车意向金：</div>
            <em>&nbsp;{%$tplData.orderInfo.deposit|format_price%}</em>
        </div>
        {%else%}
        <div class="detail-dl box">
            <div class="detail-dt">购车全款：</div>
            <em>&nbsp;{%$tplData.orderInfo.emaoPrice|format_price%}</em>
        </div>
        {%/if%}
            {%if $tplData.orderInfo.packType==3%}
            {%foreach $tplData.orderInfo.partsGroup as $i=>$item%}
            <div class="detail-dl box">
                <div class="detail-dt">{%$item.groupName%}：</div>
                <div class="">
                    {%if $item.image&&$item.groupType==2%}
                    <img src="{%$item.image%}" style="display: inline-block; height: 26px;margin-right:3px"/>
                    {%/if%}
                    {%$item.partsName%}
                </div>
            </div>
            {%/foreach%}
            {%/if%}
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

        <div class="detail-dl box">
            <div class="detail-dt">在线支付：</div>
            <div class="flex1">
                <em>{%$tplData.orderInfo.price%}元</em>（应付款）
                {%if $tplData.orderInfo.discount>0 || $tplData.ticketInfo.ticketInfoRes.onlinenum%}
                =
                    {%if $tplData.orderInfo.gType!=3%}
                    <em>{%$tplData.orderInfo.deposit%}元（意向金）</em>
                    {%else%}
                    <em>{%$tplData.orderInfo.emaoPrice%}元(全款)</em>
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
                <div class="flex1"><em>{%$tplData.orderInfo.offlinePrice%}元</em>=<em>{%$tplData.orderInfo.emaoPrice%}</em>-<em>{%$tplData.orderInfo.deposit%}元</em>（意向金）-<em>{%$tplData.ticketInfo.ticketInfoRes.offlinePay%}元</em>（优惠券）</div>
                {%else%}
                <div class="flex1"><em>{%$tplData.orderInfo.offlinePrice%}元</em>=<em>{%$tplData.orderInfo.emaoPrice%}</em>-<em>{%$tplData.orderInfo.deposit%}元</em>（意向金）</div>
                {%/if%}
            {%else%}
                <div class="flex1"><em>{%$tplData.orderInfo.offlinePrice%}元</em></div>
            {%/if%}
        </div>
    {%else%}
    {%if $tplData.orderInfo.bargainType==2%}
    <div class="detail-dl box">
        <div class="detail-dt">一 猫 价：</div>
        <em>{%$tplData.orderInfo.emaoPrice|format_price%}</em>
    </div>
    {%/if%}
    <div class="detail-dl box">
        <div class="detail-dt">厂商指导价：</div>
        <em>{%$tplData.orderInfo.guidePrice%}万</em>
    </div>
    <div class="detail-dl box">
        <div class="detail-dt">购车意向金：</div>
        <em>&nbsp;{%$tplData.orderInfo.couponSellPrice%}元</em>
    </div>
    <div class="detail-dl box">
        <div class="detail-dt">到店抵扣：</div>
        {%if $tplData.ticketInfo.ticketInfoRes.offlinenum%}
            <div class="flex1">共可抵扣<em>{%$tplData.orderInfo.offlineReduce%}元</em>=<em>{%$tplData.orderInfo.couponValue%}元</em>（抵扣券）+<em>{%$tplData.ticketInfo.ticketInfoRes.offlinePay%}元</em>（优惠券）</div>
        {%else%}
            <div class="flex1"><em>{%$tplData.orderInfo.couponValue%}元</em></div>
        {%/if%}
    </div>
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
    <div class="detail-dl box">
        <div class="detail-dt">在线支付：</div>
        {%if $tplData.ticketInfo.ticketInfoRes.onlinenum%}
        <div class="flex1"><em>{%$tplData.orderInfo.price%}元</em>=<em>{%$tplData.orderInfo.couponSellPrice%}元</em>（意向金）-<em>{%$tplData.ticketInfo.ticketInfoRes.onlinePay%}元</em>（优惠券）</div>
        {%else%}
        <div class="flex1"><em>{%$tplData.orderInfo.couponSellPrice%}元</em></div>
        {%/if%}
    </div>
    {%/if%}
</div>


{%if $tplData.orderInfo.state!=1 && $tplData.orderInfo.state!=3%}
            <div class="mention-cars">
                <div class="detail-dl box">
                    <div class="detail-dt">提车券号：</div>
                    <div class="flex1">{%$tplData.orderInfo.code%}<span><em>*</em>&nbsp;
                        到店时请出示提车劵号</span></div>
                </div>
                <div class="detail-dl box">
                    <div class="detail-dt">提车有效期：</div>
                    <div>{%$tplData.orderInfo.finalTime|date_format:'%Y-%m-%d %H:%M'%}</div>
                </div>
            </div>
            {%/if%}
            {%if $tplData.orderInfo.gift.name%}
            <div class="detail-gift">
                <i></i>一猫赠品： {%$giftInfo%}
            </div>
            {%/if%}
            <div class="buyer-info">
                <div class="detail-dl box">
                    <div class="detail-dt">购车人：</div>
                    <div class="flex1">{%$tplData.orderInfo.userName%} （说明：下单时填写的真实姓名）</div>
                </div>
                <div class="detail-dl box">
                    <div class="detail-dt">手机号码：</div>
                    <div>{%$tplData.orderInfo.phone%}</div>
                </div>
                <div class="detail-dl box">
                    <div class="detail-dt">预计提车时间：</div>
                    <div>{%$tplData.orderInfo.planFetchTime|date_format:'%Y-%m-%d'%}</div>
                </div>

            </div>
            <div class="car-shop">
                <div class="detail-dl box">
                    <div class="location">{%$tplData.orderInfo.pointName%}
                        <span class="location-box">
                            <i class="location-ico"></i>
                            <strong class="distance"></strong>
                        </span>
                    </div>
                </div>
                <div class="detail-dl box">
                    <div class="detail-dt">地址：</div>
                    <div class="flex1">{%$tplData.orderInfo.pointAddr%}</div>
                </div>
            </div>