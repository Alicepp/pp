var log=require('common:widget/ui/base/log.js');

var payment={
    init:function(){
        this.bindEvent();
    },
    bindEvent:function(){
        var that=this;
        $(".sub-btn").on('click',function(){
            if(that.isAjaxing)return;
            that.isAjaxing=true;
            $.ajax({
                url:window.URL.home+'?c=common/order&a=checkOrder',
                async:false,
                data:{
                    orderId:emao.orderId
                }
            }).then(that.checkCanPay.bind(that));
        });
        $('.pay-way').on('click',function(){
        	$(this).find('span').addClass('checked');
        	$(this).siblings().find('span').removeClass();
        	if($(this).hasClass('yl-tag')){
        		$('#bankList').removeClass('hide');
        		$('#chooseWay').addClass('hide');
        		$('.order-tt').html('选择银行');
        		$('.order-sub').addClass('hide');
        	}else{
        		var dataName = $(this).attr('data-name');
        		$('#unionCard').val(dataName);
        	}
        });
        $('.bank-list-wrap li').click(function(){
        	var dataName = $(this).attr('data-name');
        	$('#bankList').addClass('hide');
        	$('#chooseWay').removeClass('hide');
        	$('#unionCard').val(dataName);
        	$('.order-tt').html('订单支付');
        	$('.order-sub').removeClass('hide');
        });
        $('.choose-way li').each(function(i){
        	$('.choose-way li').eq(i).click(function(){
        		$(this).addClass('cur').siblings().removeClass('cur');
 				$('.bank-list-wrap').eq(i).removeClass('hide').siblings().addClass('hide');
        	});
        });
    },
    onSubmit: function(){
        //log.ga3();
    	document.getElementById('goPay').submit();
    },
    checkCanPay:function(data){
        this.isAjaxing=false;
        if(data&&data.code==2){
            location.href=window.URL.home+'?c=common/order&a=cancelOrder&orderId='+emao.orderId;
        }else if(data&&data.code==3){
            location.href=window.URL.home+'/pay/xianshitemai/step-3/'+emao.orderId+'/';
        }else{
            this.onSubmit();
        }
    }

};
return payment;
