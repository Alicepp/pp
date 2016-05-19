var base=require('common:widget/ui/base/base.js');
var Model=require('./model.js');
var App=base.Class(function(){
},base.event).extend({
    init:function(){
        this.model=new Model();
        this.model.init();
    },
    'list.add':function(e){
        this.model.add(e.data);
        this.dispatchEvent('list.change',{
            pageCls:this.model.get('page'),
            list:this.model.getList()
        })
    },
    'list.del':function(e){
        this.model.del(e.key);
        this.dispatchEvent('list.change',{
            pageCls:this.model.get('page'),
            list:this.model.getList()
        })
    },
    'to.page':function(e){
        this.model.setPage(e.pageCls);
        this.dispatchEvent('page.change',{
            data: e.data,
            pageCls:e.pageCls
        })
    }
})
var app= new App();
app.init();
return app;