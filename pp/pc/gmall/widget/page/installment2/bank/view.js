var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var View=base.Class(function(opts){
    opts=opts||{};
    this.model=opts.model;
    this.$el=opts.$el;
    this.TPL_CARPRICE=[
        '<div class="car-price select-none car-price-top">',
        '<span class="car-qian">首付金额<%this.firstpay%></span>',
        '<span class="car-qian">贷款金额<%this.loanpay%></span>',
        '<span class="car-qian" style="<%if(this.lastpercent<=0){%>display: none<%}%>">尾款金额<%this.lastpay%></span>',
        '</div>',
        '<div class="car-price select-none">',
        '<div class="car-lit select-none">车价</div>',
        '<div class="car-tiao">',
        '<div class="car-payment" style="width:<%this.firstpercent%>%">' ,
        '<div listkey="firstPay" class="pion-btn car-poin"></div>' ,
        '</div>' ,
        '<div class="car-credit">' ,
        '</div>' ,
        '<div class="car-lastpay" style="<%if(this.lastpercent<=0){%>display:none;<%}%> width:<%this.lastpercent%>%">' ,
        '<div listkey="longRatio" class="pion-btn car-poin2 "></div>' ,
        '</div>',
        '</div>',
        '<div class="car-num"><em><%this.carPrice%></em></div>',
        '</div>',
        '<div class="car-price select-none">',
        '<div class="car-lit">期数</div>',
        '<div class="car-qi-tiao bar-qishu">',
        '<div class="car-payment" style="width:<%(this.stagEnum/60)*100%>%">',
        '<div listkey="stagEnum" class="car-poin pion-btn ">',
        '<span><%this.stagEnum%>期</span>',
        '</div>',
        '</div>',
        '</div>',
        '<div class="car-num"><em>共60期</em></div>',
        '</div>',
        '<div class="staging-info clearfix">',
        '<div class="width278">月供：<%this.monthpay%>元</div>',
        '<div>相当于日供：<%this.daypay%>元</div>',
      //  '<div>总利息：<%this.totalInter%>元</div>',
        '<div class="width278">年利率：<%this.ratepercent%>% <span style="<%if(!this.endtime){%>display:none;<%}%>">(<%this.endtime%>截止）</span></div>',
        '<div class="shouxu" style="<%if(this.procedureVal<0.01){%>display:none;<%}%>">手续费：<%this.procedureTxt%></div>',
        // '<div style="<%if(this.procedureVal<0.01){%>display:none;<%}%>">总成本：<%this.totalCosts%>元</div>',
        '</div>',
        '<div class="count-box">',
        //'<div class="shouxu" style="<%if(this.procedureVal<0.01){%>display:none;<%}%>">手续费：<%this.procedureTxt%></div>',
        '</div>'
    ].join('');

    this.tplFun_CarPrice=utils.tplEngine(this.TPL_CARPRICE);

},base.event).extend({
    init:function(){
        this.mask = this.$el.find('.install-fuceng');//弹层
        this.maskClose = this.$el.find('.install-close');
        this.pionFirst = this.$el.find('.pion-first');
        this.zhichi=this.$el.find('.install-zhichi');
        this.bindEvent();
        this.defaultCity();

    },
    bindEvent:function(){
        var startX=0,moveX=0,diffX= 0,diffL=0;
        var that=this;
        this.$el.find('.staging-img').click(function(){
            that.lookBankRule($(this));
        });
        this.maskClose.click(function(){
            that.masklookClose($(this));
        });
        this.$el.on('mousedown','.pion-btn',function(e){
            startX=e.pageX;
            that.isMouseDown=true;
            that.listKey=$(this).attr('listKey');
        });

        this.$el.on('mousemove','.car-price',function(e){
            if(!that.isMouseDown||!that.listKey)return;
            var $slideBtn=$(this).find('.pion-btn[listKey='+that.listKey+']');
            if(!$slideBtn.length)return;
            var pagex=e.pageX;
            var offsetL=$slideBtn.offset().left+10;
            var listKey=that.listKey;
            var isLastPay=(listKey=='longRatio');
           // that.moveTimer&&clearTimeout(that.moveTimer);
          //  that.moveTimer=setTimeout(function(){
                diffX=pagex-startX;
                diffL=pagex-offsetL;
                if(Math.abs(diffX)<5||Math.abs(diffL)<30)return;
                startX=e.pageX;
                if(diffX>0&&diffL>0){
                    isLastPay?that.model.prev(listKey):that.model.next(listKey);
                }else if(diffX<0&&diffL<0){
                    isLastPay?that.model.next(listKey):that.model.prev(listKey);
                }
           // },10);
            //console.log('mouseMove');


        });
        this.$el.on('dragstart',function(){
            return false;
        })
        this.$el.on('mouseup',function(e){
            that.isMouseDown=false;
            that.listKey=null;
        });
        this.model.addEventListener('model.change',this.updata,this);
        this.$el.find('.que-btn').click(function(){
            that.$el.submit();
        });
        this.zhichi.on('change',function(){
            that.defaultCity();
        })


    },
    updata:function(e){
        var data= e.data;
        //console.log(data);
        this.$el.find('.bar-carPice').html(this.tplFun_CarPrice(data));
        this.$el.find('input[name="firstPay"]').val(data.firstPaySign);
        this.$el.find('input[name="loanRatio"]').val(data.lastsmall);
        this.$el.find('input[name="stag"]').val(data.stagEnumSign);

    },
    lookBankRule:function(){
        this.mask.show();
        this.mask.find('.install-fcyin').show();
    },
    masklookClose:function(){
        this.mask.hide();
    },
    defaultCity:function(){
        var zhiChi=this.$el.find('.install-zhichi');
        var provinceStrid = zhiChi.val();
        var bankid=this.$el.attr('bankid');
        var that=this;
        $.ajax({
            url:'/ajax/installment/city/'+bankid+'/'+provinceStrid,
            type: 'post',
            success: function(json) {
                var len=json.data.length,
                    data=json.data,
                    htmlStr='';
                for(var i=0; i<len; i++){
                    htmlStr+='<span>'+data[i].cityName+'</span>';
                }
                that.$el.find('.install-cheng').html(htmlStr);
                //$('#city').html(htmlStr);
            }
        });
    }
})
return View;
