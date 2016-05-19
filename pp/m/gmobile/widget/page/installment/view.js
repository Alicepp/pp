var base=require('common:widget/ui/base/base.js');
var app=require('./app.js');
var View=base.Class(function(pageCls,$el){
    this.addEventListeners(app, app);
    this.model = app.model;
    this.pageCls=pageCls||this.pageCls;
    this.$el=$el||$('.'+this.pageCls);
    this.bindCommonEvent();
    app.views.push(this);
},base.event).extend({
    bindCommonEvent:function(){
        var that=this;
        app.addEventListener('page.change',this.updataPage,this);
        this.$el.on('click','[topagecls]',function(){
            that.toPage($(this).attr('topagecls'));
        });
        this.$el.on('click','.btn-back',this.backHandler.bind(this));
    },
    backHandler:function(){
        this.dispatchEvent('history.back');
    },
    updataPage:function(e){
        if(e.pageCls==this.pageCls){
            !this.isShow&&this.show(e);
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
        this.isShow=true;
        this.isHide=false;
        this.$el.fadeIn(300);
        this.showAction();

    },
    hide:function(){
        this.isHide=true;
        this.isShow=false;
        this.$el.fadeOut(100);
        this.hideAction();
    }

});
return View;