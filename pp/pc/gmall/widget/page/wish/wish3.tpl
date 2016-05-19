

    <div class="wish3 center wish-bg clearfix">
        <div class="wish-lit">
            购车愿望提交
        </div>
        <form id="buy-car-form" method="" action="">
            <div class="sel-model">
                <div class="select">
                    <dl class="buy-car-info">
                        <dt>意向车型：</dt>
                        <dd>
                            <select class="subBrandId" name="subBrandId">
                            </select>
                            <select class="s_serie_id">
                                <option>车系</option>
                            </select>
                            <select class="s_car_id">
                                <option>车型</option>
                            </select>
                        </dd>
                    </dl>
                </div>
                <p class="add-sel">
                    <span><img src="img/add-icon.png"></span>
                    <em>(剩余<i>4</i>个)</em>
                </p>
            </div>
            <dl class="buy-car-info" id="times">
                <dt>预计购车时间：</dt>
                <dd>
                    {%foreach $tplData.desireTime as $k=>$time%}
                    {%if $time@first%}
                    <a class="active" time-id="{%$k%}" href="javascript:void(0)">{%$time%}</a>
                    {%else%}
                    <a time-id="{%$k%}" href="javascript:void(0)">{%$time%}</a>
                    {%/if%}
                    {%/foreach%}
                </dd>
            </dl>
            <dl class="buy-car-info">
                <dt>提车城市：</dt>
                <dd>
                    <select name="province" id="province" class="mar-rt20">
                        <option value="0">选择省份</option>
                        {%foreach $tplData.province as $i=>$item%}
                            {%if $item.ProvinceId != 32 and $item.ProvinceId != 33 and $item.ProvinceId != 34%}
                                <option value="{%$item.ProvinceId%}">{%$item.ProvinceName%}</option>
                            {%/if%}

                        {%/foreach%}
                    </select>
                    <select name="city" id="city">
                        <option value="0">选择城市</option>
                    </select>
                </dd>
            </dl>
            <dl class="buy-car-info">
                <dt>其它需求：</dt>
                <dd><textarea class="phone-text" id="phone-text"maxlength="200" ></textarea></dd>
            </dl>
            <dl class="buy-car-info">
                <dt>手机号码：</dt>
                <dd><input class="phone-input" type="text"/><span>请输入手机号，当您提交的车系开售时， 我们将会短信通知您</span></dd>
            </dl>
            <dl class="buy-car-info">
                <dt>验证码：</dt>
                <dd><input class="ma-input" type="text"/><a id="code" class="huoqu" href="javascript:void(0)">获取验证码</a><span class="second-down"><b>60</b>秒后重新获取</span></dd>
            </dl>
            <div class="wish-buttom mar-lf115">
               <!--  <div class="pre-but page-btn" to="wish2">上一步</div> -->
                <div class="next-but page-btn sub-bt" to="wish4">提交</div>
            </div>
        </form>
    </div>
            {%script%}
            require.async(['./wish3.js'],function(App){
            var app=new App;
            app.init()
            });
            {%/script%}