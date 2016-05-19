var endDown=require('common:widget/ui/plugin/countdown.js');
var Pop=require('common:widget/pop/pop.js');
var app={
    init:function(){
        this.$pages=$('.page-pg');
        this.$section=$('.page-pg>section');
        this.curIndex=0;
        this.top=0;
        this.maxIndex=this.$section.length-1;
        this.minTop=-this.maxIndex*this.height;
        this.setHeight();
        this.bindEvent();
    },
    showformPop:function(callback){
        var tpl=['<div class="pop formpop">',
            '<div class="pop-box">',
            '<div class="pop-cont borderbox">',
            '<div class="pop-tit">填写购车人信息</div>',
            '<ul>',
            '<li class="center-v"><label>姓名：</label><input name="name"/></li>',
            '<li class="center-v"><label>手机：</label><input name="phone"/></li>',
            '<li class="center-v"><label>城市：</label><input name="city"/></li>',
            '</ul>',
            '</div>',
            '<div class="pop-btns box">',
            '<div class="pop-btn queding noRemove flex1" status="1" onclick="ga(\'send\',\'event\',\'dfbz_dzx_wap\',\'submit_success\');">确定</div>',
            '</div>',
            '</div>',
            '</div>'].join('');
       this.formPop=new Pop({msg:'',tpl:tpl,callback:callback,needPopClose:true});
        return this.formPop;
    },
    popSuccess:function(num,callback){
        var tpl=['<div class="pop sucpop">',
            '<div class="pop-box">',
            '<div class="pop-cont borderbox">',
            '<div class="pop-tit">领取成功</div>',
            '<div class="suc-cont center">',
            '<span class="suc-num">劵号：',num,'</span><br/>',
            '<a class="suc-btn" href="',URL.home,'" onclick="ga(\'send\',\'event\',\'dfbz_dzx_wap\',\'goto\');" target="_blank">券到手~快去商城里嘚瑟一下吧</a>',
            '</div>',
            '</div>',
            '</div>',
            '</div>'].join('');
        this.successPop=new Pop({msg:'',tpl:tpl,callback:callback,needPopClose:true});
        return this.formPop;

    },
    setHeight:function(height){
        this.height=height||$(window).height();
        this.minTop=-this.maxIndex*this.height;
        this.updataHeight();

    },
    updataHeight:function(){
        var that=this;
        this.$section.height(this.height);

    },
    updataTop:function(top,needAnimate){
        if(this.isUndefinded(top)){
            return;
        }
        if(top<this.minTop||top>0)return;
        this.top=top;
        needAnimate?this.$pages.animate({'top':this.top},300):this.$pages.css('top',this.top);
        //this.$pages.css({'-webkit-transform': 'translate3d(0px, -'+index*this.height+'px, 0px)'});
    },
    resizeHandler:function(){
        this.setHeight();
    },
    switchTo:function(index){
        if(index<0||index>this.maxIndex)return;
        this.updataTop(-index*this.height,true);
        this.$section.eq(index).addClass('moveIn').siblings().removeClass('moveIn');
        this.curIndex=index;
    },
    formBtnHandler:function(status,successPop){
        var that=this;
        if(!successPop)return;
            var name=$('input[name="name"]').val();
            var phone=$('input[name="phone"]').val();
            var city=$('input[name="city"]').val();
            var reg=/^1[3-8]{1}[0-9]{9}$/;
            if(name==""){
                $.alert("姓名不能为空！");
            }else if(phone=="") {
                $.alert('手机号不能为空！');
            }else if(!reg.test(phone)){
                $.alert('请输入正确的手机号！')
            }else if(city==""){
                $.alert('城市不能为空！');
            }else{
            var datas={
                name:name,
                phone:phone,
                city:city,
                type:that.price
            }
            $.ajax({
                type:"post",
                url:"/?c=special&a=ding150908",
                data:datas,
                dataType:"json",
                success:function(data){
                    if(data.status=='success'){
                        successPop.remove();
                        that.popSuccess(data.coupon);
                    }else{
                        successPop.remove();
                        $.alert(data.msg);

                    }
                }
            })
        }
    },
    isUndefinded:function(obj){
        return (typeof obj)==='undefined';
    },
    bindEvent:function(){
        var that=this;
        $(window).resize(this.resizeHandler.bind(this));
        this.$pages.swipeUp(function(){
            //that.switchTo(that.curIndex+1);
        });
        this.$pages.swipeDown(function(){
            //that.switchTo(that.curIndex-1);
        });
        this.$pages.on('touchstart',function(e){
            var touch=e.touches[0];
            if(!touch)return;
            that.startPageY= touch.pageY;

        });
        this.$pages.on('touchmove',function(e){
            if(that.isUndefinded(that.startPageY)){
                return;
            }
            if(that.isUndefinded(that.movePageY)){
                that.movePageY=that.startPageY;
            }
            var touch=e.touches[0];
            if(!touch)return;
            that.touchY=touch.pageY- that.movePageY;
            that.movePageY=touch.pageY;
            that.updataTop(that.top+that.touchY);
            return false;
        });
        this.$pages.on('touchend',function(e){
            if(that.isUndefinded(that.startPageY)||that.isUndefinded(that.movePageY))return;
            var index=that.touchY<0?that.curIndex+1:that.curIndex-1;
            if(Math.abs(that.movePageY-that.startPageY)<10){
                index=that.curIndex;
            };
            that.switchTo(index);
            delete that.movePageY;
            delete that.startPageY;
            delete that.touchY;
            return false;

        });

        $('.bar-btn-1').click(function(){
            that.switchTo(4);
        });
        $('.shoutime').endDown(null,function(d,h,m,s){
            return '<em>'+d+'<i>天</i></em><span>:</span><em>'+h+'<i>时</i></em><span>:</span><em>'+m+'<i>分</i></em><span>:</span><em>'+s+'<i>秒</i></em>';
        });
        $('.quan-click').click(function(){
            that.price=$(this).attr('price');
            that.showformPop(that.formBtnHandler.bind(that));

        });
    }
};
return app;
