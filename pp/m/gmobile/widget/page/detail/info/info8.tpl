{%extends file="gmobile/widget/page/detail/info/info.tpl"%}
{%block name="info_price"%}
{%/block%}
{%block name="tuan_price"%}
{%/block%}
{%block name="see_car"%}
<div class="line-box">
    {%if $carInfo.__groupGood.entryPrice>0%}
    <span class="line-tit">报名费：</span>
    <span class="registery-fee">{%$carInfo.__groupGood.entryPrice%}元</span>
    {%else%}
    <span class="registery-fee">免费报名</span>
    {%/if%}

</div>
{%foreach $carInfo.__groupGood.__series as $item%}
<div class="line-box see-car box">
    <div class="see-brand-name">
        <i><img src="{%$item.brandlogo%}" alt=""/></i>
        {%$item.subBrandName%}
    </div>
    <div class="see-serie-car flex1">
        <div class="serie-list">
            <ul class="serie-ul">
                {%foreach $item.series as $series%}
                <li>
                    <i><img src="{%$series.photo%}/100" alt=""/></i>
                    {%$series.serieName%}
                </li>
                {%/foreach%}
            </ul>
        </div>

    </div>
</div>
{%/foreach%}

{%/block%}
{%block name="info_auto"%}
{%/block%}
{%block name="info_color"%}
{%/block%}
{%block name="info_payType"%}
{%/block%}
{%block name="tuan-explain"%}
<div class="line-box">
<span class="line-tit">活动时间：</span>
<span class="line-txt">{%$carInfo.__groupGood.tuanHuodongtime|date_format:'%Y-%m-%d'%}</span>
</div>
{%if $carInfo.__groupGood.content%}
<div class="line-box tuan-explain">
    <span class="line-tit">活动说明：</span>
    <span class="line-txt">{%$carInfo.__groupGood.content%}</span>
</div>
{%/if%}
{%/block%}
{%block name="info_di"%}
{%$gift=$tplData.autoDeposit[0].giftInfo%}
{%if count($tplData.giftlist)>0%}
<dl class="dl-gift borderBt box" >
    <dt class="center">礼品</dt>
    <dd class="no-bg flex1 center-v">
        {%foreach $tplData.giftlist as $item%}
        <span class="gift"><span class="gift-desc">{%$item.name%}</span></span><br/>
        {%/foreach%}
        {%if $carInfo.__groupGood.giftDesc%}
        <span class="info-box">
            <span class="gift-info-tit">礼品说明</span>
            {%$carInfo.__groupGood.giftDesc%}
        </span>
        {%/if%}
    </dd>
</dl>
{%/if%}
{%/block%}