var base=require('common:widget/ui/base/base.js');
var View=require('./view.js');
var app=require('./wish.js');
var Me = base.Class(function(opts) {
    this.pageCls='wish2';
    View.apply(this, arguments);
}, View).extend({
    init:function(opts){
        opts=opts||{};
        this.liTpl='<li data-id="{{=it.id}}" data-name="{{=it.brandName}}">{{=it.brandName}}<i></i></li>';
        this.liFun=base.template(this.liTpl);
        this.$ul=this.$el.find('.select-list');
        this.$ul.html('');
    },
    updataPage:function(e){
        if(e.pageCls==this.pageCls){
            this.initPage(e.data);
            e.data&&this.model.resetList();
            this.updataLeftView();
            this.updataRightView();
            this.updataBtn(this.model.getList());
            this.show(e);
        }else{
            this.hide();
        }
    },
    initPage:function(data){
        if(!data)return;
        var htmlStr='<div class="buy-brand">选择您想购买的车系</div>';
        for(var item in data){
            htmlStr+='<h3><i></i>'+data[item].name+'</h3><ul class="version-list">';
            var serie=data[item].serie||[];
            for(var i=0; i<serie.length; i++){
                htmlStr+='<li class="brand-item" id="brand1-item-'+serie[i].id+'" data-name="'+serie[i].serieName+'" data-id="'+serie[i].id+'"><a href="javascript:;">'+serie[i].serieName+'</a></li>';
            }
            htmlStr+='</ul>'
        }
        this.$el.find('.wish-lf').html(htmlStr);
    },
    updataLeftView:function(list){
        list=list||this.model.getList();
        this.$el.find('.brand-item').removeClass('checked');
        $(list).each(function(i,item){
            $('#brand1-item-'+item.id).addClass('checked');
        });
    },
    updataRightView:function(list){
        list=list||this.model.getList();
        var that=this;
        var ulStr='';
        $(list).each(function(i,item){
            ulStr+=that.liFun(item);
        });
        this.$ul.html(ulStr);
    }
});
return Me;