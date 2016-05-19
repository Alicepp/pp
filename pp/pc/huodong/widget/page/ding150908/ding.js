//require('common:static/lib/js/jquery.mousewheel.js');
var endDown=require('common:widget/ui/plugin/countdown.js');
var winHeight=$(window).height();
var winWidth=$(window).width();
var ding={
    init:function(){
        this.updataWinHeight();
        this.maxTop=0;
        this.maxIndex=this.len-1;
        this.curIndex=0;
        this.initView(window.location.hash.replace('#','')-0);
        this.bindEvent();
        this.slideView();
        //this.getCouponList();
        this.step=0;
        this.slideUl=$(".slide-img");
        this.imgWid=$('.slide-con').width();
        this.timer=null;
        this.slideLen=$(".slide-img li").length;
        $('.col3 .col3-time').endDown(null,function(d,h,m,s){
            return '<em>'+d+'<i>天</i></em><span>:</span><em>'+h+'<i>时</i></em><span>:</span><em>'+m+'<i>分</i></em><span>:</span><em>'+s+'<i>秒</i></em>';
        });
        if($.browser.msie&& $.browser.version<10){
            this.initTipBar();
        }
    },
    initTipBar:function(){
        $('.tip-bar').show();
        setTimeout(function(){
            $('.tip-bar').fadeOut();
        },10000)
    },
    updataWinHeight:function(h,w){
        h=h||$(window).height();
        w=w||$(window).width();
        $('.section').height(h).width(w);
        this.winH=h
        this.len=$(".section").length;
        this.minTop=-(this.len-1)*h;

    },
    resizeHandler:function(){
        this.updataWinHeight();
        this.updataTop();
    },
    bindEvent:function(){
        var that=this;
        $(document).on("mousewheel",function(event,delta){//delta的值是负的即-1，那么滚轮就是向下滚动，正的1就是向上。
           if(that.timer)return;
            var index=that.curIndex;
            if(delta<0){
                index++
            }else{
                index--;
            }
            if(index==that.curIndex||index<0||index>that.maxIndex)return;
            clearTimeout(that.timer);
            that.timer=setTimeout(function(){
                clearTimeout(that.timer);
                that.timer=null;
            },1000);
            $.locationHash(index);

        })
        $(window).hashchange(function(){
            that.updataView($.locationHash()-0);
        });
        $(".but-rt").click(function(){
            clearTimeout(that.autoPlaytimer);
            that.playRight();
        })
        $('.but-lf').click(function(){
            clearTimeout(that.autoPlaytimer);
            that.playLeft();
        })
        $('.but-rt,.but-lf').hover(function(){
            clearTimeout(that.autoPlaytimer);
        },function(){
            that.autoPlay();
        })
        $('.mask-floor').on("mousewheel",function(){
            return false;
        });
        $('.close,.fail-but:first').click(function(){
           that.hideTip();
            switch($('.tips-con').attr('code')){
                case '101':
                case '102':
                case '111':
                case '112':
                    location.reload();
                break;
            }
        })
        $('.quan-click').click(function(){
            that.showTip('tips-info','填写购车人信息');
            that.price=$(this).attr("price");
        })
        $(".queding").click(function(){
            var name=$('.input-bg[name="name"]').val();
            var phone=$('.input-bg[name="phone"]').val();
            var city=$('.input-bg[name="city"]').val();
            var reg=/^1[3-8]{1}[0-9]{9}$/;
            if(name==""){
                alert("姓名不能为空！");
            }else if(phone=="") {
                alert('手机号不能为空！');
            }else if(!reg.test(phone)){
                alert('请输入正确的手机号！')
            }else if(city==""){
                alert('城市不能为空！');
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
                        $('.tips-con').attr('code',data.code);
                        if(data.status=='success'){
                            that.showTip('suc-con','领取成功',data.coupon);
                        }else{
                            that.showTip('fail-con','领取失败',data.coupon,data.msg);
                        }
                    }
                })
            }

        });
        $(window).resize(this.resizeHandler.bind(this))

    },

    showTip:function(cls,txt,coupon,failmsg){
        $('.mask-floor').show();
        $(".tips-box").show();
        txt&&$('.tips-head').text(txt);
        txt&&$(".fail-font").text(txt);
        coupon&&$('.suc-quan span').text(coupon);
        failmsg&&$('.fail-font').text(failmsg);
        $('.'+cls).show().siblings().hide();
    },
    hideTip:function(){
        $('.mask-floor').hide();
        $(".tips-box").hide();
    },
    initView:function(index){
        $('.section').eq(index).addClass('moveIn').siblings().removeClass('moveIn');
    },
    updataView:function(index){
        index=index-0;
        if(index==this.curIndex||index<0||index>this.maxIndex)return;
        if(index==3){
            this.autoPlay();
        }
        var top=-(index)*this.winH;
        this.updataTop(top);
        $('.section').eq(index).addClass('moveIn').siblings().removeClass('moveIn');
        $('#fp-nav a').eq(index).addClass("active").parent().siblings().find('a').removeClass("active")
        this.curIndex=index;

    },
    updataTop:function(top){
        if(!arguments.length){
            top=-this.curIndex*this.winH;
        }
        if($.browser.msie&& $.browser.version<10){
            $(".fullpage").stop(true).animate({top:top},700)
        }else{
            $(".fullpage").css({"transform":"translate3d(0px,"+top+"px,0)"})
        }


    },
    slideView:function(){
        var that=this;
        $(".slide-img").append($(".slide-img li:first").clone());
        that.autoPlay()
    },
    autoPlay:function(){
        var that=this,callee=arguments.callee;
        clearTimeout(this.autoPlaytimer);
        this.autoPlaytimer=setTimeout(function(){
            that.playRight();
            callee.call(that);
        },5000)
    },
    playLeft:function(){
        this.step--;
        if(this.step<=-1){
            this.step=5;
            this.slideUl.css("left",-(this.slideLen-1)*this.imgWid);

        }
        this.slideUl.stop(true).animate({left:-this.step*this.imgWid+'px'});
    },
    playRight:function(){
        this.step++;
        if(this.step>=7){
            this.step=1;
            this.slideUl.css("left","0");
        }
        this.slideUl.stop(true).animate({left:-this.step*this.imgWid+'px'});
    },
    getCouponList:function(){
        var html="";
        $.ajax({
            type:"get",
            url:"/?c=special&a=ding150908lastdata",
            dataType:"json",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    html+='<li>'+data[i].name+' 领取了一张<em>'+data[i].type+'</em>元优惠券</li>';
                }
                $('.user').html(html);
            }
        })

    }





}
return ding;