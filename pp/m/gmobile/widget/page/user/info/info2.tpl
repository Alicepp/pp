<a class="pro-img center" href="{%$url.home%}car/{%$item.gid%}.html">
    <img src="{%$item.img%}" alt=""/>
</a>
<div class="pro-name">{%$carTit|default:$item.car%}</div>
<div class="car-desc">{%$item.sellLead%}</div>
<div class="detail-dl detail-dl-pad box">
<div class="dt">抵扣券：</div>
<div class="flex1"><em>{%$item.sellPrice%}元</em></div>
</div>
<div class="detail-dl detail-dl-pad box">
<div class="dt">{%if $list.bargainType==1%}到店议价后再抵：{%else%}到店抵：{%/if%}</div>
<div class="flex1">{%$item.faceValue|format_price%}现金</div>
</div>
<div class="car-posbox car-quan">
    抵扣券
</div>
