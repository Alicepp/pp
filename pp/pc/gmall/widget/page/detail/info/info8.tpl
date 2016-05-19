{%extends file="gmall/widget/page/detail/info/info.tpl"%}
{%block name="info_top"%}
{%/block%}
{%block name="info_activity"%}
    <div class="dl-box see-car-list ">
        {%foreach $carInfo.__groupGood.__series as $item%}
        <div class="see-car">

            <div class="see-car-sort">
                <div class="see-brand-name">
                    {%$item.subBrandName%}
                </div>
                {%foreach $item.series as $series%}
                <div class="serie-list">
                    {%$series.serieName%}
                </div>
                {%/foreach%}
            </div>
        </div>
        {%/foreach%}
    </div>
{%/block%}
{%block name="info_gift"%}
<div class="dl-box">
    {%if count($tplData.giftlist)>0%}
    <dl class="dl-gift" style="display:block;" >
        <dt>礼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品 :</dt>
        <dd>
            {%foreach $tplData.giftlist as $item%}
            <div class="gift">
                <span class="gift-desc">{%$item.name%}
                {%if $item@first&&$carInfo.__groupGood.giftDesc%}
                <a class="gift-info" href="javascript:void(0)">
                    说明
                    <span class="gift-info-box">
                        <span class="info-box">
                            <span class="gift-info-tit">礼品说明</span>
                             {%$carInfo.__groupGood.giftDesc%}
                        </span>
                    </span>
                </a>
                {%/if%}
                </span>
            </div>

            {%/foreach%}
        </dd>
    </dl>
    {%/if%}
    <dl class="dl-time">
        <dt>活动时间 :</dt>
        <dd>
            {%$carInfo.__groupGood.tuanHuodongtime|date_format:'%Y-%m-%d'%}
        </dd>
    </dl>
    <dl class="dl-address margin-bot5">
        <dt>活动地点 :</dt>
        <dd >
            <select name="provinceId" id="provinceId" value="{%$point.provinceId%}">
                {%foreach $points.province as $i=>$province%}
                <option value="{%$province['ProvinceId']%}" {%if $province['ProvinceId']==$point.provinceId%}selected="selected"{%/if%}>
                {%$province['ProvinceName']%}
                </option>
                {%/foreach%}
            </select>
            <select name="cityId" id="cityId" value="{%$point.cityId%}">
                {%foreach $points.city[$point.provinceId] as $i=>$city%}
                <option value="{%$city['cityId']%}" {%if $city['cityId']==$point.cityId%}selected="selected"{%/if%}>
                {%$city['cityName']%}
                </option>
                {%/foreach%}
            </select>
        </dd>
        <dd class="shop-address padding-top" style="{%if $carInfo.__groupGood.isShowSite==2%}display:none;{%/if%}">
            <select name="pId" id="dealerid" value="{%$point.dealerid%}">
                {%foreach $points.dealer[$point.cityId] as $i=>$dealer%}
                <option value="{%$dealer['dealerid']%}" {%if $dealer['dealerid']==$point.dealerid%}selected="selected"{%/if%}>
                {%$dealer['name']%}
                </option>
                {%/foreach%}
            </select>
            <span class="showMap"><i></i>查看地图</span>
        </dd>
    </dl>
</div>
{%/block%}
{%block name="info_group"%}
<div class="dl-box">
    {%if $carInfo.__groupGood.content%}
        <dl class="groupfor">
            <dt>活动说明：</dt><dd><span>{%$carInfo.__groupGood.content%}</span></dd>
        </dl>
    {%/if%}
{%$precent=($carInfo.__groupGood.minGroupnum/$carInfo.__groupGood.maxGroupnum*100)%}
    <dl class="dl-activeNum">
    <dt class="c-dt">活动人数：</dt>
        {%if $carInfo.__groupGood.maxGroupnum%}
            {%if $carInfo.__groupGood.groupNum<$carInfo.__groupGood.maxGroupnum%}
            <dd class="act-num">
                <div class="progress-box progress-box-top">
                    {%if $carInfo.__groupGood.groupNum<$carInfo.__groupGood.maxGroupnum%}
                    <div class="tuan-over">
                        已报<em>{%$carInfo.__groupGood.groupNum%}</em>人<br/>
                        <i><img src="/static/lib/img/public/xsj2.png"></i>
                    </div>
                    {%/if%}
                    <div class="progress-hui">
                        <div class="progress-bar" style="width:0;"></div>
                        <div class="line2" style="left:{%$precent%}%"></div>

                    </div>
                    {%if $carInfo.__groupGood.minGroupnum>0%}
                    <div class="tuan-complete" style="left:{%$precent%}%">
                        <div class="persons">{%$carInfo.__groupGood.minGroupnum%}人成功</div>
                        <div class="sucess">
                            活动成功
                        </div>
                    </div>
                    {%/if%}
                    <div class="tuan-count">
                        共{%$carInfo.__groupGood.maxGroupnum%}人
                    </div>
                </div>
            </dd>
            {%else%}
                <dd >
                    已到上限<span class="font-red">{%$carInfo.__groupGood.maxGroupnum%}</span>人
                </dd>
            {%/if%}
        {%else%}
        <dd >
            <span class="font-red">{%$carInfo.__groupGood.groupNum%}</span>
            人参加
            {%if ($carInfo.__groupGood.minGroupnum>0)&&($carInfo.__groupGood.groupNum<$carInfo.__groupGood.minGroupnum)%}
            <span class="font-hui">（最低人数：{%$carInfo.__groupGood.minGroupnum%}人）</span>
            {%/if%}
        </dd>
        {%/if%}
</dl>
</div>
{%/block%}
{%block name="info_enprice"%}
    <div class="en-price">
    {%if $carInfo.__groupGood.entryPrice>0%}
    报名费{%$carInfo.__groupGood.entryPrice%}元
    {%else%}
    免费报名
    {%/if%}
    </div>
{%/block%}
{%block name="info_btns"%}
{%/block%}

