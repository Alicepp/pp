/**
 * Created by xiaochao on 2015/10/9.
 */
var app={
    init:function(){
        this.$el=$('.se-sidebar');
        this.$box=this.$el.find('.side-box');
        this.$navLi=$('.side-nav li');
        this.$ul=$('.side-list ul');
        this.bindEvent();
    },
    bindEvent:function(){
        var that=this;
        this.$el.click(this.sideRight.bind(this,this.hide.bind(this)));
        this.$box.click(function(e){
            e.stopPropagation();
        });
        this.$el.swipeRight(this.sideRight.bind(this,this.hide.bind(this)));
        this.$navLi.click(function(){
            that.switchTo($(this).index());
        });

    },
    switchTo:function(index){
        this.$navLi.eq(index).addClass('selected').siblings().removeClass('selected');
        this.$ul.eq(index).addClass('selected').siblings().removeClass('selected');
    },
    sideLeft:function(){
        this.show();
        this.boxW=this.$box.width();
        this.$box.animate({'right':0})
    },
    sideRight:function(callback){
        this.show();
        this.boxW=this.$box.width();
        this.$box.animate({'right':-this.boxW},callback);
    },
    show:function(){
        this.$el.show();
    },
    hide:function(){
        this.$el.hide();
    }


}

return app;