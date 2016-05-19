<div class="tip-bar">
    <div class="bg"></div>
    由于你的浏览器版本过低，会影响你的浏览效果，建议您升级浏览器版本以达到最佳浏览效果页面，最佳浏览分辨率为1600X900！
</div>
<div class="nav-bot">
    <h2>东风标致2008 一猫车商城定制版限量预订，领券支付再享折上折！</h2>
    <a class="zhifu" href="http://mall.emao.com/car/1379.html" target="_blank">立即抢购</a>
</div>
<div class="fullpage" style="height: 100%; position: relative; touch-action: none; transform: translate3d(0px, 0px, 0px); transition: all 700ms ease;">
    <div class="col1 section">


            <div class="img1"></div>
            <div class="img2"></div>
            <div class="img3"></div>
            <div class="img4"></div>
            <div class="img5"></div>

        <div class="col1-font">
            <h2>城会玩 座驾专属定制</h2>
            <h3>配置任你选，价格我们砍！</h3>
            <p>· 个性：在线定制  专属座驾</p>
            <p>· 实惠：领券下单  优惠再减</p>
            <p>· 承诺：先行支付  提前发车  交付延误补偿</p>
        </div>

    </div>
    <div class="section col2">
        <h2>定 制 版 专 属 全 景 天 窗</h2>
        <div class="yun1"></div>
    </div>
    <div class="section col3">
        <dl>
            <dt> 距离优惠结束还有</dt>
            <dd>
                <div class="btn-bg btn-bg-left"></div>
                <div class="col3-time" nowTime="{%$smarty.now|date_format:'%Y/%m/%d,%H:%M:%S'%}" endTime="2015/10/21 00:00:00">
                    <em>00</em>
                    <span>:</span>
                    <em>00</em>
                    <span>:</span>
                    <em>00</em>
                </div>
                <div class="btn-bg btn-bg-right flex1"></div>
            </dd>
        </dl>
        <!--<div class="col3-font">-->
            <!--距离新车开售还有-->
        <!--</div>-->
        <!--<div class="col3-time" nowTime="{%$smarty.now|date_format:'%Y/%m/%d,%H:%M:%S'%}" endTime="2015/10/01 00:00:00">-->
            <!--<em>29</em><em>45</em><em>66</em>-->
        <!--</div>-->
    </div>
    <div class="section col4">

        <div class="col4-scale">

            <div class="col4-car"></div>


            <div class="col4-font">
                <h2>东风标致2008 一猫车商城定制版！</h2>
                <h3>基于东风标致 2014款 自动潮流型加装</h3>
                <div class="col4-slide">
                    <div class="but-lf"></div>
                    <div class="slide-con">
                        <ul class="slide-img">
                            <li>
                                <img src="img/chuan.png" alt=""/>
                                <h2>全景天窗</h2>
                                <p>没有全景天幕玻璃顶的视野，车顶一体化玻璃设计，领略天外有天！完美采光放肆身心，风光尽览，无须动身就已动心！</p>
                            </li>
                            <li>
                                <img src="img/pic_03.png" alt=""/>
                                <h2>一键启动</h2>
                                <p>自动感应开关门，一键完成车辆启停，欢迎来到智能未来！</p>
                            </li>
                            <li>
                                <img src="img/pan.png" alt=""/>
                                <h2>多媒体</h2>
                                <p>信手由缰，划定尊享领地，音频/视频连接及FM/AM收音机，蓝牙免提电话等多媒体娱乐功能——全等你的指尖调遣！</p>
                            </li>
                            <li>
                                <img src="img/dao.png" alt=""/>
                                <h2>360度影像</h2>
                                <p>“倒”处都有你的眼线！车后动静全在眼前，配合倒车雷达，一切情况尽收你的法眼！</p>
                            </li>
                            <li>
                                <img src="img/xi.png" alt=""/>
                                <h2>胎压监测</h2>
                                <p>在路上，安全了如指掌，无“压”力向前行，看一路美好风景。</p>
                            </li>
                            <li>
                                <img src="img/car.png" alt=""/>
                                <h2>运动套件</h2>
                                <p>个性真我，跃动与心，车身前后独一无二的运动套件配置，享受100%的回头率。</p>
                            </li>
                        </ul>
                    </div>

                    <div class="but-rt"></div>
                    <div class="col4-p">
                        <p>· 个性主题组合</p>
                        <p>· 6大配置选装</p>
                        <p>· 多种组合方案搭配</p>
                        <p>· 鼠标一点 创造自己专属座驾</p>
                    </div>

                </div>

            </div>
        </div>

    </div>
    <div class="section col5">
        <div class="col5-font">
            <p>在线支付订金，抢优惠券立享最高 <em>双重优惠</em>！<br/>
                厂商配送，安全放心！<br/>

            </p>
            <ul class="user">
            </ul>
        </div>
        <div class="col5-scale">
            <div class="quan200" hour="{%$nowHour%}" aaa="{%($nowHour>16)|var_dump%}">

                {%if $smarty.now<$startTime%}
                <div class="quan-but bgyel">即将开始</div>
                {%elseif $smarty.now>$endTime%}
                <div class="quan-but timeout" price="200">已结束</div>
                {%elseif !$tplData.todayIsCanDo200%}
                <div class="quan-but timeout">今天已领完</div>
                {%elseif ($nowHour>9)&&($nowHour<17)%}
                <div class="quan-but quan-click bgyel" price="200" onclick="ga('send', 'event', 'dfbz_dzx', 'submit_s');">立即领取</div>
                {%elseif ($nowHour<10)%}
                <div class="quan-but bgyel">即将开始</div>
                {%elseif ($nowHour>16)%}
                <div class="quan-but bgyel" >明天再来</div>
                {%/if%}

            </div>
            <div class="quan2000" hour="{%$nowHour%}">
                {%if $smarty.now<$startTime%}
                <div class="quan-but bgbai">即将开始</div>
                {%elseif $smarty.now>$endTime%}
                <div class="quan-but timeout" now="{%$smarty.now%}" end="{%$endTime%}">已结束</div>
                {%elseif !$tplData.todayIsCanDo2000%}
                <div class="quan-but timeout">今天已领完</div>
                {%elseif ($nowHour>9)&&($nowHour<17)%}
                <div class="quan-but quan-click bgbai" price="2000" onclick="
