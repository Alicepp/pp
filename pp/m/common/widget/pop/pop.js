/**
 * Created by xiaochao on 2015/4/29.
 */
function Pop(options){
    var defaults={
        tpl:['<div class="pop">',
            '<div class="pop-box">',
              '<div class="pop-cont borderbox center"></div>',
              '<div class="pop-btns box">',
                '<div class="pop-btn btn-sure flex1" status="1">确定</div>',
               '</div>',
            '</div>',
            '</div>'].join(''),
        id:'pop-'+(new Date).getTime(),
        cls:'',
        callback:function(){}
    };
    this.opts= $.extend(defaults,options);

    this.init();
    this.show();
}
$.extend(Pop.prototype,{
    init:function(){
        if(this.inited)return;
        this.createDOM();
        this.bindEvent();
        this.inited=true;
    },
    createDOM:function(){
        this.$el=$('#'+this.opts.id);
        if(this.$el.length)return;
        this.$el=$(this.opts.tpl);
        this.$close=this.$el.find('.pop-close');
        this.$btn=this.$el.find('.pop-btn');
        this.$remove=this.$el.find('.pop-remove');
        this.$cont=this.$el.find('.pop-cont');
        this.$box=this.$el.find('.pop-box');
        this.$el.attr('id',this.opts.id);
        this.$el.addClass(this.opts.cls);
        this.opts.msg&&this.$cont.html(this.opts.msg);
        this.$el.appendTo('body');
    },
    bindEvent:function(){
        var that=this;
        this.$close.click(this.hide.bind(this));
        this.$remove.click(this.remove.bind(this));
        this.$btn.click(function(){
            var status=$(this).attr('status')-0;
            that.opts.callback(status,that);
            if(!$(this).hasClass('noRemove')){
                that.remove();
            }
        });
        if(this.opts.needPopClose){
            this.$el.click(this.remove.bind(this));
            this.$box.click(function(e){
                e.stopPropagation();
            });
        }





    },
    hide:function(){
        this.$el.hide();
    },
    remove:function(){
        this.$el.remove();
    },
    show:function(){
        this.$el.show();
    }
});
return Pop;