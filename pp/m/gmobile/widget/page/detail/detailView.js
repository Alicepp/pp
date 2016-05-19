/**
 * @require select/selectView.js
 * @require info/selectDealerView.js
 * @require select/mapView.js
 * @require select/fittingView.js
 * @require select/reminedView.js
 */
var gId=emao.carInfo.id;
var formhash=emao.carInfo.formhash;
var base=require('common:widget/ui/base/base.js');
var endDown=require('common:widget/ui/plugin/countdown.js');
var app=require('./app.js');
var baseView=require('./view.js');

var utils=base.utils;
var log=base.log;
var $qiangBtn=$('.btn-qiang');
var $fenqiBtn=$('.btn-fenqi');
var $carForm=$('.car-form');
var $fenqiForm=$('.fenqiForm');
var $remindBtn=$('.btn-remind');
var disableCls='disableCls';
var islider=require('common:widget/ui/plugin/islider.js');
var discuss=require('./discuss.js');
var ms=require('./ms/ms.js');
var View=base.Class(function(){
    this.pageCls='page-detailMain';
    baseView.apply(this, arguments);
},baseView).extend({
    init:function(opts){
        opts=opts||{};
        this.imgSrc=opts.imgSrc||'';
        this.$color=this.$el.find('.choose-color');
        this.$auto=this.$el.find('.choose-auto');
        this.$deposit=this.$el.find('.choose-deposit');
        this.$parts=this.$el.find('.choose-parts');
        this.$point=this.$el.find('.choose-point');
        this.$attention=this.$el.find('.att-btn');
        this.$tab=$('.leftnav');
        this.$navul=this.$tab.find('ul');
        this.$tabLi=$('#detail-tab li');
        this.$detailPlist=$('.detail-plist .pitem');
        this.$li=$('.detail-tab').find('li');
        this.$win=$(window);
        this.initShareBtn();
        this.initRemindBtn();
        this.initAttentionBtn();
        this.toPage(this.pageCls);
        this.updataNumTxt();
        this.bindEvent();
        this.slide(opts.ads);
        discuss.init();
        ms.init();
        this.initTuanInfo();
        BizQQWPA&&BizQQWPA.addCustom({aty: '0', a: '0', nameAccount: 4008903881, selector: $('.ask-online')[0].id});
    },
    bindEvent:function(){
        var that=this;
        this.$tabLi.on('click',function(){
            that.switchNav($(this));
        });
        this.$el.on('click','.car-summary dl,.insert-but',function(){
            that.toPage($(this).attr('pageCls'));
        });
        this.$el.on('click','.btn-remind',function(){
            var $item=$(this);
            utils.checkIfLogin(function(){
                that.toPage($item.attr('pageCls'));
            },that.noLoginFun.bind(that));
        });
        this.$el.find('.car-summary dl').swipeRight(function(){
            that.toPage($(this).attr('pageCls'));
        });
        app.addEventListener('goodsAuto.change',this.updataGoodsAuto,this);
        app.addEventListener('colors.change',this.updataColor,this);
        app.addEventListener('deposit.change',this.updataDeposit,this);
        app.addEventListener('points.change',this.updataPoint,this);
        app.addEventListener('remined.change',this.updataRemined,this);
        app.addEventListener('parts.change',this.updataParts,this);
        this.$el.find('.share-btn').click(function(){
            that.$el.find('.share-wrap').toggleClass('height0');
            return false;
        });
        $('body').click(function(e){
            if($(e.target).parents('.share-wrap').length)return;
            that.$el.find('.share-wrap').addClass('height0');
        });
        this.$el.on('click','.attention',function(){
            var $el=$(this);
            if(that.doing||$(this).hasClass('attentioned'))return;
            that.doing=true;
            $.ajax({
                url: window.URL.pcHome+"?c=common/following&a=dofollowing",
                data:{'gId':gId,formhash:formhash},
                dataType:'jsonp',
                beforeSend: function(xhr) {
                }
            }).then(function(data){
                //console.log(data);
                that.doing=false;
                if(data.code==9999){
                    location.href=utils.getLoginUrl();
                    return;
                }
                that.updataAttentionBtn(data);
            });
        });
        this.$el.on('click','.attentioned',function(){
            var $el=$(this);
            if(that.doing||$(this).hasClass('attention'))return;
            that.doing=true;
            $.ajax({
                url: window.URL.pcHome+"?c=common/following&a=undoFollowing",
                data:{'gId':gId,formhash:formhash},
                dataType:'jsonp'
            }).then(function(data){
                //console.log(data);
                that.doing=false;
                if(data.code==9999){
                    location.href=utils.getLoginUrl();
                    return;
                }
                that.updataUnAttentionBtn(data);
            });
        });
        $('.down-time').endDown(function(){
            this.$el.parents('.info-time').html('已结束');
        });
        $qiangBtn.click(function(){
            that.prevSubmit();
            utils.checkIfLogin(that.submit.bind(that),that.noLoginFun.bind(that));
        });
        $fenqiBtn.click(function(){
            that.prevSubmit();
            utils.checkIfLogin(that.fenqiSubmit.bind(that),that.noLoginFun.bind(that));
        });
        this.$win.scroll(function(){
            that.updataFix();
        });
        $('#autoId').on("change",function(){


        })


    },

    switchNav:function($el){
        var index=$el.index();
        this.$tabLi.removeClass('selected');
        this.$tabLi.eq(index).addClass('selected');
        this.$detailPlist.eq(index).show().siblings().hide();
        this.isAutoScroll=false;

        if(this.$detailPlist.eq(index).hasClass('discuss')){
            discuss.show();
        }
    },
    updataFix:function(){
        var top=this.$win.scrollTop();
        this.offsetTop=this.$tab.offset().top;
        top>=this.offsetTop?this.$navul.addClass('fixed'):this.$navul.removeClass('fixed');
    },
    updataInitPage:function(){

    },
    noLoginFun:function(){
        location.href = utils.getLoginUrl();
    },
    getColor:function(){
        return $('.choose-color .color-box').attr('data-id');

    },
    getPid:function(){
        return $('#dealerid').val();
    },
    getGtype:function(){
        return $('.choose-deposit .pay-box').attr('data-id');

    },
    getAutoId:function(){
        return $('.choose-auto').attr('data-id');
    },
    getPartsNum:function(ids){
        ids=ids||this.partsid;
        emao.matrix=emao.matrix||{};
        emao.matrix[ids]=emao.matrix[ids]||{num:0};
       return emao.matrix[ids].num-0;
    },
    getPartsPrice:function(ids){
        ids=ids||this.partsid;
        emao.matrix=emao.matrix||{};
        emao.matrix[ids]=emao.matrix[ids]||{price:0};
        return emao.matrix[ids].price||0;
    },
    getPartsid:function(){
      return this.$parts.attr('data-id');
    },
    prevSubmit:function(){
        this.pId=this.getPid();
        this.depositId=this.getGtype();
        this.autoId=this.getAutoId();
        if(emao.tpl=='3'||emao.tpl=='7'){
            this.partsid=this.getPartsid();
            this.partsNum=this.getPartsNum();
        }else{
            this.color=this.getColor();
            this.colorObj=app.colors.getData(this.color)||{};
            this.colorNum=this.colorObj.number||0;
        }
        //cacheModel.set('color',this.color);
        //cacheModel.set('pId',this.pId);
        //cacheModel.set('depositId',this.getGtype());
    },
    submit:function(){
        var that=this;
        if(this.submiting)return;
        var color=this.color;
        var pId=this.pId;
        var depositId=this.depositId;
        var colorNum=this.colorNum;
        var partsid=this.partsid;
        var partsNum=this.partsNum;
        var autoId=this.autoId;
        if(emao.tpl=='3'||emao.tpl=='7'){
            if(!partsNum){
                $.alert('该配件已售罄，请选择其他配件');
                return;
            }
        }else{
            if(emao.tpl!='8'&&emao.tpl!='9') {
                if (!color) {
                    $.alert('请选择颜色');
                    return;
                }
                if (!colorNum) {
                    $.alert('该颜色已售罄，请选择其他颜色');
                    return;
                }
            }
        }

        if(!pId){
            $.alert('请选择提车点');
            return;
        }
        if(emao.tpl!='2'&&emao.tpl!='6'&&emao.tpl!='8'&&emao.tpl!='9'&&!depositId){
            $.alert('请选择付款方式');
            return;
        }
        //log.ga1();
        $carForm.find('input[name="color"]').val(color);
        $carForm.find('input[name="autoId"]').val(autoId);
        $carForm.find('input[name="pId"]').val(pId);
        $carForm.find('input[name="depositId"]').val(depositId);
        $carForm.find('input[name="partsid"]').val(partsid);
        this.submiting=true;
        $carForm[0].submit();
    },
    fenqiSubmit:function(){
        var that=this;
        if(this.submiting)return;
        var color=this.color;
        var pId=this.pId;
        var depositId=this.depositId;
        var colorNum=this.colorNum;
        var partsid=this.partsid;
        var partsNum=this.partsNum;
        var autoId=this.autoId;
        if(emao.tpl=='3'||emao.tpl=='7'){
            if(!partsNum){
                $.alert('该配件已售罄，请选择其他配件');
                return;
            }
        }else{
            if(emao.tpl!='8'&&emao.tpl!='9'){
                if(!color){
                    $.alert('请选择颜色');
                    return;
                }
                if(!colorNum){
                    $.alert('该颜色已售罄，请选择其他颜色');
                    return;
                }
            }
        }

        if(!pId){
            $.alert('请选择提车点');
            return;
        }
        if(emao.tpl!='2'&&emao.tpl!='6'&&emao.tpl!='8'&&emao.tpl!='9'&&!depositId){
            $.alert('请选择付款方式');
            return;
        }
        //log.ga1();
        $fenqiForm.find('input[name="color"]').val(color||'');
        $fenqiForm.find('input[name="autoId"]').val(autoId||'');
        $fenqiForm.find('input[name="pId"]').val(pId||'');
        $fenqiForm.find('input[name="depositId"]').val(depositId||'');
        $fenqiForm.find('input[name="dealerid"]').val(pId||'');
        $fenqiForm.find('input[name="partsid"]').val(partsid||'');
        $fenqiForm[0].submit();
    },
    initShareBtn:function(){
        window._bd_share_config = {
            "common": {
                "bdSnsKey": {},
                "bdText": document.title,
                "bdMini": "2",
                "bdPic": this.imgSrc,
                "bdStyle": "0",
                "bdSize": "16"
            }, "share": {}
        };
        with (document)0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
    },
    initRemindBtn:function(){
        this.getRemindState(this.remindCallBack.bind(this));
    },
    getRemindState:function(callback){
        var url=window.URL.home+'?c=sms&a=getsmsApi';
        $.get(url,{'goodsId':gId}).then(function(data) {
            var json = data;
            if(typeof json === 'string'){
                try{
                    json = $.parseJSON(json);
                }catch(e){
                    return;
                }
            }
            //console.log(json);
            callback&&callback(json);
        })
    },
    remindCallBack:function(json){
        if (json.data == 0) {
            this.dispatchEvent('change.remined',{'remined':1})
        };
    },
    updataRemined:function(e){
        if(!e.remined)return;
        this.$el.find('.btn-remind').removeAttr('pageCls').html('已提醒');
    },
    initAttentionBtn:function(){
        $.ajax({
            url: window.URL.pcHome+"?c=common/following&a=getstate",
            data:{'gId':gId,formhash:formhash},
            dataType:'jsonp',
            beforeSend: function(xhr) {
            }
        }).then(this.updataAttentionBtn.bind(this));
    },
    updataAttentionBtn:function(data){
        if(data.code==0){
            this.$attention.removeClass('attention');
            this.$attention.addClass('attentioned').text('取消关注');
        }else{
            this.$attention.removeClass('attentioned');
            this.$attention.addClass('attention').text('关注');
        }
    },
    updataUnAttentionBtn:function(data){
        if(data.code==0){
            this.$attention.removeClass('attentioned');
            this.$attention.addClass('attention').text('关注');
        }else{
            this.$attention.removeClass('attention');
            this.$attention.addClass('attentioned').text('取消关注');
        }
    },
    updataGoodsAuto:function(e){
        var that=this;
        var list= e.list;
        var id=list.selectId;
        var data=list.getSelectedData();
        this.$auto.html(data.selectText).attr('data-id',id);
        $(emao.goodsAuto).each(function(i,item){
            if(item[0].autoId==id){
                that.dispatchEvent('change.list',{'listKey':'colors',list:item,'id':item[0].color});
            }
        });
        $.ajax({
            url:'/ajax/auto/param/',
            data:{
                id:id
            },
            success:function(data){
                $('.autoParamList').html(data);
            }
        })
    },
    updataPoint:function(e){
        var list= e.list;
        var data=list.getSelectedData();
    },
    updataParts:function(e){
        this.$parts.attr('data-id',e.id);
        this.partsid=this.getPartsid();

        this.updataPrice({price:this.getPartsPrice()});
    },
    updataNumTxt:function(){
        this.partsid=this.getPartsid();
        this.partsNum=this.getPartsNum();
        $('.partsNumdd').html(this.partsNum>0?'还剩'+this.partsNum+'辆':'售罄');
    },
    updataDeposit:function(e){
        var list= e.list;

        var data=list.getSelectedData();
        this.$deposit.html(data.selectText);
    },
    updataPrice:function(data){
        $('.emaoprice strong').html(utils.fprice(data.price,0));
        $('.emaoprice em').html(utils.fprice(data.price,1));
        $('.fullprice').html(''+utils.fprice(data.price));
        if(data.guidePrice){
            $('.guidePrice').html(data.guidePrice);

        }
        this.updataTuanInfo({},data.price)
    },
    updataTuanInfo:function(data,emaoprice){
        data=data||{};
        var $priceDiscount=$('.priceDiscount'),$priceAdd=$('.priceAdd');
        if(emaoprice){
            $priceDiscount.attr('price',emaoprice);
        }
        if(data.__emaodiscount){
            $priceDiscount.attr('discount',data.__emaodiscount);
        }
        if(data.__coupdiscount){
            $priceAdd.attr('add',data.__coupdiscount);
        }
        $priceDiscount.each(function(){
            var discount=$(this).attr('discount')||0;
            var price=$(this).attr('price')||0;
            discount=discount-0;
            price=price-0;
            $(this).html(utils.fprice(price-discount));
        });
        $priceAdd.each(function(){
            var add=$(this).attr('add')||0;
            var price=$(this).attr('price')||0;
            add=add-0;
            price=price-0;
            $(this).html(price+add);
        });
    },
    updataColor:function(e){
        var list= e.list;
        var data=list.getSelectedData();
        var html='';
        var numTpl=data.number>0?'还剩'+data.number+'辆':'售罄';
        if(data.number>0&&emao.carInfo.stockType==2){
            numTpl=data.number>10?'现车充足':'少量现车';
        }
        html+='<span class="color-box color'+data.color+'" data-id="'+data.color+'"></span>';
        html+='<span class="car-amount">'+data.colorName+'&nbsp;'+numTpl+'</span>';
        this.$color.html(html);
        this.updataPrice(data);
/*        if(emao.carInfo&&emao.carInfo.__saleState==2){
            data.number=data.number-0;
            $('.ul-submit').removeClass('goods-type-2 goods-type-3')
                .addClass('goods-type-'+(data.number?2:3));
        }*/
    },
    slide:function(list){
        //	轮播图数据
        /*var list = [
         {
         url: "http://www.emao.com",
         content: "../imgs/temp/banner.jpg"
         }, {
         url: "http://www.emao.com",
         content: "../imgs/temp/banner.jpg"
         }, {
         url: "http://www.emao.com",
         content: "http://192.168.20.164:8021/emao/branches/dev/mall/web/j/images/public/pic-big.jpg"
         }, {
         url: "http://www.emao.com",
         content: "../imgs/temp/banner.jpg"
         }, {
         url: "http://www.emao.com",
         content: "../imgs/temp/banner.jpg"
         }
         ];*/
        //	焦点图
        //debugger;
        var dom=document.getElementById("js_focusPic");
        $(dom).height($(window).width()*400/750);
        var opts = {
            type: 'pic',
            data: list,
            dom: dom,
            isLooping: true,
            duration: 5000,
            fixPage: false
        };
        var	islider = new iSlider(opts);
        islider.addDot();

        //判断手机横竖屏
        function judgeScreen(){
            $(dom).height($(window).width()*400/750);
            if(window.orientation==180||window.orientation==0){
                $('#js_focusPic').empty();
                $('.islider-dot-wrap').remove();
                var	islider = new iSlider(opts);
                islider.addDot();
            }
            if(window.orientation==90||window.orientation==-90){
                $('#js_focusPic').empty();
                $('.islider-dot-wrap').remove();
                var	islider = new iSlider(opts);
                islider.addDot();
            }
        }
        window.addEventListener("onorientationchange" in window ? "orientationchange" : "resize", judgeScreen, false);
    },

    swipeLeftHandler:function(){

    },
    upDataPerson:function(data) {
        var Hasperson = $('.tuan-over em');
        var $tuanOver = $('.tuan-over');
        var progressBar = $('.progress-hui .progress-bar');
        var percentRed=data.groupNum/data.maxGroupnum*100;
        Hasperson.text(data.groupNum);
        $tuanOver.css('left',percentRed+'%');
        progressBar.css("width",percentRed+'%');

    },
    initTuanInfo:function(){
        var that=this;
        var $progressBox=$('.progress-box');
        $.ajax({
            url:'/?c=goods&a=gettuan',
            data:{id:emao.carInfo.id},
            success:function(data){
               data.data&&that.updataTuanInfo(data.data);
                data.data&&that.upDataPerson(data.data);
                if(data.data&&data.data.__isTuan){
                    //$progressBox.addClass('tuan-succes');
                }
            }
        })
    }



});
return View;