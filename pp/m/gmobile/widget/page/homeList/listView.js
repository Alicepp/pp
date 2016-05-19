var base=require('common:widget/ui/base/base.js');
var View=base.Class(function($el){
    this.$el=$el;
    this.$loadImg=$('.load-img');
    this.lazyload();
},base.event).extend({
    bindModel:function(model){
        model.addEventListeners({
            "change.url" : function(e){
                this.$loadImg.show();
                this.isLoading=true;
                var type=model.get('sellType');
                model.getGoodsListHtml(this.updataView.bind(this,model.get('page')));
            },
            "change.sellType" : function(e){
                var type=model.get('sellType');
                $('.bar-nav>ul>li').removeClass('selected');
                $('.nav-item-'+type).addClass('selected');

            }
        }, this);
    },
    bindCtr:function(ctr){
        var that=this;
        $(window).scroll(function(){
            if(!that.isLoading&&!that.$el.find('.noMoreResult').length){
                ctr.scrollHander();
            }
        })

    },
    lazyload:function(){
        $('.gooditem img').lazyLoad({
            topCls:'.gooditem',
            beforeBind:function(){
                this.$el.parents('.gooditem').css('opacity',1);
            },
            loadHandler:function(){
                this.$el.parents('.gooditem').css('opacity',1);
            }
        });
    },
    updataView:function(page,htmlData){
        this.$loadImg.hide();
        if(page==1){
            this.$el.html('');
        }
        this.$el.append(htmlData);
        this.isLoading=false;
        this.lazyload();

    }
});
return View;


