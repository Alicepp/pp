var base=require('common:widget/ui/base/base.js');
var app=require('./wish.js');
var Me = base.Class(function(opts) {
    this.addEventListeners(app, app);
    opts=opts||{};
    this.model = app.model;
    this.pageCls=this.pageCls||'wish1';
    this.$el=opts.$el||$('.'+this.pageCls);
    this.bindEvent();
}, base.event).extend({
    init:function(opts){
        opts=opts||{};
        this.liTpl='<li data-id="{{=it.id}}" data-name="{{=it.brandName}}">{{=it.brandName}}<i></i></li>';
        this.liFun=base.template(this.liTpl);
        this.$ul=this.$el.find('.select-list');
        this.$ul.html('');
        this.inited=true;
        this.dispatchEvent('to.page',{pageCls:this.pageCls});
    },
    bindEvent:function(){
        var that=this;
        app.addEventListener('list.change',this.updata,this);
        app.addEventListener('page.change',this.updataPage,this);
        this.$el.on('click','.brand-item',function(){
            var data={
                id:$(this).attr('data-id'),
                brandName:$(this).attr('data-name')
            };
            that.dispatchEvent('list.add',{data:data,pageCls:that.pageCls});
        });
        this.$el.on('click','.select-list li i',function(){
            var $li=$(this).parents('li');
            var data={
                id:$li.attr('data-id'),
                brandName:$li.attr('data-name')
            };
            that.dispatchEvent('list.del',{key:data.id,pageCls:that.pageCls});
        });
        this.$el.on('click','.pre-but',function(){
            that.prevClickHandler(this);

        });
        this.$el.on('click','.next-but',function(){
            that.nextClickHandler(this);
        });

    },
    prevClickHandler:function(item){
        var topage=$(item).attr('to');

        this.dispatchEvent('to.page',{pageCls:topage});
    },
    nextClickHandler:function(item){
        var topage=$(item).attr('to');

        this.dispatchEvent('to.page',{pageCls:topage,data:this.model.getList()});
    },
    updataPage:function(e){
        if(e.pageCls==this.pageCls){
            this.show(e);
        }else{
            this.hide();
        }
    },
    updata:function(e){
        if(e.pageCls!=this.pageCls)return;
        this.list= e.list;
        this.updataLeftView(e.list);
        this.updataRightView(e.list);
        this.updataBtn(e.list);
    },
    updataLeftView:function(list){
        this.$el.find('.brand-item').removeClass('checked');
        $(list).each(function(i,item){
            $('#brand-item-'+item.id).addClass('checked');
        });
    },
    updataRightView:function(list){
        var that=this;
        var ulStr='';
        $(list).each(function(i,item){
            ulStr+=that.liFun(item);
        });
        this.$ul.html(ulStr);
    },
    updataBtn:function(list){
        this.$prev= this.$el.find('.pre-but');
        this.$next= this.$el.find('.next-but');
        list.length?this.$next.show():this.$next.hide();
    },
    show:function(e){
        this.$el.show();
    },
    hide:function(){
        this.$el.hide();
    }


});
return Me;