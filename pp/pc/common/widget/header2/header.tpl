{%$loginInfo=$tplData.__loginInfo%}
<!--<div class="top-wrap2">
    <div class="top-con page-center clearfix">
        <ul class="top-left">
            <li><a href="http://www.emao.com/" target="_blank">首页</a></li>
            <li><a href="http://news.emao.com" target="_blank">资讯</a></li>
            <li><a href="http://auto.emao.com" target="_blank">车型库</a></li>
            <li><a href="http://mall.emao.com" target="_blank">商城</a></li>
            <li><a href="{%$url.home%}">城市站</a></li>
        </ul>
        <ul class="sign-up ul-hasLogin" style="display: none">
            <li>
                <a target="_blank" class="avatar" href="http://i.emao.com/homecp/index">
                    <img src="{%$loginInfo.avatar%}" title="访问我的空间"/>
                </a>
                <a target="_blank" class="logined" href="http://i.emao.com/homecp/index" >{%$loginInfo.nickname%}</a>
                <i></i>
            </li>
            <li><a class="logout-link" act="logout" href="http://i.emao.com/?act=logout">退出</a></li>
        </ul>
        <ul class="top-right ul-noLogin">
            <li><a class="reg-link" act="register" href="http://i.emao.com/?act=register">注册</a><i></i></li>
            <li><a class="login-link" act="login" href="http://i.emao.com/?act=login">登录</a></li>
        </ul>
        <a href="javascript:void(0)" class="wx-box">
        <dl>
        <dt>关注一猫公众号</dt>
        <dd>
        <img src="/static/img/qr-wx.jpg" alt=""/>
        </dd>
        </dl>
        </a>
    </div>
