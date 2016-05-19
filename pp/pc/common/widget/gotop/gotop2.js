var gotop={
    init:function(){
        this.$el=$('#gotop-box');
        this.$online=$('.ask-online');
        this.$win=$(window);
        this.updata();
        this.bindEvent();
        BizQQWPA&&BizQQWPA.addCustom({aty: '0', a: '0', nameAccount: 4008903881, selector: this.$online[0].id});

    },
    bindEvent:function(){
        var that=this,timer;
        this.$win.scroll(function(){
            clearTimeout(timer);
            timer=setTimeout(function(){
                that.updata();
            },10)
        });
        this.$el.click(function(){
            $('html,body').animate({
                scrollTop:0
            },500,function(){
                that.updata();
            })
        });

    },
    updata:function(){
        var scrollTop= this.$win.scrollTop();
        scrollTop>0? this.$el.show():this.$el.hide();
    },
    show:function(){
        this.$el.show();
    },
    hide:function(){
        this.$el.hide();
    }
}
return gotop;