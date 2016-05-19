var base=require("common:widget/ui/base/base.js");
var selectedCls='selected';
var hoverCls='hover';
var fixedCls='fixed';
var app={
    init:function(list){
        this.$el=$('.leftnav');
        this.$navul=this.$el.find('ul');
        this.$navli=this.$el.find('li');
        this.$navitem=this.$el.find('.lfnav-item');
        this.$levelnav=$('.level-nav');
        this.offsetTop=this.$el.offset().top;
        this.elHeight=this.$el.height();
        this.$win=$(window);
        this.list=new base.listModel(list||[]);
        this.scrollTop=this.$win.scrollTop();
        if(this.list.length<1){
            this.$el.hide();
            return;
        };
        this.updateModel();
        this.bindEvent();
        this.scrollHandler();
        this.slider(this.$el);
    },
    updateModel:function(){
        var that=this;
        this.list.each(function(i,item){
            item.top=$('.level-nav-'+item.id).offset().top;
        })
    },
    bindEvent:function(){
        var that=this;

        this.$navli.on('click',function(){
            var id=$(this).attr('data-id');
            that.changeSelectId(id);
        });
        this.$win.scroll(that.scrollHandler.bind(that));
        this.$win.resize(function(){
            that.changeSelectId(that.list.selectId,true);
        });

    },
    changeSelectId:function(id,noScroll){
        this.list.selectId=id;
        this.updateNav();
        !noScroll&&this.updateScrollTop();
    },

    updateNav:function(){
        var id=this.list.selectId;
        $('.lfnav-li-'+id).addClass(selectedCls).siblings().removeClass(selectedCls);
        this.updataFix();
    },
    updataFix:function(){
        var top=this.$win.scrollTop();
        this.offsetTop=this.$el.offset().top;
        top>=this.offsetTop?this.$navul.addClass(fixedCls):this.$navul.removeClass(fixedCls);
    },
    updateScrollTop:function(){
        var id=this.list.selectId;
        var $nav=$('.level-nav-'+id);
        var top=this.$win.scrollTop();
        window.scrollTo(0,$nav.offset().top-this.elHeight);

    },
    getIdByTop:function(top){
        var id=this.list[0].id;
        for(var i=0;i<this.list.length;i++){
            if(top>=(this.list[i].top-20-this.elHeight)){
                id= this.list[i].id;
            }
        }
        if(top+this.$win.height()+this.elHeight>$(document).height()){
            id=this.list[this.list.length-1].id;
        }
        return id;
    },

    scrollHandler:function(){
        var top=this.$win.scrollTop();
        var id=this.getIdByTop(top);
        this.changeSelectId(id,true);
        this.scrollTop=top;
    },
    show:function(){
        this.$el.fadeIn(300);
    },
    hide:function(){
        this.$el.fadeOut(200);
    },
    slider:function(ele) {

        ele||'';
        var lis = ele.find('li'),
        widths = lis.map(function(index, item) {
            return $(item).width()
        }),
        wrapperWidth = widths.reduce(function(p, c, i, l) {
            return p + c;
        });
        touchPos = {
            startX: 0,
            x: 0,
            deltaX: 0
        },
        _width = wrapperWidth - $(window).width();
    // ele.css({
        //     'webkitTransition': 'all ease 0.5s',
        //     'transition': 'all ease 0.5s',
        //     '-webkit-transition': 'all ease 0.5s'
        // });
        var target = ele.find('ul').css('width', wrapperWidth);
        var left = 0;
        ele.on('touchstart', sometime);
        ele.on('touchmove', drag);
        ele.on('touchend', drop)

        function sometime(e) {
            touchPos.startX = e.touches[0].pageX;
        }

        function drop(e) {
            left = parseInt(target.css('left')) || 0
        }

        function drag(e) {
            touchPos.x = e.touches[0].pageX;
            touchPos.deltaX = touchPos.x - touchPos.startX;
            var delta = left + touchPos.deltaX;
            if (delta <= -_width) {
                delta = -_width
            } else if (delta > 0) {
                delta = 0
            }
            target.css({
                left: delta
            });
            return false;
        }
    }

}
return app;