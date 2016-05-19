{%$featureEnum=[
    '1'=>'审批快',
    '2'=>'极速放款',
    '3'=>'资料简便',
    '4'=>'首付低',
    '5'=>'月供低',
    '6'=>'利率低',
    '7'=>'车到放款',
    '8'=>'0首付',
    '9'=>'0月供',
    '10'=>'0利率',
    '11'=>'可延期'
]%}
<div class="bank-item" bankId="{%$item.bankId%}">
    <div class="bank-item-left center">
        <span class="bank-item-logo " title="查看支持城市及说明"
              {%if $item.advantage||$item.people||$item.disclaimer%}
              toPageCls="page-bankInfo-{%$item.bankId%}"
              {%/if%}
              bankId="{%$item.bankId%}">
            <img src="http://img.emao.net/{%$item.logo%}" alt=""/>
        </span><br/>
        <span class="bank-item-showName ">{%$item.showName%}</span><br/>
        <span class="bank-item-planName ">{%$item.planName%}</span><br/>
        {%if $item.bankUrl%}
        <span class="bank-item-link">
            <a class="credits" href="{%$item.bankUrl%}" target="_blank">查看信用额度</a>
        </span>
        {%/if%}
    </div>
    <div class="bank-item-right flex1 center-v">
        {%if $item.discount%}
        <span class="bank-item-line">
        <span class="bank-item-discount">{%$item.discount%}</span>
        </span><br/>
        {%/if%}
        <span class="bank-item-line">
            <span class="bank-item-tag">
                    {%foreach $item.feature as $fea%}
                    <span class="tag-item tag{%$fea%}" style="{%if $fea@last %}margin-right: 0;{%/if%}">
                        {%$featureEnum[$fea]%}
                    </span>
                    {%/foreach%}
            </span>
        </span><br/>
        <span class="bank-item-line">
            <span class="speed line-lf">
                <span>放款速度</span><span class="star">
                    <span class="star-red" style="width:{%$item.serviceRelease*10%}%"></span>
                </span>
            </span>
        </span><br/>
        {%if $item.maxLoan>0||$item.maxTerm>0%}
        <span class="bank-item-line box">
            {%if $item.maxLoan>0%}
            <span class="tall-price line-lf">最高额度{%$item.maxLoan|string_format:"%.2f"%}万</span>
            {%/if%}
            {%if $item.maxTerm>0%}
            <span class="tall-Enum line-rt">最长期限{%$item.maxTerm|string_format:"%.0f"%}期</span>
            {%/if%}
        </span><br/>
        {%/if%}
        <span class="bank-item-line bank-line-last">
            <span class="que-apply line-lf">已有<em>{%$item.displayNum%}</em>人成功申请</span>
        </span><br/>
        {%if $isDetail!=1%}
        <div class="bank-item-toRight" toPageCls="page-detail-{%$item.bankId%}" bankId="{%$item.bankId%}"></div>
        {%/if%}
    </div>
    {%if $item.isHot==1%}
    <div class="bank-item-emaotag">
        <span>
          一猫专属
        </span>
    </div>
    {%/if%}
</div>
