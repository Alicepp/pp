    <article class="page-wish2 page-wish">
        <div class="serie-tit">您已选择的车型</div>
        <div class="serie-box center">
        </div>
        <form class="serie-form" action="">
            <ul>
                <li class="li-desire li-select center-v">
                    <div class="txt">预计购车时间</div>
                    <select name="desire" >
                        <option value="">预计购车时间</option>
                        {%foreach $tplData.desireTime as $k=>$time%}
                        <option value="{%$k%}">{%$time%}</option>
                        {%/foreach%}
                    </select>
                </li>
                <li class="li-province li-select center-v">
                    <div class="txt">选择省份</div>
                    <select name="province" >
                        <option value="">选择省份</option>
                        {%foreach $tplData.province as $i=>$item%}
                        {%if $item.ProvinceId!=32 && $item.ProvinceId!=33 && $item.ProvinceId!=34%}
                            <option value="{%$item.ProvinceId%}">{%$item.ProvinceName%}</option>
                        {%/if%}
                        {%/foreach%}
                    </select>
                </li>
                <li class="li-city li-select center-v">
                    <div class="txt">选择城市</div>
                    <select name="city" ></select>
                </li>
                <li class="li-tel li-input center-v">
                    <input type="tel" class="input-tel flex1" name="phone" placeholder="填写手机号码"/>
                </li>
                <li class="li-tel li-input center-v">
                    <input type="tel" class="input-code flex1" name="code" placeholder="填写验证码"/>
                    <div class="send-captcha " countdown-time="60">获取验证码</div>
                </li>
            </ul>

        </form>
        <footer class="wish-footer box center borderbox">
            <div class="prev-btn page-btn visible" pageCls="page-wish1">上一步</div>
            <div class="next-btn page-btn visible btn-submit" >下一步</div>
        </footer>

    </article>

    {%script%}
    require.async(['./wish2.js'],function(App){
    var app=new App;
    app.init()
    });
    {%/script%}