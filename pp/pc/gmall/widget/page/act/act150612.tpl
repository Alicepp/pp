<!--
    @reqiure "act150612.less"
-->
<div class="wrap-body">
    <div class="wrap">
        <div class="wrap-center">
            <div class="tab-box">
                <ul class="tab-nav">
                    <li class="active">活动细则 <span></span></li>
                    <li>发票审核标准<span></span></li>
                </ul>
                <div class="tab-con">
                    <div>
                        <img src="img/img150612/act_1.jpg" alt=""/>
                        <img src="img/img150612/act_2.jpg" alt=""/>
                        <img src="img/img150612/act_3.jpg" alt=""/>
                        <img src="img/img150612/act_4.jpg" alt=""/>
                    </div>
                    <div style="display: none">
                        <img src="img/img150612/act_33.jpg" alt=""/>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrap-bottom">
            <a href="{%$url.home%}" class="back-btn">返回活动页</a>
        </div>

    </div>
</div>
{%script%}
    $('.tab-nav li').click(function(){
        $(this).addClass('active').siblings().removeClass('active');
        $('.tab-con div').eq($(this).index()).show().siblings().hide();

    })
{%/script%}