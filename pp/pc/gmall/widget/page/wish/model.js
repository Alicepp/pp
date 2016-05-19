var base=require('common:widget/ui/base/base.js');
var Model=base.Model.extend({
    init:function(opts){
        opts=opts||{};
        this.maxNum=5;
    },
    getList:function(k){
        return $.extend([],this.get(this.listKey)||[]);
    },
    initList:function(){
        if(this.getList().length)return;
        this.set(this.listKey,new base.listModel());
    },
    resetList:function(){
        this.set(this.listKey,new base.listModel());
    },
    setPage:function(page){
        this.set('page',page);
        this.listKey=page+'list';
        this.initList();
    },
    del:function(key){
        var list=this.getList();
        list.del(key);
        this.set(this.listKey,list);
    },
    add:function(obj){
        var list=this.getList();
        if(list.length>=this.maxNum){
            alert('最多添加'+this.maxNum+'条');
            return;
        }
        list.add(obj);
        this.set(this.listKey,list);
    }

})
return Model;