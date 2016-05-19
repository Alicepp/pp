var log=require('common:widget/ui/base/log.js');
var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var gotop={
    init:function(){
        var that=this;
        this.$el=$('.rightBar');
        this.$gotop=$('#gotop');
        this.$online=$('.ask-online');
        this.$win=$(window);
        this.elHeight=this.$el.height();
        this.minTop=520;
        this.updata();
        this.bindEvent();
        BizQQWPA&&BizQQWPA.addCustom({aty: '0', a: '0', nameAccount: 4008903881, selector: this.$online[0].id});
        //this.$online.length&&utils.getLoginAskLink(function(link){
        //    that.$online.attr('href',link);
        //});


    },
    bindEvent:function(){
        var that=this,timer;
        this.$win.scroll(function(){
            clearTimeout(timer);
            timer=setTimeout(function(){
                that.updata();
            },10)
        });
        this.$win.resize(function(){
            that.updata();
        });
        this.$gotop.click(function(){
            $('html,body').animatePromise({
                scrollTop:0
            },500).then(that.updata.bind(that));
        });
        this.$online.click(log.ga5.bind(log));
    },
    updata:function(){
        var scrollTop= this.$win.scrollTop();
        scrollTop>0? this.$gotop.show():this.$gotop.hide();
        $('body').hasClass('actCls')&&this.updataBottom();
    },
    updataBottom:function(){
        var scrollTop= this.$win.scrollTop();
        var winHeight=this.$win.height();
        if(this.elHeight+this.minTop>scrollTop+winHeight){
            this.$el.css('bottom',-222);
        }else{
            this.$el.css('bottom',10);
        }

    },
    show:function(){
        this.$el.show();
    },
    hide:function(){
        this.$el.hide();
    }
}
return gotop;