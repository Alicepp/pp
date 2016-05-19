var base=require('common:widget/ui/base/base.js');
var app=require('../app.js');
var baseView=require('../view.js');
var sendingCls='sending',countdownCls='countdown';
var View=base.Class(function(){
    baseView.apply(this, arguments);
},baseView).extend({
    init:function(){
        this.$tel=this.$el.find('.input-tel');
        this.$yzm=this.$el.find('.input-captcha');
        this.$ctbtn=this.$el.find('.send-captcha');
        this.$submitBtn=this.$el.find('.btn-submit');
        this.bindEvent();
        this.inited=true;
    },
    bindEvent:function(){
       // app.addEventListener(this.listKey+'.change',this.updataList,this);
        var that=this;
        this.$ctbtn.click(function(){
            var $btn=$(this);
            if($btn.hasClass(sendingCls)||$btn.hasClass(countdownCls)){
                return;
            }
            var text_mobile = that.$tel.val();
            if( text_mobile == "" ){
                $.alert("手机号不能为空！");
                return false;
            }
            var reg=/^1\d{10}$/;
            if (!reg.test(text_mobile)) {
                $.alert("手机号错误,请重新输入！");
                return;
            }
            $btn.addClass(sendingCls);
            $.ajax({
                url:window.URL.home+'?c=sms&a=sendMobile',
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
            if( text_mobile == "" ){
                $.alert("手机号不能为空！");
                return false;
            }
            var reg=/^1\d{10}$/;
            if (!reg.test(text_mobile)) {
                $.alert("手机号错误,请重新输入！");
                return;
            }
            var yzm=that.$yzm.val();
            if( yzm == "" ){
                $.alert("验证码不能为空！");
                return false;
            }
            $.ajax({
                url:window.URL.home+'?c=sms&a=jyzm',
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
                        $.alert('验证码校验失败');
                        return;
                    }
                }
                console.log(json);
                if(json.data==0){
                    that.callbackFn&&that.callbackFn(json);
                    that.toMainPage();
                }else{
                    $.alert('验证码校验失败');
                }
            });
        })

    },
    callbackFn:function(json){
        if (json.data == 0) {
            this.dispatchEvent('change.remined',{'remined':1})
        };
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

    }


});
return View;