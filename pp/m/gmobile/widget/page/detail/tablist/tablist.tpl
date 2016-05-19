<div class="leftnav">
    <ul class="lfnav-ul box borderbox" id="detail-tab">
        <li class="lfnav-li selected">商品详情</li>
        <li class="lfnav-li commentsCount">商品评价(<em>0</em>)</li>
    </ul>
</div>
<div class="detail-plist">
    <div class="pitem">
        {%$carInfo.pcContent|escape:none%}
        {%$carInfo.serviceContent|escape:none%}
        {%$carInfo.huodongContent|escape:none%}
        {%if $carInfo.__lastCategory.tpl!=8&&$carInfo.__lastCategory.tpl!=9%}
            <div class="detail-class">
                <div class="class-item">车型配置</div>
            </div>
            <div class="detail-con-box model-show">
                <section class="car-vehicle">
                    <h4>
                        <span><em class="car-vehicle-standard"></em>标配</span>
                        <span>-无配置</span>
                        <span><em class="car-vehicle-select"></em>选配</span>
                    </h4>
                </section>
                <div class="autoParamList">
                    {%widget name="gmobile:widget/page/detail/autoParam.tpl"%}
                </div>
            </div>
        {%/if%}
    </div>
    <div class="pitem discuss" style="display: none">
        <ul class="dis-list box com-score">
            <li class="ping flex1 commentsCount10" score="10">好评(<em>0</em>)</li>
            <li class="ping flex1 commentsCount5" score="5">中评(<em>0</em>)</li>
            <li score="1" class="bad-dis ping flex1 commentsCount1">差评(<em>0</em>)</li>
            <li class="pingjia flex1 want-com">我要评价</li>
        </ul>
        <div class="discuss" id="discuss" goodsId="{%$tplData.goods.id%}" objType="{%$tplData.objType%}">

        </div>

    </div>
</div>
<div class="wrap-mask mask-foot" style="display: none">
    <div class="dis-haslogin">
        <div class="dis-text">
            <ul class="agree box borderbox" id="agree">
                <li class="flex1 select" score="10">非常满意</li>
                <li class="flex1" score="5">一般满意</li>
                <li class="flex1" score="1">不满意</li>
            </ul>
            <div class="reply-foot box">
                <textarea class="dis-input dis-com flex1" name="content" placeholder="输入你要评论的内容吧（1-300字）" maxlength="300"></textarea>
                <div class="btn-primary" name="">发表评论</div>
            </div>
        </div>
    </div>
</div>