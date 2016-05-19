<div class="install-fuceng">
    <div class="install-mask"></div>
    <div class="install-support clearfix">
        <a href="javascript:;" class="install-close"></a>
        <div class="install-fcyin clearfix">
            <div class="install-m-ico">
                <div class="install-m-ipic"><img src="http://img.emao.net/{%$item.logo%}"></div>
                <div class="install-m-work">
                    {%$item.shortInfo%}
                </div>
            </div>
            <div class="install-jianjie">
                <div class="install-jjone">
                    <h6><span>金融公司优势</span></h6>
                    <p>{%$item.advantage%}</p>
                </div>
                {%if $item.people%}
                <div class="install-jjone">
                    <h6><span>适合人群</span></h6>
                    <p>{%$item.people%}</p>
                </div>
                {%/if%}
                <div class="install-jjone last-noborder">
                    <h6><span>{%$item['fullName']%}支持以下城市进行金融购车</span></h6>
                    <select class="install-zhichi">
                        {%foreach $item['province'] as $k=>$list%}
                        <option value="{%$list.provinceId%}">{%$list.provinceName%}</option>
                        {%/foreach%}
                    </select>
                    <div class="install-cheng clearfix">

                    </div>
                </div>
            </div>
            <div class="install-shengming clearfix">
                <div class="install-jjone last-noborder">
                    {%if $item.disclaimer%}
                    <h6><span>免责声明</span></h6>
                    <p>{%$item.disclaimer%}</p>
                    {%/if%}
                </div>
            </div>
        </div>

    </div>
</div>