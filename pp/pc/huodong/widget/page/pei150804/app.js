var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var app={
    init:function(){
        this.$form=$('.box-form form');
        this.$submitBtn=$('.btn-submit');
        this.$name=$('input[name="name"]');
        this.$phone=$('input[name="phone"]');
        this.$sex=$('input[name="sex"]');
        this.$carModel =$('input[name="carModel"]');
        this.$ask=$('textarea[name="ask"]');
        this.$asknum=$('.txt-num');
        this.maxAskNum=200;
        this.setFormObj();
        this.bindEvent();
    },
    setFormObj:function() {
        this.formObj = [
            {
                $el: this.$name,
                nullTipTxt: '姓名不能为空'
            },
            {
                $el: this.$phone,
                nullTipTxt: '手机号不能为空',
                testReg: /^1[3-8]{1}[0-9]{9}$/,
                testFailTxt: '请输入正确的手机号',
                asyncFun:this.testPhoneAsync
            },
            {
                $el: this.$carModel,
                nullTipTxt: '请填写意向车型'
            },
            {
                $el: this.$ask,
                nullTipTxt: '请填写购车要求'
            }
        ];
    },
    testPhoneAsync:function (val, callback) {
        var dtd=this;
        $.ajax({
           url:'/?c=special&a=checkPhone',
            type:'post',
            dataType:'json',
            data:{
                phone:val,
                classNo:1

            }
        }).then(function(data){
            if(data.status=='error'){
                alert(data.msg);
                dtd.reject();
                return dtd;
            }
            callback && callback.call(dtd,dtd);
        });
       return dtd;
    },
    getDtd:function(){
      return $.Deferred();
    },
    bindEvent:function(){
        var that=this;
        this.$phone.blur(this.phoneBlur.bind(this));
        this.$submitBtn.click(this.submit.bind(this));
        this.$ask.keyup(this.askChange.bind(this,this.$ask));
        this.$ask.change(this.askChange.bind(this,this.$ask));
    },
    phoneBlur:function(){
      // this.validate.call(this.getDtd(),this.formObj[1]);
    },
    askChange:function($el){
        var val=$el.val()||'';
        val=val.slice(0,this.maxAskNum);
        $el.val(val);
        this.$asknum.html(val.length+'/'+this.maxAskNum);
    },
    validate:function(){
        var dtd=this;
        if(!arguments.length){
           dtd.resolve();
            return dtd;
        };
        var args=arguments;
        var callee=arguments.callee;
        var slice=Array.prototype.slice;
        var obj=args[0];
        var $el=obj.$el;
        var val=$el.val()||'';
        val= $.trim(val);
        $el.val(val);
        if(!val){
            alert(obj.nullTipTxt);
            dtd.reject();
            return dtd;
        }
        if(obj.testReg&&!obj.testReg.test(val)){
            alert(obj.testFailTxt);
            dtd.reject();
            return dtd
        }
        if(obj.asyncFun){
           return obj.asyncFun.call(dtd,val,function(dtd){
                return callee.apply(dtd,slice.call(args,1))
          })
        }
        return callee.apply(dtd,slice.call(args,1));
    },
    validateAll:function(dtd){
        dtd=dtd||this.getDtd();
        return this.validate.apply(dtd,this.formObj);
    },
    ajaxSubmit:function(dtd){
        var that=this;
        var dataStr=this.$form.serialize();
        $.ajax({
            url:'/?c=special&a=special0807',
            type:'post',
            data:dataStr,
            dataType:'json'
        }).then(function(data){
            if(data.status=='error'){
                alert(data.msg);
                dtd.reject();
                return dtd;
            }
            alert('提交成功');
            that.$form.find('input,textarea').attr('disabled','disabled');
            that.$form.addClass('disabled');
            location.reload();
        });
        return dtd;
    },
    submit:function(){
        var that=this;
        if(that.$form.hasClass('disabled'))return;
        this.validateAll().then(this.ajaxSubmit.bind(this));
    }
};
return app;
