<a class="pro-img center" href="{%$url.home%}car/{%$item.gid%}.html">
<img src="{%$item.img%}" alt=""/>
</a>
<div class="pro-name">{%$carTit|default:$item.car%}</div>
<div class="car-desc">{%$item.sellLead%}</div>
<div class="detail-dl box">
    <div class="dt">巨惠价：</div>
    <div class="flex1"><em>{%($item.eprice-$item.group.__discount)|format_price%}</em></div>

</div>
<div class="car-dikou dikou-del">厂商指导价：{%$item.price%}万</div>
<div class="car-posbox zhengche">
    巨惠购
</div>