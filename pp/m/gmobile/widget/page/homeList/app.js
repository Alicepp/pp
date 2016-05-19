var base=require('common:widget/ui/base/base.js');
var Model=require('./model.js');
var SortView=require('./sortView.js');
var ListView=require('./listView.js');
var SidebarView=require('./sidebar/sidebar.js');
var app=base.Class(function() {
    base.event.apply(this);
}, base.event).extend({
    init:function(){

        this.model=new Model();
        this.sortView=new SortView($('.list-tab'));
        this.listView=new ListView($('.pro-list'));
        this.sidebarView=new SidebarView($('.filter-sidebar'));


        this.sortView.bindModel(this.model);
        this.listView.bindModel(this.model);
        this.sidebarView.bindModel(this.model);

        this.sortView.bindCtr(this);
        this.listView.bindCtr(this);
        this.sidebarView.bindCtr(this);
        this.model.addEventListeners({
                "change.url" : function(e){
                    this.pushState(e.data);
                }
        },this);
    },
    pushState:function(data){
        var $url='car';
        $url+='-';
        $url+=data['sellType'];
        $url+='-';
        $url+=data['brandId'];
        $url+='-';
        $url+=data['carriageId'];
        $url+='-';
        $url+=data['price'];
        $url+='-';
        $url+=data['carFrom'];
        $url+='-';
        $url+=data['isActivity'];
        $url+='-';
        $url+=data['priceSort'];
        $url+='-1.html';
        history.pushState(null,'',$url)
        return $url;

    },
    sortBtnClick:function(e){
        var sort=this.model.get('priceSort');
        switch (this.model.get('priceSort')){
            case '1':
                sort='2';
                break;
            case '2':
                sort='1';
                break;
            default :
                sort='1';
        }
        this.model.set('priceSort',sort);
    },
    openSideBar:function(){
        this.model.set('sidebarState',1);
    },
    closeSideBar:function(){
        this.model.set('sidebarState',0);
    },
    changeModel:function(data){
        this.model.set(data);
    },
    scrollHander:function(){
        var that=this;
        clearTimeout(this.scrollTimer);
        this.scrollTimer=setTimeout(function(){
            var countHigh=$(window).height()+$(window).scrollTop()+20,
                dHigh=$(document).height();
            if(countHigh>dHigh){
                that.loadMore();
            }
        },50)
    },
    loadMore:function(){
        this.model.set('page',this.model.get('page')+1);
    }
});
return new app;
