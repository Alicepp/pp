var base = require('common:widget/ui/base/base.js');
var utils = base.utils;
var Me = base.Class(function($el) {
    base.event.apply(this, arguments);
    this.view = new View($el);
    this.model = new Model(emao.FDATA);
    this.ctrl = new Ctrl(this.model);
    this.view.bindModel(this.model);
    this.view.bindCtr(this.ctrl);
    this.model.set('page','home');
}, base.event).extend({
    bindModel:function(model){
        model.addEventListeners({
            "change.sidebarState":function(e){
                this.view.updataState(model.get('sidebarState'));
            }
        }, this);
    },
    bindCtr:function(ctrl){
       this.model.addEventListeners({
            "model.saved":function(e){
                var pageData=this.model.get('pageData');
                var data={};
                for(var i=0;i<pageData.length;i++){
                    data[pageData[i].keyId]=pageData[i].selectId;
                }
                ctrl.changeModel(data);
                ctrl.closeSideBar();
            },
            'model.cancelAll':function(){
                ctrl.closeSideBar();
            }
        }, this);
       this.ctrl.addEventListeners({
           'ctrl.close':function(){
               ctrl.closeSideBar();
           },
       }, this);
    }

});
var Model=base.Class(function(data){
    base.Model.apply(this, arguments);
    for(var i=0;i<data.length;i++){
        data[i].list.unshift({'id':0,'name':'全部'+data[i].keyName});
        data[i].list=new base.listModel(data[i].list);
        this.setItemId(data[i],emao.searchParam[data[i].keyId],true);
    }
    this.set('pageData',data);
}, base.Model).extend({
    setItemId:function(obj,id,isSave){
        id=id||0;
        obj.list.selectId=id;
        obj.seData=obj.list.getSelectedData();
        obj.keyVal=(obj.list.selectId==0)?0:obj.seData.name;
        isSave&&(obj.selectId=id);
      return obj;
    },
    setSelectId:function(id,page){
        var i=page||this.get('page');
        var data=this.get('pageData');
        this.setItemId(data[i],id);
        this.set('pageData',data);
        this.dispatchEvent('change.page');
    },

    clearAll:function(){
        var data=this.get('pageData');
        for(var i=0;i<data.length;i++){
            this.setItemId(data[i],0);
        }
        this.set('pageData',data);
        this.dispatchEvent('change.page');
    },
    cancelAll:function(){
        var data=this.get('pageData');
        for(var i=0;i<data.length;i++){
            this.setItemId(data[i],data[i].selectId);
        }
        this.set('pageData',data);
        this.dispatchEvent('model.cancelAll');
    },
    clearPage:function(i){
        var data=this.get('pageData');
        this.setItemId(data[i],data[i].selectId);
        this.set('pageData',data);
    },

    save:function(){
        var data=this.get('pageData');
        for(var i=0;i<data.length;i++){
            this.setItemId(data[i],data[i].list.selectId,true);
        }
        this.set('pageData',data);
        this.dispatchEvent('model.saved');
    }

});


var View = base.Class(function($dom){
    base.event.apply(this, arguments);
    this.$el = $dom;
    this.$box=this.$el.find('.side-box');
    this.$list=this.$el.find('.filter-list');
    this.$tit=this.$el.find('.tit');
    this.$sure=this.$el.find('.btn-sure');
    this.$cancel=this.$el.find('.btn-cancel');
    this.$clear=this.$el.find('.clearbtn');
    this.TPL_HOME=['<ul class="filterUl-home" tit="筛选" >',
        '<%for(var i=0;i<this.length;i++){%>',
            '<li class="center-v home-item" page="<%i%>" keyId="<%this[i].keyId%>">',
                '<div class="fh-key"><%this[i].keyName%></div>',
                '<div class="fh-val flex1"><%if(!this[i].keyVal){%>全部<%}else{%><span><%this[i].keyVal%></span><%}%></div>',
            '</li>',
        '<%}%>',
        '<li class="center li-clearbtn">',
            '<span class="clearbtn">清除选项</span>',
        '</li>',
        '</ul>'].join('');
    this.TPL_UL=['<ul class="filterUl-item " keyId="<%this.keyId%>">',
    '<%for(var i=0;i<this.list.length;i++){%>',
        '<li class="<%if(this.list.selectId==this.list[i].id){%>selected<%}%>" data-id="<%this.list[i].id%>">',
        '<span><%this.list[i].name%></span>',
        '</li>',
    '<%}%>',
        '</ul>'].join('');
    this.tplFun_Home=utils.tplEngine(this.TPL_HOME);
    this.tplFun_Ul=utils.tplEngine(this.TPL_UL);

}, base.event).extend({
    bindModel : function(model){
        model.addEventListeners({
            "change.page":function(e){
                this.updataPage(model);
            },
            "change.pageData":function(e){
                this.updataPage(model);
            }
        }, this);
    },
    bindCtr:function(ctrl){
        this.$box.on('click','.home-item',function(e){
            e.page=$(this).attr('page');
            ctrl.changePage(e);
        });
        this.$box.on('click','.filterUl-item li',function(e){
            e.id=$(this).attr('data-id');
            ctrl.changeSelectId(e);
        });
        this.$box.on('click','.clearbtn',function(e){
            ctrl.clearAll(e);
        });
        this.$sure.click(function(e){
            ctrl.save(e);
        })
        this.$cancel.click(function(e){
            ctrl.cancel(e);
        })
        this.$el.click(function(e){
            ctrl.close(e);
        });
        this.$el.swipeRight(function(e){
            ctrl.close(e);
        });
        this.$box.click(function(e){
            e.stopPropagation();
        });

    },
    updataPage:function(model){
        var page=model.get('page');
        var pageData=model.get('pageData');
        console.log(pageData);
        var tit='筛选';
        var list='';
        if(page=='home'){
            list=this.tplFun_Home(pageData);
            tit='筛选';
        }else{
            list=this.tplFun_Ul(pageData[page]);
            tit=pageData[page].keyName;
        }
        this.$list.html(list);
        this.$tit.html(tit);
        this.$el.attr('page',page);
    },

    updataState:function(state){
        state?this.open():this.close();
    },
    open:function(){
        this.show();
        this.boxW=this.$box.width();
        this.$box.animate({'right':0},this.show.bind(this));
    },
    close:function(){
        this.show();
        this.boxW=this.$box.width();
        this.$box.animate({'right':-this.boxW},this.hide.bind(this));
    },
    show:function(){
        this.$el.show();
    },
    hide:function(){
        this.$el.hide();
    }
});


var Ctrl = base.Class(function(model) {
    base.event.apply(this);
    this.model = model;
}, base.event).extend({
    itemClick: function(e) {
        this.dispatchEvent('leftNav.change');
    },
    changePage:function(e){
        this.model.set('page', e.page);
    },
    changeSelectId:function(e){
        this.model.setSelectId(e.id);
    },
    save:function(e){
        var page=this.model.get('page');
        if(page!='home'){
            this.model.set('page','home');
        }else{
            this.model.save()

        }
    },
    cancel:function(e){
        var page=this.model.get('page');
        if(page!='home'){
            this.model.clearPage(page);
            this.model.set('page','home');
        }else{
            this.model.cancelAll();
        }
    },
    clearAll:function(e){
        this.model.clearAll();

    },
    close:function(e){
        this.dispatchEvent('ctrl.close');
    }
});



return Me;





