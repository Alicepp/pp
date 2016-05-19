{%$scoreList=[
'1'=>'不满意',
'5'=>'一般满意',
'10'=>'非常满意'
]%}
{%foreach $tplData.comments.commentList as $item%}
<div class="dis-reply" id="reply-{%$item.id%}" touserid="{%$item.userId%}" replyId="{%$item.id%}" replyName="{%$item.user.nickname%}" replyUserUrl="{%$item.user.url%}">
    <div class="dis-item" replyId="{%$item.id%}">
        <div class="box">
            <div class="header"><img src="{%$item.user.avatar%}" alt=""/></div>
            <div class="dis-info flex1">
                <a class="dis-name" href="{%$item.user.url%}">{%$item.user.nickname%}</a><i>{%$item.addTime%}</i>
                <p class="satis-extent">满意度：{%$scoreList[$item.score]%}</p>
                <p class="comment-con">{%$item.content%}</p>

            </div>
        </div>
        <div class="cite">
            <span class="huifu"><i></i>{%$item.replyInfo.count%}</span>
            <span class="zan"><i></i><em>{%$item.supportNum%}</em></span>
        </div>
        {%widget name="gmobile:widget/page/detail/tablist/replybox.tpl"%}
    </div>
    <div class="wrap-pin">
        {%widget name="gmobile:widget/page/detail/tablist/reply.tpl" item=$item%}
    </div>
</div>
{%/foreach%}

{%if $tplData.comments.pageList%}
<div class="page-box clearfix home-pag">
    {%$tplData.comments.pageList|escape:none%}
</div>
{%/if%}
<input type="hidden" id="userUrl" value="http://i.emao.com/{%$tplData.__loginInfo.id%}/main"/>
<input type="hidden" id="userAvatar" value="{%$tplData.__loginInfo.avatar%}"/>
<input type="hidden" id="userName" value="{%$tplData.__loginInfo.username%}"/>
<input type="hidden" id="userID" value="{%$tplData.__loginInfo.id%}"/>