</div>-->
<div class="n-width100 n-back1 n-header">
    <div class="n-width1080 n-position">
        <div class="header-nav n-fl">
            <ul>
                <li><a href="http://www.emao.com" target="_blank">首页</a></li>
                <li><a href="http://news.emao.com/" target="_blank">资讯</a></li>
                <li><a href="http://auto.emao.com/" target="_blank">车型库</a></li>
                <li><a  class="header-nav-cur" id="newCarMall" href="http://mall.emao.com/" target="_blank">商城</a></li>
                <li><a href="http://dealer.emao.com/beijing/" target="_blank">城市站</a></li>
            </ul>
        </div>
        <div class="head-set n-fr" id="user_bar_login">
            <div class="head-set-link"><!--未登录-->
                <a href="http://i.emao.com/?callbackUrl={%$url%}{%$smarty.server.REQUEST_URI%}" class="head-set-login" title="登录">登录</a>
                <a href="http://i.emao.com/?act=register&callbackUrl={%$url%}{%$smarty.server.REQUEST_URI%}" class="head-set-register" title="注册">注册</a>
            </div>
            <div class="head-set-my"><!--已登录-->
                <div class="head-set-name">
                    <a href="http://i.emao.com/homecp/index/">欢迎您，</a>
                </div>
                <div class="head-set-message" id="slide2">
                    <p><i class="set-message-icon"></i></p>
                    <em class="head-set-point" id="all_notice" style="display: inline;"></em>
                    <ul class="slideCon" style="display: none;">
                        <li id="notice_num">
                            <a href="http://i.emao.com//homecp/message/notice/read/1">
                                <span>消息</span>
                                <em></em>
                            </a>
                        </li>
                        <li id="atme_num">
                            <a href="http://i.emao.com//homecp/message/user/read/1">
                                <span>@我</span>
                                <em></em>
                            </a>
                        </li>
                        <li id="comment_num">
                            <a href="http://i.emao.com//homecp/message/sys/read/1">
                                <span>评论</span>
                                <em></em>
                            </a>
                        </li>
                        <li id="follow_num">
                            <a href="http://i.emao.com//35630/friend/list_1_1.html">
                                <span>粉丝</span>
                                <em></em>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="head-set-handle" id="slide3">
                    <p><i class="set-handle-icon"></i></p>
                    <ul class="slideCon" style="display: none;">
                        <li><a href="http://i.emao.com//homecp/user/userinfo/">账号设置</a></li>
                        <li><a href="http://i.emao.com//homecp/user/catverify/check/">猫友认证</a></li>
                        <li><a href="http://i.emao.com/?callbackUrl=http://i.emao.com/homecp/index&amp;act=logout">退出登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="head-wrap2">
    <div class="page-center">
        <div class="header">
            <div class="logo">
                <a href="{%$url.home%}">
                    <img class="img-logo" src="/static/img/51logo.png" alt=""/>
                    <img class="img-ye" src="/static/img/logo-ye.png" alt=""/>
                </a>
            </div>

            {%if $tplData.curCity.cityName%}
            <div class="adress-put">
                <span>所在城市：</span>
                <span class="adre-font">{%$tplData.curCity.cityName|default:'北京'%}</span>
                {%if $tplData.openCity%}
                <span class="arrow-down"></span>
                <div class="adre-tips">
                    <div class="city-hot">
                        <span class="pov">
                            热&nbsp;门：
                        </span>
                         <span class="city">
                             {%foreach $tplData.hotCity as $i=>$item%}
                             <a href="{%get_cityurl city=$item.pinyin%}{%$urlLast%}" title="{%$item.cityName%}">{%$item.cityName%}</a>
                             {%/foreach%}
                        </span>
                    </div>
                    <dl>
                        {%foreach $tplData.openCity as $i=>$province%}
                        <dd>
                            <span class="pov">
                                {%$province.provinceName%}：
                            </span>
                            <span class="city">
                                 {%foreach $province.citys as $i=>$item%}
                                 <a href="{%get_cityurl city=$item.pinyin%}{%$urlLast%}" title="{%$item.cityName%}">{%$item.cityName%}</a>
                                 {%/foreach%}
                            </span>
                        </dd>
                        {%/foreach%}
                    </dl>
                </div>
                {%/if%}
            </div>
            {%/if%}
           <!-- <a href="javascript:void(0)" class="qr-box">
            <dl>
                <dt>APP</dt>
                <dd>
                    <img src="/static/lib/img/qr.png" alt=""/>
                    <p>
                        <strong>一猫APP</strong><br/>
                        买车上一猫，省钱更省心
                    </p>
                </dd>
            </dl>
            </a>-->
            {%if $tplData.__channel=="ju"%}
            {%widget name="common:widget/navbar/nav.tpl" selectIndex=3 hasAllLine=1%}
            {%/if%}
            <p class="kf-info">
                <span class="kf-tel">客服电话：400-890-3881</span><br/>
                <span class="kf-time">周一至周六9:00-19:00</span>
            </p>
            <div class="new-year">
                <img src="/static/img/gif2.gif" alt=""/>
            </div>

        </div>
    </div>
</div>
{%script%}
    require.async('./header.js', function(header){
        header.init();
    });
{%/script%}
{%script%}
    require.async('common:widget/ui/base/utils.js', function(utils){
        $('.reg-link,.login-link,.logout-link').each(function(){
            var url='http://i.emao.com/?act='+$(this).attr('act')+'&callbackUrl='+encodeURIComponent(location.href)
            $(this).attr('href',url);
        })
    });
{%/script%}
{%script type="text/javascript"%}

    window.URL={"home":"http://mall.emao.com/","brandUrl":"http:\/\/brand.emao.com","autoUrl":"http:\/\/auto.emao.com\/","newsUrl":"http:\/\/news.emao.com\/","imgUrl":"http:\/\/img.emao.net","search":"http:\/\/so.emao.com\/","teJiaUrl":"http:\/\/temai.emao.com\/","mallUrl":"http:\/\/mall.emao.com\/","dealerUrl":"http:\/\/dealer.emao.com\/","appUrl":"http:\/\/app.emao.com\/","iUrl":"http:\/\/i.emao.com\/","wwwUrl":"http:\/\/www.emao.com","hdsUrl":"http:\/\/www.handaishu.com","teJiaCityArr":null,"sUrl":"\/","passportUrl":"\/"};
{%/script%}


