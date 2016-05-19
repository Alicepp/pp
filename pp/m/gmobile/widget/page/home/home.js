var endDown=require('common:widget/ui/plugin/countdown.js');
var utils=require('common:widget/ui/base/utils.js');
var base=require('common:widget/ui/base/base.js');
var islider=require('common:widget/ui/plugin/islider.js');

var home=base.Class(function(){
    this.pageCls='mall-dis';
    base.event.apply(this, arguments);
},base.event).extend({
    init:function(opts){
        opts=opts||{};
        this.slide(opts.ads);
        this.bindEvent();
    },
    bindEvent:function(){
        $('.tuanitem img').lazyLoad({
            topCls:'.tuanitem',
            beforeBind:function(){
                this.$el.parents('.tuanitem').css('opacity',1);
                this.$el.css('opacity',0);
            },
            loadHandler:function(e){
                e.status&&this.$el.css('opacity',1);
                e.status&&this.$el.parents('.item-top').height(this.$el.height());
                e.status&&this.$el.parents('.item-top').css('min-height',this.$el.height());
                this.$el.parents('.tuanitem').css('opacity',1);
            }
        });
        $('.gooditem img').lazyLoad({
            topCls:'.gooditem',
            beforeBind:function(){
                this.$el.parents('.gooditem').css('opacity',1);
            },
            loadHandler:function(){
                this.$el.parents('.gooditem').css('opacity',1);
            }
        });

    },
    slide:function(list){
        //	轮播图数据
        /*var list = [
            {
                url: "http://www.emao.com",
                content: "../imgs/temp/banner.jpg"
            }, {
                url: "http://www.emao.com",
                content: "../imgs/temp/banner.jpg"
            }, {
                url: "http://www.emao.com",
                content: "http://192.168.20.164:8021/emao/branches/dev/mall/web/j/images/public/pic-big.jpg"
            }, {
                url: "http://www.emao.com",
                content: "../imgs/temp/banner.jpg"
            }, {
                url: "http://www.emao.com",
                content: "../imgs/temp/banner.jpg"
            }
        ];*/
        //	焦点图
        //debugger;
        var dom=document.getElementById("js_focusPic");
        $(dom).height($(window).width()*400/750);
        var opts = {
            type: 'pic',
            data: list,
            dom: dom,
            isLooping: true,
            duration: 5000,
            isAutoplay:true,
            fixPage: false
        };
        var	islider = new iSlider(opts);
        islider.addDot();


        //判断手机横竖屏
        function judgeScreen(){
            $(dom).height($(window).width()*400/750);
            if(window.orientation==180||window.orientation==0){
                $('#js_focusPic').empty();
                $('.islider-dot-wrap').remove();
                var	islider = new iSlider(opts);
                islider.addDot();
            }
            if(window.orientation==90||window.orientation==-90){
                $('#js_focusPic').empty();
                $('.islider-dot-wrap').remove();
                var	islider = new iSlider(opts);
                islider.addDot();
            }
        }
        window.addEventListener("onorientationchange" in window ? "orientationchange" : "resize", judgeScreen, false);
    }



});
return home;