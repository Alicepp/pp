var base=require('common:widget/ui/base/base.js');
var View=require('./view.js');
var app=require('./wish.js');
var Me = base.Class(function(opts) {
    View.apply(this, arguments);
}, View).extend({
    init:function(opts){
        opts=opts||{};
        this.liTpl='<li data-id="{{=it.id}}" data-name="{{=it.brandName}}">{{=it.brandName}}<i></i></li>';
        this.liFun=base.template(this.liTpl);
        this.$ul=this.$el.find('.select-list');
        this.$ul.html('');
        this.url='?c=index&a=ajaxSerie';
        this.dispatchEvent('to.page',{pageCls:this.pageCls});

    },
    nextClickHandler:function(item){
        var topage=$(item).attr('to');
        var that=this;
        $.ajax({
            url:this.url,
            data:{
                brand:this.list.getIdstr()
            }
        }).then(function(json){
            that.dispatchEvent('to.page',{pageCls:topage,data:json.data});
        })
    }
});
return Me;