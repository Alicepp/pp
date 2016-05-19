<div class="pop-ms">
    <div class="ms-bg"></div>
    <div class="ms-box">
        <div class="ms-head"><i class="backBtn"><img src="back.png"></i></div>
        <form class="ms-act" action="">
            <div class="ms-line">
                <div class="line-lf">抢购车型：</div>
                <div class="line-rt carname" id="gid">{%$carTit|escape:none%}</div>
            </div>
            <div class="ms-line">
                <div class="line-lf">姓名：</div>
                <div class="line-rt">
                    <input maxlength="15" class="name-input" type="text"/>
                </div>
            </div>
            <div class="ms-line">
                <div class="line-lf">手机号：</div>
                <div class="line-rt">
                    <input class="phone-input" type="text"/>
                </div>
            </div>
            <div class="ms-line">
                <div class="line-lf">验证码：</div>
                <div class="line-rt">
                    <input id="code" class="ma-input" type="text"/>
                    <a  class="huoqu" href="javascript:void(0)">获取验证码</a>
                    <span class="second-down"><b>60</b>S</span>
                </div>
            </div>
            <div class="ms-line">
                <div class="line-lf">所在城市：</div>
                <div class="line-rt pro">
                    <select name="province" id="province" class="mar-rt20">
                    <option value="0">选择省份</option>
                    {%foreach $tplData.allprovince as $i=>$item%}
                    <option value="{%$item.provinceid%}">{%$item.provincename%}</option>
                    {%/foreach%}
                    </select>
                    <select name="city" id="city">
                    <option value="0">选择城市</option>
                    </select>
                </div>
            </div>
            <div class="ms-line">
                <div class="line-lf">意向车型：</div>
                <div class="line-rt lisCar">
                    <select class="subBrandId" name="subBrandId">
                    <option>品牌</option>
                    </select>
                    <select class="s_serie_id">
                    <option>车系</option>
                    </select>
                    <select class="s_car_id">
                    <option>车型</option>
                    </select>
                </div>
            </div>
            <div class="ms-get">提交并获取抢购资格</div>
        </form>

    </div>

</div>
