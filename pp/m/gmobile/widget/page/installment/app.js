var base=require('common:widget/ui/base/base.js');
var App=base.Class(function(){
  base.event.apply(this,arguments);
  this.views=new base.listModel([],'pageCls');
  this.history=new base.listModel([],'pageCls');
  this.homeCls='page-list';
},base.event).extend({
    init:function(opts){
        opts=opts||{};
        this['to.page']({pageCls:opts.pageCls||this.homeCls})
    },
    'history.back':function(){
        this['to.page']({pageCls:this.history.length<2?this.homeCls:this.history[this.history.length-2]},true)
    },
    'to.page':function(e,isHistory){
        this.currentPage=e.pageCls;
        if(isHistory){
            this.history.shift();
        }else{
            this.history.push(e.pageCls);
        }
        this.dispatchEvent('page.change',{
            data: e.data,
            pageCls:this.currentPage
        })
    }


});
var app= new App();
return app;
