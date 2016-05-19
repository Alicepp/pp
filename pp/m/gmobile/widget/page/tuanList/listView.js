var base=require('common:widget/ui/base/base.js');
var View=base.Class(function($el){
    this.$el=$el;
    this.$loadImg=$('.load-img');
    this.lazyload();
    var mySwiper = new Swiper('.banner-slide',{
        mode: 'horizontal',
        pagination:'.slide-dot',
        paginationElement: 'li',
        paginationClickable: true,
        autoplay:5000,
     //   autoplayDisableOnInteraction:false,
        loop:true
    })
},base.event).extend({
    bindModel:function(model){
        model.addEventListeners({
            "change.url" : function(e){
                this.$loadImg.show();
                this.isLoading=true;
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
        $('.tuanitem img').lazyLoad({
            topCls:'.tuanitem',
            beforeBind:function(){
                this.$el.parents('.tuanitem').css('opacity',1);
                this.$el.css('opacity',0);
            },
            loadHandler:function(e){
                e.status&&this.$el.css('opacity',1);
                e.status&&this.$el.parents('.item-top').height(this.$el.height());
                e.status&&this.$el.parents('.item-top').css('min-height',this.$el.height());
                this.$el.parents('.tuanitem').css('opacity',1);
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


