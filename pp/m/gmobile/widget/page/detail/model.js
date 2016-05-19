var base=require('common:widget/ui/base/base.js');

var Model=base.Model.extend({
    init:function(){

    },


    setPage:function(page){
        this.set('page',page);
    }


});
return Model;