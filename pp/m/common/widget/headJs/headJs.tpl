
<script>
    window.emao=window.emao||{
        imgHost:"{%$tplData.__imgDom%}",
        tpl:"{%$tplData.goods.__lastCategory.tpl%}",
        loginUrl:'http://i.emao.com/?act=login&callbackUrl='+encodeURIComponent(location.href),
        carInfo:{%$carInfo|json_encode|escape:none%},
        points:{%$points|json_encode|escape:none%},
        defaultPoint:{%$point|json_encode|escape:none%},
        defaultDeposit:{%$deposit|json_encode|escape:none%},
        defaultColor:{%$color|json_encode|escape:none%},
        colors:{%$colors|json_encode|escape:none%},
        deposit:{%$tplData.autoDeposit|json_encode|escape:none%},
        goodsAuto:{%$tplData.goodsAuto|json_encode|escape:none%},
        brand:{%$brand|json_encode|escape:none%},
        orderId:"{%$tplData.orderId%}",
        goodsId:"{%$tplData.goodsId%}",
        consumerId:"{%$tplData.consumerId%}",
        matrix: {%$tplData.parts.matrix|json_encode|escape:none%},
        matrixKey:"{%$matrixKey%}",
        searchParam:{%$tplData.searchParam|json_encode|escape:none%},
        FDATA:{%$FDATA|json_encode|escape:none%},
        mall_cityId:"{%$tplData.curCity['cityId']%}"

    };
    window.emao.groupIds=[];
    {%foreach $tplData.parts.group as $i=>$item%}
    window.emao.groupIds.push('{%$i%}');
    window.emao['parts-{%$i%}']={%(array_values($item.parts))|json_encode|escape:none%};
    {%/foreach%}

    window.city=window.city||{
        cityId:"{%$tplData.curCity.cityId%}",
        pinyin:"{%$tplData.curCity.pinyin%}"
    };
    window.URL={%$url|json_encode|escape:none%};
</script>
