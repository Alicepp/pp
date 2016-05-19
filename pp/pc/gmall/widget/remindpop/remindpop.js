var Pop=require('common:widget/pop/pop.js');
var sendingCls='sending',countdownCls='countdown';
var payment={
    init:function(){
    	this.pop=new Pop({width:560,height:400});
        this.$el=this.pop.$el;
        this.renderDom();
        this.$tel=this.$el.find('.input-tel');
        this.$yzm=this.$el.find('.input-captcha');
        this.$ctbtn=this.$el.find('.send-captcha');
        this.$submitBtn=this.$el.find('.btn-submit');
        this.bindEvent();
        this.inited=true;
    },
    bindEvent:function(){
        var that=this;
        this.$ctbtn.click(function(){
            var $btn=$(this);
            if($btn.hasClass(sendingCls)||$btn.hasClass(countdownCls)){
                return;
            }
            var text_mobile = that.$tel.val();
            if( text_mobile == "" ){
                $btn.tip("手机号不能为空！");
                return false;
            }
            var reg=/^1\d{10}$/;
            if (!reg.test(text_mobile)) {
                $btn.tip("手机号错误,请重新输入！");
                return;
            }
            $btn.addClass(sendingCls);
            $.ajax({
                url:window.URL.home+'?c=common/sms&a=sendMobile',
                type:'get',
                dataType:'json',
                data:{"tel":text_mobile}
            }).then(function(data){
                var json = data;
                if(typeof json === 'string'){
                    try{
                        json = $.parseJSON(json);
                    }catch(e){
                        //return;
                    }
                }
                $btn.removeClass(sendingCls);
            },function(){
                $btn.removeClass(sendingCls);
            });
            that.countdown(60);
        });
        this.$submitBtn.click(function(){
            var text_mobile = that.$tel.val();
            var $btn=$(this);
            if( text_mobile == "" ){
                $btn.tip("手机号不能为空！");
                return false;
            }
            var reg=/^1\d{10}$/;
            if (!reg.test(text_mobile)) {
                $btn.tip("手机号错误,请重新输入！");
                return;
            }
            var yzm=that.$yzm.val();
            if( yzm == "" ){
                $btn.tip("验证码不能为空！");
                return false;
            }
            $.ajax({
                url:window.URL.home+'?c=common/sms&a=jyzm',
                type:'post',
                dataType:'json',
                data:{"tel":text_mobile,
                    "yzm":yzm,
                    'goodsId':emao.carInfo.id,
                    'state':0
                }
            }).then(function(data){
                var json = data;
                if(typeof json === 'string'){
                    try{
                        json = $.parseJSON(json);
                    }catch(e){
                        $btn.tip('验证码校验失败');
                        return;
                    }
                }
                if(json.data==0){
                    that.callbackFn&&that.callbackFn(json);
                    that.hide();
                }else{
                    $btn.tip('验证码校验失败');
                }


            });
        })

    },
    countdown:function(time){
        var that=this;
        var ctbtn=this.$ctbtn;
        time=time-0;
        if(time<=0){
            clearTimeout(this.countdownTimer);
            ctbtn.text('获取验证码').removeClass(countdownCls);
            return;
        }
        ctbtn.text(time+'s后可重新发送').addClass(countdownCls);
        var callee=arguments.callee;
        this.countdownTimer=setTimeout(function(){
            callee.call(that,--time);
        },1000)

    },
	renderDom:function(){
		var html = ['<div class="remind-hd"></div>',
			   	   '<div class="remind-bd">',
                        '<div class="tit">开售短信提醒</div>' ,
                        '<p>当本车型开卖时，我们会通过短信通知您。 </p>' ,
                        '<div class="line-item">',
                            '<span class="line-left">手机号：</span>' ,
                            '<span class="line-right">',
                                '<input type="tel" class="input-tel" />',
                            '</span>',
                        '</div>',
                        '<div class="line-item line-captcha">',
                            '<span class="line-left">验证码：</span>' ,
                            '<span class="line-right">',
                                '<input type="tel" class="input-captcha"/>',
                                '<label class="send-captcha" countdown-time="120">获取验证码</label>',
                            '</span>',
                        '</div>',
                        '<div class="line-item line-submit ">',
                            '<a class="btn-confirm btn-submit" href="javascript:void(0)">确认</a>',
                        '</div>',
			   		'</div>'].join('');
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
