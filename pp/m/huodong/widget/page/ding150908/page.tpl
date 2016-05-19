<div class="page-pg">
    <section class="wap-1">
    </section>
    <section class="wap-2">
    </section>
    <section class="wap-3">
       <dl>
           <dt> 距离优惠结束还有</dt>
           <dd class="center">
               <div class="btn-bg btn-bg-left flex1"></div>
               <div class="shoutime" nowTime="{%$smarty.now|date_format:'%Y/%m/%d,%H:%M:%S'%}" endTime="2015/10/21 00:00:00">
                   <em>00</em>
                   <span>:</span>
                   <em>00</em>
                   <span>:</span>
                   <em>00</em>
               </div>
               <div class="btn-bg btn-bg-right flex1"></div>


           </dd>
       </dl>
    </section>
    <section class="wap-4"></section>
    <section class="wap-5">
        <div class="wap5-scale">
            <div class="quan200">

                {%if $smarty.now<$startTime%}
                <div class="quan-but bgyel">即将开始</div>
                {%elseif $smarty.now>$endTime%}
                <div class="quan-but timeout" price="200">已结束</div>
                {%elseif !$tplData.todayIsCanDo200%}
                <div class="quan-but timeout">今日已领完</div>
                {%elseif ($nowHour>9)&&($nowHour<17)%}
                <div class="quan-but quan-click bgyel" price="200" onclick="ga('send', 'event', 'dfbz_dzx_wap', 'submit_s');">立即领取</div>
                {%elseif ($nowHour<10)%}
                <div class="quan-but bgyel">即将开始</div>
                {%elseif ($nowHour>16)%}
                <div class="quan-but bgyel">明天再来</div>
                {%/if%}

            </div>
            <div class="quan2000">
                {%if $smarty.now<$startTime%}
                <div class="quan-but bgbai">即将开始</div>
                {%elseif $smarty.now>$endTime%}
                <div class="quan-but timeout" now="{%$smarty.now%}" end="{%$endTime%}">已结束</div>
                {%elseif !$tplData.todayIsCanDo2000%}
                <div class="quan-but timeout">今日已领完</div>
                {%elseif ($nowHour>9)&&($nowHour<17)%}
                <div class="quan-but quan-click bgbai" price="2000" onclick="ga('send', 'event', 'dfbz_dzx_wap', 'submit');">立即领取</div>
                {%elseif ($nowHour<10)%}
                <div class="quan-but bgbai">即将开始</div>
                {%elseif ($nowHour>16)%}
                <div class="quan-but bgbai">明天再来</div>
                {%/if%}

            </div>
        </div>
    </section>
    <section class="wap-6"></section>
    <section class="wap-7">
        <dl>
            <dt>活动规则</dt>
            <dd>
                <ul>
                    <li>
                        <span class="li-left">1：</span>
                        <span class="li-right">
                            此活动期间优惠券可与预热期活动（9月1日-9月15日）活动优惠券叠加使用；
                        </span>
                    </li>
                    <li>
                        <span class="li-left">2：</span>
                        <span class="li-right">
                            同一ID不同面值优惠券最多可各领取一张；
                        </span>
                    </li>
                    <li>
                        <span class="li-left">3：</span>
                        <span class="li-right">
                            此活动优惠券有效使用时间为2015年9月21日至12月31日；
                        </span>
                    </li>
                    <li>
                        <span class="li-left">4：</span>
                        <span class="li-right">
                            此活动优惠券仅可用于购买东风标致2008定制版车型；
                        </span>
                    </li>
                    <li>
                        <span class="li-left">5：</span>
                        <span class="li-right">
                            本活动最终解释权归一猫汽车网所有；
                        </span>
                    </li>
                </ul>

            </dd>
        </dl>


    </section>
</div>
<div class="bt-bar center">
<span class="bar-btn bar-btn-1 flex1">抢劵享优惠</span>
<a href="http://mall.m.emao.com/car/1379.html" class="bar-btn bar-btn-2 flex1"  target="_blank">立即抢购</a>
</div>


{%script%}
    require.async('./app.js',function(app){
        app.init();
    });
{%/script%}
