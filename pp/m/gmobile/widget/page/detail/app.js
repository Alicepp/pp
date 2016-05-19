var base=require('common:widget/ui/base/base.js');
var Model=require('./model.js');
emao.defaultDeposit=emao.defaultDeposit||{};
var App=base.Class(function(){
},base.event).extend({
    init:function(){
        this.model=new Model();
        this.model.init();
        this.colors=new base.listModel(emao.colors||[],'color');
        this.deposit=new base.listModel(emao.deposit);
        this.points=new base.listModel(this.mergeList(emao.points.dealer),'dealerid');
        this.goodsAuto=new base.listModel(this.grepList(emao.goodsAuto),'autoId');
        this.parts=new base.listModel();
        emao.defaultColor=emao.defaultColor||{};
        this.colors.selectId=emao.defaultColor.color;
        this.deposit.selectId=emao.defaultDeposit.id;
        this.points.selectId=emao.defaultPoint.dealerid;
        for(var i in emao.groupIds){
            var key='parts-'+emao.groupIds[i];
            this[key]=new base.listModel(emao[key]||[]);
            this[key].selectId=emao[key][0].id;
        }
        this.history=[];
    },
    grepList:function(list){
        list=list||[];
        var arr=[];
        for(var i=0;i<list.length;i++){
            arr.push(list[i][0]);
        }
        return arr;
    },
    mergeList:function(obj){
        var list=[];
        for(var k in obj){
            list.push.apply(list,obj[k]);
        }
        return list;
    },
    'change.remined':function(e){
        this.model.set('remined', e.remined);
        this.dispatchEvent('remined.change',{
            remined:this.model.get('remined')
        });
    },
    'change.list':function(e){
        var needInit=false;
        e.modelKey=e.modelKey||e.listKey;
        if(e.list){
            this[e.modelKey]=new base.listModel(e.list,this[e.modelKey].keyName);
            needInit=true;
        }
        var list=this[e.modelKey];
        list.selectId=e.id;
        this.dispatchEvent(e.listKey+'.change',{
            list:list,
            needInit:needInit,
            modelKey:e.modelKey,
            groupId:e.groupId,
            id:e.id

        })
    },
    'to.page':function(e){
        this.currentPage=e.pageCls;
        this.history.push(e.pageCls);
        this.dispatchEvent('page.change',{
            data: e.data,
            pageCls:this.currentPage
        })
    }


});
var app= new App();
app.init();
return app;
