var log={
    ga1:function(id){//立即抢购
        _hmt.push(['_trackEvent', 'gmallwap', 'g_submit', id||emao.carInfo.autoGid]);
        ga&&ga('send', 'event', 'gmall_wap', 'submit', id||emao.carInfo.autoGid);
    },
    ga2:function(id){//提交订单
        _hmt.push(['_trackEvent', 'gmallwap', 'g_submit_success', id||$('#goodsId').val()]);
        ga&&ga('send', 'event', 'gmall_wap', 'submit_success', id||$('#goodsId').val());
    },
    ga3:function(id){//去付款
        _hmt.push(['_trackEvent', 'gmallwap', 'pay', id||emao.orderId]);
        ga('send', 'event', 'gmall_wap', 'pay' ,id||emao.orderId);
    },
    ga4:function(id){//付款成功
        _hmt.push(['_trackEvent', 'gmallwap', 'pay_success', id||emao.orderId]);
        ga('send', 'event', 'gmall_wap', 'pay_success' ,id||emao.orderId);

    }
};
return log;