var base=require('common:widget/ui/base/base.js');
var app=require('./app.js');
var View=base.Class(function(opts){
    opts=opts||{};
    this.addEventListeners(app, app);
    this.model = app.model;
    this.pageCls=opts.pageCls||this.pageCls;
    this.$el=opts.$el||$('.'+this.pageCls);
    this.bindCommonEvent()
},base.event).extend({

    bindCommonEvent:function(){
        var that=this;
        app.addEventListener('page.change',this.updataPage,this);
        this.$el.on('click','.btn-return',this.toMainPage.bind(this));
        this.$el.swipeLeft(this.swipeLeftHandler.bind(this));
    },
    swipeLeftHandler:function(){
        this.toMainPage();
    },
    toMainPage:function(){
        this.toPage('page-detailMain');
    },
    updataPage:function(e){
        if(e.pageCls==this.pageCls){
            this.isHide&&this.show(e);
        }else {
            !this.isHide&&this.hide();
        }
    },
    toPage:function(pageCls,data){
        if(!pageCls)return;
        this.dispatchEvent('to.page',{'pageCls':pageCls,'data':data});
    },
    showAction:function(){
    },
    hideAction:function(){
    },
    show:function(){
        this.isHide=false;
        this.$el.fadeIn(300);
        this.showAction();
    },
    hide:function(){
        this.isHide=true;
        this.$el.fadeOut(100);
        this.hideAction();
    }

});
return View;