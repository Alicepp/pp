var base=require('common:widget/ui/base/base.js');
var Model=require('./model.js');
var App=base.Class(function(){
},base.event).extend({
    init:function(){
        this.model=new Model();
        this.model.init();
        this.history=[];
    },
    'to.page':function(e){
        this.currentPage=e.pageCls;
        this.history.push(e.pageCls);
        this.dispatchEvent('page.change',{
            data: e.data,
            pageCls:this.currentPage
        })
    },
    'list.add':function(e){
        var id= e.id;
        this.model.add(id);
        this.dispatchEvent('list.change',{
            list: this.model.getList(),
            pageCls:this.currentPage
        })
    },
    'list.del':function(e){
        var id= e.id;
        this.model.del(id);
        this.dispatchEvent('list.change',{
            list: this.model.getList(),
            pageCls:this.currentPage
        })
    }



});
var app= new App();
app.init();
return app;
