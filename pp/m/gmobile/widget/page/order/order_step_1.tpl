{%$giftInfo=$tplData.giftInfo%}
<!--
    @require "order_step.less"
-->
{%widget name="gmobile:widget/userHead/userHead.tpl" lit="确认订单"%}
<section class="order-wrap">
    <div class="order-box">
        <h3 class="column-tt">省钱买车只需3步！</h3>
        <ul class="order-step">
            <li class="cur"><i>1</i>填写购车信息并核对订单</li>
            <li><i>2</i>选择支付方式</li>
            <li><i>3</i>购买成功</li>
        </ul>
    </div>
    <div class="order-box">
        <h3 class="column-tt">填写购车信息</h3>
        <form action="" method="post">
            <input id="formHash" type="hidden" name="formhash" value="{%$tplData.formhash%}"/>
            <input id="autoId" type="hidden" name="autoId" value="{%$tplData.autoId%}"/>
            <input type="hidden" id="partsid" name="partsid" value="{%$tplData.partsid%}"/>
            <input type="hidden" id="depositId" name="depositId" value="{%$tplData.depositId%}"/>
            <input type="hidden" id="goodsId" name="goodsId" value="{%$tplData.goodsId%}"/>
            <input type="hidden" id="colorId" name="colorId" value="{%$tplData.colorId%}"/>
            <input type="hidden" id="gType" name="gType" value="{%$tplData.gType%}"/>
            <input type="hidden" id="pointId" name="pointId" value="{%$tplData.pointId%}"/>
            <input type="hidden" id="bankId" name="bankId" value="{%$tplData.bankId%}"/>
            <input type="hidden" id="loanRatio" name="loanRatio" value="{%$tplData.loanRatio%}"/>
            <input type="hidden" id="firstPay" name="firstPay" value="{%$tplData.firstPay%}"/>
            <input type="hidden" id="stag" name="stag" value="{%$tplData.stag%}"/>
            <input type="hidden" id="cityId" name="cityId" value="{%$tplData.cityId%}"/>
            <input type="hidden" id="dealerid" name="dealerid" value="{%$tplData.dealerid%}"/>
            <ul class="gc-info">
                <li class="box">
                    <div class="li-label">
                        <label>购车人：</label>
                    </div>
                    <div class="li-right flex1">
                        <input id="username" type="text" maxlength="31" value=""/>
                        <em class="defaultNotice"><i>*</i>需填写最终购车发票人姓名</em>
                        <em class="notice"></em>
                    </div>
                </li>
                <li class="box">
                    <div class="li-label">
                        <label>手机号码：</label>
                    </div>
                    <div class="li-right flex1">
                        <input id="phoneNumber" type="tel" value="" />
                        <em class="defaultNotice"><i>*</i>用于接收购车验证码，请确保正确</em>
                        <em class="notice"></em>
                    </div>
                </li>
                <li class="box">
                    <div class="li-label">
                        <label>购车城市：</label>
                    </div>
                    <div class="li-right flex1">
                        <span>{%$tplData.city%}</span>
                    </div>
                </li>
                <li class="box">
                    <div class="li-label">
                        <label>预计提车时间：</label>
                    </div>
                    <div class="li-right flex1">
                        <span class="calendar-wrap">
                            <input id="calendarDate" name="planFetchTime" type="text" value="{%$smarty.now|date_format:'%Y-%m-%d'%}" readonly="readonly" />
                            <i class="date-ico"></i>
                        </span>
                    </div>
                </li>
                <li class="box">
                    <div class="li-label">
                        <label>购车经销商：</label>
                    </div>
                    <div class="li-right flex1">
                        <span>{%$tplData.dealerName%}</span>
                    </div>
                </li>
            </ul>
        </form>
    </div>
    <div class="gc-ps">
        <span><strong>*</strong></span><p>如果您想将现有车牌使用于新车，请提前交易旧车或到提车4S经销商办理二手车置换业务</p>
    </div>
    <div class="order-box">
        <h3 class="column-tt">确认订单</h3>
        <div class="gc-pic">
            <img src="{%$tplData.__imgDom%}{%$tplData.autoPic%}" alt=""/>
        </div>
        {%widget name="gmobile:widget/page/order/info/info`$tplData.tpl`.tpl"%}

    </div>

    <!--贷款信息 -->
    {%if $tplData.bankId%}
    {%widget name="gmobile:widget/page/order/pay/pay.tpl"%}
    {%/if%}


    {%if $tplData.ticketCount>0%}
    <div class="order-box" >
        <h3 class="column-tt" >
            <span class="lt"><strong>优惠劵：</strong>最多可用<em>{%$tplData.ticketCount%}</em>张</span>
            <a class="my-ticket" href="http://i.m.emao.com/homecp/shangcheng/?c=users/ticket&a=ticket">我的卡券></a>
        </h3>
        <div class="order-volume" maxNum="{%$tplData.ticketCount%}">
            <ul class="vol-list">

                <li class="box unchoose">
                    <div class="li-volNum">
                        东风标致8月畅想好礼活动
                    </div>
                    <div class="li-volVal flex1">
                       <span class="num-red">5000元</span>
                    </div>
                    <div class="li-choose"></div>
                </li>
                <li class="box">
                    <div class="li-volNum">
                        东风标致8月畅想好礼活动
                    </div>
                    <div class="li-volVal flex1">
                       <span class="num-red">5000元</span>
                    </div>
                    <div class="li-choose"></div>
                </li>
            </ul>
            <div class="vol-fild">
                <p class="vol-lable">手动输入一猫优惠券</p>
                <div class="vol-inputs box">
                    <input type="tel" class="flex1"/>
                    <input type="tel" class="flex1"/>
                    <input type="tel" class="flex1"/>
                    <input type="tel" class="flex1"/>
                </div>
            </div>
            <div class="vol-line vol-fail">
                <p>优惠码无效，如有疑问请咨询淘车猫客服</p>
                <a class="tel-number" href="tel:4008903881"></a>
            </div>
        </div>
    </div>
    {%/if%}
</section>
{%widget name="gmobile:widget/page/order/price/price`$tplData.tpl`.tpl"%}
<div class="order-sub">
    {%if $tplData.tpl==5||$tplData.tpl==6||$tplData.tpl==7||$tplData.tpl==8||$tplData.tpl==9%}
    <a class="sub-btn" href="#" id="btn-order-1" onclick="ga('send','event','gmall_wap','tjorder1_wap','{%$tplData.goodsId%}');">提交订单</a>
    {%else%}
    <a class="sub-btn" href="#" id="btn-order-1">提交订单</a>
    {%/if%}
    <div class="order-sum volPrice" key="online"  price="{%$tplData.orderPrice%}">
        <p>实付金额：</p>
        <em>{%$tplData.orderPrice%}</em>
        <span>元</span>
    </div>
</div>
{%script%}
    require.async('./order.js',function(order){
        order.init({%$tplData.ticket|json_encode|escape:none%});
        $('#calendarDate').mdater({
            minDate : new Date()
        });
    });
{%/script%}