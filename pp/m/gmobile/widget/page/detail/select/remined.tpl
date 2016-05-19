<!--
@require "selectView.less";
-->
<article class="popview page-remined wrapper">
    <header class="pop-headbar box">
        <div class="btn-return"></div>
        <div class="bar-lit flex1">开售短信提醒</div>
    </header>
    <section class="select-bd remind-bd">
        <p class="center">当本车开卖时我们会短信通知您</p>
        <div class="line-item box">
            <div class="line-left">手机号：</div>
            <div class="line-right flex1">
                <input type="tel" class="input-tel"/>
            </div>
        </div>
        <div class="line-item box line-captcha">
            <div class="line-left">验证码：</div>
            <div class="line-right flex1 box">
                <input type="tel" class="input-captcha flex1"/>
                <label class="send-captcha" countdown-time="120">获取验证码</label>
            </div>
        </div>
        <div class="line-item line-submit ">
            <a class="btn-confirm btn-submit" href="javascript:void(0)">确认</a>
        </div>
    </section>
</article>
        {%script%}
        require.async('./reminedView.js',function(View){
        var view=new View({pageCls:'page-remined'});
        view.init();
        });
        {%/script%}

