{%foreach $item.replyInfo.list as $reItem%}
<div class="dis-item">
    <div class="box">
        <div class="header"><img src="{%$reItem.user.avatar%}" alt=""/></div>
        <div class="dis-info flex1">
            <a class="dis-name" href="{%$reItem.user.url%}">{%$reItem.user.nickname%}</a> 回复 <a class="dis-name" href="{%$item.user.url%}">{%$item.user.nickname%}</a>
            <p class="comment-con">{%$reItem.content%}</p>
        </div>
    </div>
</div>
{%/foreach%}
{%if $item.replyInfo.pageList%}
<div class="page-box clearfix reply-pag">
    {%$item.replyInfo.pageList|escape:none%}
</div>
{%/if%}