ga('send', 'event', 'dfbz_dzx', 'submit');">立即领取</div>
                {%elseif ($nowHour<10)%}
                <div class="quan-but bgbai">即将开始</div>
                {%elseif ($nowHour>16)%}
                <div class="quan-but bgbai">明天再来</div>
                {%/if%}

            </div>
        </div>

    </div>
    <div class="section col6">
        <div class="col6-font">
            <h2>优惠券使用流程</h2>
            <div class="liu">
                <ul class="list">
                    <li style="padding-top: 46px">在线抢券</li>
                    <li style="padding-top: 65px">选择爱车</li>
                    <li>下单验证</li>
                    <li>支付订金</li>
                    <li>线下提车</li>
                </ul>
            </div>
        </div>
        <div class="col6-car"></div>
    </div>
    <div class="section col7">
        <div class="col7-font">
            <h2>活动规则</h2>
            <p>1：此活动期间优惠券可与预热期活动（9月1日-9月15日）活动优惠券叠加使用；</p>
            <p>2：同一ID不同面值优惠券最多可各领取一张；</p>
            <p>3：此活动优惠券有效使用时间为2015年9月21日至12月31日；</p>
            <p>4：此活动优惠券仅可用于购买东风标致2008定制版车型；</p>
            <p> 5：本活动最终解释权归一猫汽车网所有；</p>
        </div>
        <div class="col7-car"></div>
    </div>
</div>
<div id="fp-nav" class="right">
    <ul>
        <li>
            <a class="active" href="#0">
                <span></span>
            </a>
        </li>
        <li>
            <a href="#1">
                <span></span>

            </a>
        </li>
        <li>
            <a href="#2">
                <span></span>

            </a>
        </li>
        <li>
            <a href="#3">
                <span></span>

            </a>
        </li>
        <li>
            <a href="#4">
                <span></span>
                <em class="qian"><img src="img/bao.gif" alt=""/></em>
            </a>
        </li>
        <li>
            <a href="#5">
                <span></span>
            </a>
        </li>
        <li>
            <a href="#6">
                <span></span>

            </a>
        </li>
    </ul>
</div>
<div class="mask-floor"></div>
<div class="tips-box">
    <div class="tips-head">
        填写购车人信息
    </div>
    <div class="close"></div>
    <div class="tips-con">
        <div class="tips-info">
            <ul class="self-list">
                <li>
                    <label>姓名：</label>
                    <input class="input-bg" name="name" type="text"/>
                </li>
                <li>
                    <label>手机：</label>
                    <input class="input-bg" name="phone" type="text"/>
                </li>
                <li>
                    <label>城市：</label>
                    <input class="input-bg" name="city" type="text"/>
                </li>
            </ul>
            <div class="queding" onclick="ga('send', 'event', 'dfbz_dzx', 'submit_success');">确认</div>
        </div>
        <div class="suc-con">
            <p class="suc-font">领取成功</p>
            <p class="suc-quan">券号：<span></span></p>
            <a class="suc-but" href="{%$url['home']%}" onclick="ga('send', 'event', 'dfbz_dzx', 'goto');">券到手~快去商城里嘚瑟一下吧</a>
        </div>
        <div class="fail-con">
            <p class="fail-font">不要贪心~您的手机号已参与过活动了</p>
            <a class="fail-but right" href="javascript:;">返回活动页</a>
            <a class="fail-but" href="{%$url['home']%}" onclick="ga('send', 'event', 'dfbz_dzx', 'goto');">返回商城首页</a>
        </div>
    </div>
</div>
{%script%}
require.async('./ding.js',function(ding){
    ding.init();
});
{%/script%}
<script type="text/javascript">
    var _mvq = _mvq || [];
    _mvq.push(['$setAccount', 'm-114937-0']);

    _mvq.push(['$logConversion']);
    (function() {
        var mvl = document.createElement('script');
        mvl.type = 'text/javascript'; mvl.async = true;
        mvl.src = ('https:' == document.location.protocol ? 'https://static-ssl.mediav.com/mvl.js' : 'http://static.mediav.com/mvl.js');
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(mvl, s);
    })();

</script>