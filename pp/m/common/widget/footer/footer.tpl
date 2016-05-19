<footer class="page-footer">
    {%if $hasDownBar%}
        <ul class="down-bar box">
            <li class="flex1">
                <a class="borderbox" href="{%$url.home%}entering/">
                    特价车源
                </a>
            </li>
            <li class="flex1">
                <a class="borderbox" href="{%$url.home%}entering/">
                    支付无忧
                </a>
            </li>
            <li class="flex1">
                <a class="borderbox" href="{%$url.home%}entering/">
                    提车保证
                </a>
            </li>
            <li class="flex1">
                <a class="borderbox" href="{%$url.home%}entering/">
                    售后服务
                </a>
            </li>
        </ul>
    {%/if%}

<div class="footer-bar center-v">
    <div class="footer-btns flex1" >
        <a class="btn-li btn-moblie selected" href="{%$url.home%}">
            手机版
        </a>
        <em>|</em>
        <a class="btn-li btn-pc" href="{%$pcUrl|default:$url.pcHome%}">
            电脑版
        </a>
    </div>
    <div class="footer-tel">
        <strong>400-890-3881</strong>
        <p>周一至周六9:00-19:00</p>
    </div>
</div>

</footer>
{%script%}
require.async('./footer.js', function(footer){
        footer.init();
});
{%/script%}