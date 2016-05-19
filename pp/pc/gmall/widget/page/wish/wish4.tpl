<!--
    @require "wish.less"
-->
<div class="wish-wrap">
    <div class="center wish-bg clearfix">
        <div class="wish-success">
            <dl>
                <dt></dt>
                <dd class="success-lit">您已成功提交购车愿望</dd>
                <dd>
                    <ul class="success-car-list">
                    	{%foreach $tplData.data as $k=>$list%}
                        <li>{%$list.subName%}-{%$list.serieName%}</li>
                        {%/foreach%}
                    </ul>
                    <div class="pad-top20">当您提交的车系开售时，我们将会短信通知您！</div>
                    <a href="{%$url.home%}" class=" btn-back">返回首页</a>
                </dd>
            </dl>
        </div>
    </div>
</div>
