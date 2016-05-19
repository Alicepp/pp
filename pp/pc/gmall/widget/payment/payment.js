var Pop=require('common:widget/pop/pop.js');
var log=require('common:widget/ui/base/log.js');
var payment={
    init:function(url){
        this.url=url||'http://i.emao.com/homecp/shangcheng/order/';
    	this.pop=new Pop();
        this.bindEvent();
        this.renderDom();
        this.inited=true;
    },
    bindEvent:function(){
        var that=this;
        $(".sub-btn").on('click',function(){
            if(that.isAjaxing)return;
            that.isAjaxing=true;
            $.ajax({
                async:false,
                url:window.URL.home+'?c=common/order&a=checkOrder',
                data:{
                    orderId:emao.orderId
                }
            }).then(that.checkCanPay.bind(that));
            return true;
        });

    },
    checkCanPay:function(data){
        this.isAjaxing=false;
        if(data&&data.code==2){
            location.href=window.URL.home+'?c=common/order&a=cancelOrder&orderId='+emao.orderId;
        }else if(data&&data.code==3){
            location.href=window.URL.home+'/pay/xianshitemai/step-3/'+emao.orderId+'/';
        }else{
            this.submit();
        }
    },
    submit:function(){
        //log.ga3();
        this.renderDom();
        this.show();

        $('#goPay').submit();
        return true;
    },
	renderDom:function(){
		var html = '<span class="pop-paytt"></span>' + 
			   	   '<div class="paying-wrap">'+
			   			'<dl class="paying">' +
			   				'<dt></dt>'+
			   				'<dd>'+
			   					'<div class="tt">请您在新打开的页面里完成付款</div>' +
			   					'<p>付款完成前请不要关闭窗口。</p>' +
			   					'<p>完成付款后请根据您的情况点击下面的按钮。</p>' +
			   					'<div class="paying-btn">' +
			   						'<a class="finish" href="'+this.url+'">完成支付</a>' +
			   						'<a class="trouble" href="'+window.URL.home+'faq/zhifuxiane/" target="_blank">付款出现问题</a>'+
			   					'</div>' +
			   				'</dd>' +
			   			'</dl>' +
			   		'</div>';
		this.pop.$box.html(html);
	},
	show:function(){
        if(!this.inited){
            this.init();
        }
        this.pop.show();
    },
    hide:function(){
        if(!this.inited){
            this.init();
        }
        this.pop.hide();
    }
};
return payment;
