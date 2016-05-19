{%$scoreList=[
'1'=>'不满意',
'5'=>'一般满意',
'10'=>'非常满意'
]%}

    {%if !$smarty.get.page||$smarty.get.page==1%}
    {%if $tplData['__loginInfo']['id']%}
    <div class="dis-haslogin" >
        <div class="satis">
            <div class="head-portrait">
                <img src="{%$tplData.__loginInfo.avatar%}" alt=""/>
            </div>
            <dl class="agree">
                <dt>满意度：</dt>
                <dd><input type="radio" name="score" checked="checked" value="10"/><label>非常满意</label></dd>
                <dd><input type="radio" name="score" value="5"/><label>一般满意</label></dd>
                <dd><input type="radio" name="score" value="1"/><label>不满意</label></dd>
            </dl>
        </div>
        <div class="dis-text" >
            <textarea class="dis-input dis-com" name="content" placeholder="输入你要评论的内容吧（1-300字）"  maxlength="300"></textarea>
            <div class="btn-wrap clearfix">
                <div class="btn-primary" name="" >发表评论</div>
                <div class="font-num"><em>0</em>/300</div>
            </div>
        </div>
    </div>
    {%else%}

    <div class="dis-nologin btn-wrap">
        <div class="dis-login">
            <p>请<a href="http://passport.emao.com/login">登录</a>后才可以发表评论，或<a href="http://passport.emao.com/register">免费注册</a></p>
        </div>
        <div class="btn-wrap clearfix">
            <div class="font-num">0/300</div>
        </div>
    </div>
    {%/if%}
    {%/if%}
    {%foreach $tplData.comments.commentList as $item%}
    <div class="dis-reply" id="reply-{%$item.id%}" replyId="{%$item.id%}" touserid="{%$item.userId%}" replyName="{%$item.user.nickname%}" replyUserUrl="{%$item.user.url%}">
        <div class="dis-item" replyId="{%$item.id%}">
            <div class="header"><img src="{%$item.user.avatar%}" alt=""/></div>
            <div class="dis-info">
                <a class="dis-name" href="{%$item.user.url%}">{%$item.user.nickname%}</a><i>{%$item.addTime%}</i>
                <p class="satis-extent">满意度：{%$scoreList[$item.score]%}</p>
                <p class="comment-con">{%$item.content%}</p>
                {%widget name="gmall:widget/page/detail/replybox.tpl"%}

                <!--<div class="reply-box" style="display: none;">-->
                    <!--<textarea class="reply-text dis-com" name="reply-con" id="reply-con" placeholder="我也说一句" maxlength="300"></textarea>-->
                    <!--<div class="reply-wrap clearfix">-->
                        <!--<button class="btn-primary" name="">发表评论</button>-->
                        <!--<div class="font-num"><em>0</em>/300</div>-->
                    <!--</div>-->
                <!--</div>-->
            </div>
            <div class="cite">
                <span class="huifu"><i></i>{%$item.replyInfo.count%}</span>
                <span class="zan"><i></i><em>{%$item.supportNum%}</em></span>
            </div>
        </div>
        <div class="wrap-pin">
            {%widget name="gmall:widget/page/detail/reply.tpl" item=$item%}
        </div>
    </div>
    {%/foreach%}
    {%if $tplData.comments.pageList%}
    <div class="page-box clearfix home-pag">
        {%$tplData.comments.pageList|escape:none%}
        <!--<ul class="page-list">-->
            <!--<li><a class="link" href="" page="2">上一页</a></li>-->
            <!--<li><a href="" page="1">1</a></li>-->
            <!--<li><a href="" page="2">2</a></li>-->
            <!--<li><a class="active" href="">3</a></li>-->
            <!--<li><a href="">...</a></li>-->
            <!--<li><a href="">7</a></li>-->
            <!--<li><a href="">8</a></li>-->
            <!--<li><a href="">下一页</a></li>-->
        <!--</ul>-->
    </div>
    {%/if%}
<input type="hidden" id="userUrl" value="http://i.emao.com/{%$tplData.__loginInfo.id%}/main"/>
<input type="hidden" id="userAvatar" value="{%$tplData.__loginInfo.avatar%}"/>
<input type="hidden" id="userName" value="{%$tplData.__loginInfo.username%}"/>
<input type="hidden" id="userID" value="{%$tplData.__loginInfo.id%}"/>

