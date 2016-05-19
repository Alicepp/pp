/**
 * Created by xiaochao on 2015/12/14.
 */

var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var log=base.log;
var app=require('../app.js');
var baseView=require('../view.js');
var tplStr=__inline('./info.html');
tplStr=tplStr.replace('\r\n','');
var tplFun=utils.tplEngine(tplStr);
var touchCls='btn-touch';
var View=base.Class(function(){
    baseView.apply(this, arguments);
},baseView).extend({
    init:function(opts){
        opts=opts||{};
        this.model=opts.model;
        this.$form=this.$el.find('.detail-form');
        this.bindEvent();

    },
    bindEvent:function(){
        var that=this;
        var startX=0,moveX=0,diffX= 0,diffL=0;
        this.model.addEventListener('model.change',this.updata,this);
        this.$el.on('touchstart',function(e){
            var listKey=$(e.target).attr('listKey');
            if(listKey){
                startX=e.touches[0].pageX;
                that.isStartMore=true;
                that.listKey=listKey;
                var $slideBtn=$(this).find('.btn-item[listKey='+that.listKey+']');
                $slideBtn.addClass(touchCls);
                e.preventDefault();
            }

        });
        this.$el.on('touchmove',function(e){
            if(!that.isStartMore||!that.listKey)return ;
            var $slideBtn=$(this).find('.btn-item[listKey='+that.listKey+']');
            if(!$slideBtn.length)return;
            var pagex=e.touches[0].pageX;
            var offsetL=$slideBtn.offset().left+25;
            var listKey=that.listKey;
            var isLastPay=(listKey=='longRatio');
            diffX=pagex-startX;
            diffL=pagex-offsetL;
            console.log('touchmove',that.listKey,diffX,diffL);
            if(Math.abs(diffX)<5||Math.abs(diffL)<20)return ;
            startX=e.touches[0].pageX;
            if(diffX>0&&diffL>0){
               isLastPay?that.model.prev(listKey):that.model.next(listKey);
            }else if(diffX<0&&diffL<0){
               isLastPay?that.model.next(listKey):that.model.prev(listKey);
            }
        });
        this.$el.on('touchend',function(e){
            that.isStartMore=false;
            that.listKey=null;
            that.$el.find('.btn-item').removeClass(touchCls);
        });
        this.$el.find('.btn-submit').click(function(){
          //  if(that.isSubmiting)return;
           // that.isSubmiting=true;
            that.$form[0].submit();
        });
    },
    updataBar:function(data){
        var that=this;
        var payList=['firstpay','loanpay','lastpay','stagEnum'];
        var perList=['firstpercent','lastpercent','stagEnumpercent'];
        for(var i=0;i<payList.length;i++){
            this.$el.find('.'+payList[i]).html(data[payList[i]]||'');
        }
        for(var j=0;j<payList.length;j++){
            this.$el.find('.'+perList[j]).css('width',(data[perList[j]]||'0')+'%');
        }
        if(data.lastpercent>0){
            this.$el.find('.hasLastPay').show();
            this.$el.find('.noLastPay').hide();

        }else{
            this.$el.find('.hasLastPay').hide();
            this.$el.find('.noLastPay').show();
        }
    },
    updata:function(e){
        var data= e.data;
        this.updataBar(data);
        this.$el.find('.detail-info').html(tplFun(data));
        this.$el.find('input[name="firstPay"]').val(data.firstPaySign);
        this.$el.find('input[name="loanRatio"]').val(data.lastsmall);
        this.$el.find('input[name="stag"]').val(data.stagEnumSign);
    }

});
return View;