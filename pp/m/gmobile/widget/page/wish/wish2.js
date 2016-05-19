var base=require('common:widget/ui/base/base.js');
var app=require('./app.js');
var baseView=require('./view.js');
var utils=base.utils;

var disableCls='disableCls';
var sendingCls='sending',countdownCls='countdown';
var View=base.Class(function(){
    this.pageCls='page-wish2';
    baseView.apply(this, arguments);
},baseView).extend({
    init:function(){
        this.model=app.model;
        this.$serieBox=this.$el.find('.serie-box');
        this.$select=this.$el.find('.li-select select');
        this.$province=this.$el.find('.li-province select');
        this.$city=this.$el.find('.li-city select');
        this.$tel=this.$el.find('.input-tel');
        this.$yzm=this.$el.find('.input-code');
        this.$ctbtn=this.$el.find('.send-captcha');
        this.$submitBtn=this.$el.find('.btn-submit');
        this.hide();
        this.bindEvent();
    },
    bindEvent:function(){
        var that=this;
        app.addEventListener('list.change',this.updataList,this);
        this.$select.change(function(){
            var $box=$(this).parents('.li-select');
            $box.find('.txt').html($(this).find('option:selected').html());
        });
        this.$province.change(this.updataCity.bind(this));
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
                url:window.URL.home+'?c=index&a=ajaxCode',
                type:'get',
                dataType:'json',
                data:{"phone":text_mobile}
            }).then(function(data){
                $btn.removeClass(sendingCls);
                var json = data;
                if(typeof json === 'string'){
                    try{
                        json = $.parseJSON(json);
                    }catch(e){
                        return;
                    }
                }
                if(json.code==0){
                    that.countdown(60);
                }else{
                    $.alert(json.msg);
                }

            },function(){
                $btn.removeClass(sendingCls);
                $.alert("网络错误，未发送成功");
            });
        });
        this.$submitBtn.click(function(){
            var desire=$('select[name="desire"]').val();
            var desireTXT=$('select[name="desire"]').find("option:selected").text();
            var province=$('select[name="province"]').val();
            var city=$('select[name="city"]').val();
            var phone=$('input[name="phone"]').val();
            var code=$('input[name="code"]').val();
            if( phone == "" ){
                $.alert("手机号不能为空！");
                return false;
            }
            var reg=/^1\d{10}$/;
            if (!reg.test(phone)) {
                $.alert("手机号错误,请重新输入！");
                return;
            }
            var yzm=that.$yzm.val();
            if( yzm == "" ){
                $.alert("验证码不能为空！");
                return false;
            }
            var list=that.model.getList();
            var model=[];
            for(var i=0;i<list.length;i++){
                model.push([list[i].subBrandId,list[i].serieId,list[i].id]);
            }
            $.ajax({
                url:window.URL.home+'?c=dealerwish&a=add',
                type:'post',
                dataType:'json',
                data:{
                    model:model,
                    proid:province,
                    cityid:city,
                    phone:phone,
                    code:code,
                    time:desireTXT

                }
            }).then(function(ms){
                if(ms>0){
                    ga('send', 'event', 'purchase_wish', 'submit_wish',phone);
                    window.location.href=window.URL.home+"?c=dealerwish&a=success";
                }else{
                    $.alert('验证码错误');
                }

                /*
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
                if(json.code==0){
                    window.location.href=window.URL.home+"?c=index&a=desireSuccess"
                }else{
                    $.alert(json.msg);
                }*/
            });

        });


    },
    updataCity:function(){
        var that=this;
        var id=this.$province.val();
        this.$city.empty();
        this.model.getCity(id,function(data){
            var len=data.length,
                htmlStr='';
            for(var i=0; i<len; i++){
                htmlStr+='<option value="'+data[i].cityid+'">'+data[i].cityname+'</option>';
            }
            that.$city.html(htmlStr);
            if(data.length){
                that.$el.find('.li-city .txt').html(data[0].cityname);
            }
        });
    },
    updataList:function(e){
        e=e||{};
        var list= e.list||this.model.getList();
        var arr=[];
        for(var i=0;i<list.length;i++){
            var brand=this.model.brand.getData(list[i].brandId);
            var series=brand.serie.getData(list[i].serieId);
            arr.push(brand.brandName+'-'+series.serieName+'-'+list[i].year+'款 '+list[i].autoName);
            //arr.push(brand.brandName+'-'+list[i].autoName);
        }
        this.$serieBox.html(arr.join('，<br/>'))
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