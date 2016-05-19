<dt class="center-v pad">{%$addressTxt%}</dt>
<dd class="flex1 no-bg choose-dealer" >
    <div class="dd-hang ">
        <select name="provinceId" id="provinceId" value="{%$point.provinceId%}">
            {%foreach $points.province as $i=>$province%}
            <option value="{%$province['ProvinceId']%}" {%if $province['ProvinceId']==$point.provinceId%}selected="selected"{%/if%}>
            {%$province['ProvinceName']%}
            </option>
            {%/foreach%}
        </select>
        <select name="cityId" id="cityId" style="width:120px;" value="{%$point.cityId%}">
            {%foreach $points.city[$point.provinceId] as $i=>$city%}
            <option value="{%$city['cityId']%}" {%if $city['cityId']==$point.cityId%}selected="selected"{%/if%}>
            {%$city['cityName']%}
            </option>
            {%/foreach%}
        </select>
    </div>

    <div class="dd-hang borderTp address-icon" data-id="{%$point.dealerid%}" style="{%if $carInfo.__groupGood.isShowSite==2%}display:none;{%/if%}">
        <select name="pId" id="dealerid" value="{%$point.dealerid%}" style="width:171px;">
            {%foreach $points.dealer[$point.cityId] as $i=>$dealer%}
            <option value="{%$dealer['dealerid']%}" {%if $dealer['dealerid']==$point.dealerid%}selected="selected"{%/if%}>
            {%$dealer['name']%}
            </option>
            {%/foreach%}
        </select>
     <!--   <div class="address"></div>-->
        <div class="insert-but" pageCls="page-showMap"></div>
    </div>

</dd>
{%script%}
require.async('./selectDealerView.js',function(View){
var view=new View($('.choose-dealer'));
view.init('points');
});
{%/script%}
