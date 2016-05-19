var base=require('common:widget/ui/base/base.js');
var app=require('../app.js');
var baseView=require('../view.js');
var View=base.Class(function(){
    baseView.apply(this, arguments);
},baseView).extend({
    init:function(modelKey,listKey){
        this.listKey=listKey||modelKey;
        this.modelKey=modelKey;
        this.list=app[modelKey];
        this.updataModel();
        this.updataList();
        this.bindEvent();
    },
    updataModel:function(){
        var that=this;
        for(var i=0;i<this.list.length;i++){
            this.list[i].selectText=$.trim(this.$el.find('.select-item').eq(i).html()||'');
        }
    },
    updataList:function(e){
        e=e||{};
        var list=e.list||this.list;
        e.needInit&&this.initList(list);
        var index=list.getSelectedIndex();
        if(!list||index<0)return;
        this.$el.find('.select-item')
            .removeClass('selected')
            .eq(index).addClass('selected');
    },
    initList:function(list){

    },
    bindEvent:function(){
        var that=this;
        this.$el.on('click','.select-item',function(){
            if($(this).hasClass('disabled'))return;
            var id=$(this).attr('data-id');
            var groupId=$(this).attr('groupId');
            that.dispatchEvent('change.list',{'listKey':that.listKey,'groupId':groupId,'modelKey':that.modelKey,'id':id});
            that.toMainPage();
        });
        app.addEventListener(this.listKey+'.change',this.updataList,this);

    }


});
return View;