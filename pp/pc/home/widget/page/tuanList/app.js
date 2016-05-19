$.fn.pslide=(function(win){
   function pSlide($el,options){
    var defaults={
        ulSelector:'.slide-ul',
        liSelector:'.slide-li',
        dotUlSelector:'.slide-dot',
        dotLiSelector:'.slide-dot li',
        liSelectCls:'slide-select',
        dotLiSelectCls:'slide-select',
        autoMove:true,
        startTime:4000,
        autoTime:5000,
        fadeInTime:900,
        fadeOutTime:900
    };
    this.$el=$el;
    this.opts= $.extend(defaults,options);
    this.$ul=$el.find(this.opts.ulSelector);
    this.$li=$el.find(this.opts.liSelector);
    this.$dotUl=$el.find(this.opts.dotUlSelector);
    this.$dotLi=$el.find(this.opts.dotLiSelector);
    this.len=this.$li.length;
    this.init();
   }
   var pSlideProto={
      init:function(){
          this.bindEvent();
          this.switchTo(0);
          this.opts.autoMove&&this.startAuto();
          return this;
      },
      bindEvent:function(){
          var that=this;
          this.$dotLi.click(function(){
              that.switchTo($(this).index());
          });
          this.$el.hover(this.stopAuto.bind(this),this.startAuto.bind(this));
          return this;
      },
      switchTo:function(index){
          index=((index||0)+this.len)%this.len;
          this.currIndex=index;
          this.$li.eq(index).fadeIn(this.opts.fadeInTime).addClass(this.opts.liSelectCls)
              .siblings().removeClass(this.opts.liSelectCls).fadeOut((this.opts.fadeOutTime));
          this.$dotLi.eq(index).addClass(this.opts.dotLiSelectCls).siblings().removeClass(this.opts.dotLiSelectCls);
      },
      startAuto:function(time){
          var that=this;
          var callee=arguments.callee;
          this.stopAuto();
          if(!this.opts.autoMove)return;
          this.autoTimer=setTimeout(function(){
              that.switchTo(that.currIndex+1);
              callee.call(that,that.opts.autoTime)
          },time||this.opts.startTime)
      },
      stopAuto:function(){
          this.autoTimer&&clearTimeout(this.autoTimer);
      }



    };

   return function(options){
       pSlide.prototype= $.extend(this,pSlideProto);
       return new pSlide($(this),options);
   }
})(window);



var utils=require("common:widget/ui/base/base.js").utils;



var app={
    init:function(){
        $('.top-banner').pslide({autoMove:true});
        $('.tuanitem img').lazyLoad({
            beforeBind:function(){
                this.$el.css('opacity',0);
            },
            loadHandler:function(e){
                e.status&&utils.zoomImg(this.$el[0]);
                e.status&&this.$el.css('opacity',1);
            }
        });
        this.bindEvent();

    },
    bindEvent:function(){


    }
}
return app;