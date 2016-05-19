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
        this.$fitItem=this.$el.find('.fit-item');
        this.$li=this.$el.find('.fit-li');
        this.$sureBtn=this.$el.find('.que-btn');
        this.bindEvent();

    },
    bindEvent:function(){
        var that=this;
        this.$fitItem.click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            that.updataView();


        });
        this.$sureBtn.click(function(){
            if($(this).hasClass('disabled'))return;
            that.dispatchEvent('change.list',{'listKey':that.listKey,'id':that.getIds()});
            that.toMainPage();
        });
    },
    getIds:function(){
        var idList=[];
        this.$li.find('.active').each(function(){
            idList.push($(this).attr('data-id'));
        });
        idList=idList.sort(function(a,b){return a-b;});
        return idList.join('_');
    },
    showAction:function(){
        var ids=$('.choose-parts').attr('data-id');
        if(!ids)return;
        this.updataView(ids);
        ids='_'+ids+'_';
        this.$fitItem.each(function(){
            var id=$(this).attr('data-id');
            ids.indexOf('_'+id+'_')>-1?$(this).addClass('active'):$(this).removeClass('active');
        });

    },
    updataView:function(id){
        id=id||this.getIds();
        var num=this.getPartsNum(id);
        num>0?this.$sureBtn.removeClass('disabled'):this.$sureBtn.addClass('disabled');

    },
    getPartsNum:function(ids){
        ids=ids||this.partsid;
        emao.matrix=emao.matrix||{};
        emao.matrix[ids]=emao.matrix[ids]||{num:0};
        return emao.matrix[ids].num-0;
    }
});

return View;