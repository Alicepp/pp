
var $win=$(window);
var $detailTab = $('#detail-tab'),
    $detailPosTab=$('.detail-tab-wrap'),
    $detailClass=$('.pcContent .detail-class'),
    $tabLi=$detailTab.find('li'),
    $posTabLi=$detailPosTab.find('li'),
    $detailPlist=$('.detail-plist .pitem'),
    $li=$('.detail-tab,.detail-pos-tab').find('li'),
    offTop=$detailTab.offset().top;
var remindPop=require('gmall:widget/remindpop/remindpop.js');
var log=require('common:widget/ui/base/log.js');
var utils=require('common:widget/ui/base/utils.js');
var info=require('./info/info.js');
var cacheModel=require('./cacheModel.js');
var discuss=require('./discuss.js');
var ms=require('ms/ms.js');
var $qiangBtn=$('.qiangBtn');
var $carForm=$('.car-form');
var $remindBtn=$('.btn-remind');
var disableCls='disableCls';

var $companyName=$('#company-name');

var app={
    init:function(){
        var that=this;
        this.bindEvent();
        this.isAutoScroll=true;
        this.getRemindState(this.updataRemind.bind(this));
        remindPop.callbackFn=this.updataRemind.bind(this);
        info.init();
        discuss.init();
        ms.init();
        this.initSubmit();
    },

    initSubmit:function(){
        var that=this;
        if(cacheModel.get('submit')=='1'){
            cacheModel.del('submit');
            that.prevSubmit();
            utils.checkIfLogin(that.submit.bind(that),function(){});
        }
    },
    noLoginFun:function(el){
        if(!$(el).hasClass('fenqiBtn')&&this.color&&this.pId){
            cacheModel.set('submit','1');
        }
        location.href = utils.getLoginUrl();
    },
    bindEvent:function(){
        var that=this;
        $li.click(function(){
            that.switchTo($(this));
        });
        $win.scroll(function() {
            that.upadataFix(that.isMoving);
        });
        $qiangBtn.click(function(){
            that.prevSubmit();
            //if(goods_type==8||goods_type==9) {
            //    ga('send','event','gmall','ljbaoming1','{%$carInfo.id%});
            //}else if(goods_type==5||goods_type==6||goods_type==7){
            //
            //}
            utils.checkIfLogin(that.submit.bind(that,this),that.noLoginFun.bind(that,this));
        });
        $remindBtn.click(function(){
            if($(this).hasClass(disableCls))return;
            that.getRemindState(function(json){
                if (json.data == 9999) {//未登录
                    location.href = emao.loginUrl;
                    return;
                }else if(json.data == 0){
                    that.updataRemind(json);
                    return;
                }else{
                    remindPop.show();
                }
            });
        });
        $('.limited-sale').find('img').on('load',function(){
            utils.zoomImg(this);
        });

        $('.limited-sale').find('img[loadsrc]').each(function(){
            var src=$(this).attr('loadsrc');
            if(!src)return;
            $(this).attr('src',src);
            $(this).removeAttr('loadsrc');
        });
        $('.shop-box').hover(function(){
            $(this).addClass('shop-open');
        },function(){
            $(this).removeClass('shop-open');
        });


    },
    switchTo:function($el){
        var index=$el.index();
        $li.removeClass('active');
        $tabLi.eq(index).addClass('active');
        $posTabLi.eq(index).addClass('active');
        $detailPlist.eq(index).show().siblings().hide();
        this.isAutoScroll=false;
        if($detailPlist.eq(index).hasClass('discuss')){
            discuss.show();
        }
    },
    getRemindState:function(callback){
        var url=window.URL.home+'?c=common/sms&a=getsmsApi';
        $.get(url,{'goodsId':emao.carInfo.id}).then(function(data) {
            var json = data;
            if(typeof json === 'string'){
                try{
                    json = $.parseJSON(json);
                }catch(e){
                    return;
                }
            }
            callback&&callback(json);
        })
    },
    updataRemind:function(json){
        if (json.data == 0) {
            $remindBtn.addClass(disableCls).html('已设置提醒');
        };
    },
    getColor:function(){
        return $('.choose-color').find('.selected').attr('data-id');

    },
    getColorNum:function(){
        return $('.dl-number dd').attr('num')-0;
    },
    getPid:function(){
        return $('.shop-address #dealerid').val();
    },
    getGtype:function(){
        return $("input[name='depositId']:checked").val();
    },
    prevSubmit:function(){
        this.color=this.getColor();
        this.colorNum=this.getColorNum();
        this.pId=this.getPid();
        cacheModel.set('color',this.color);
        cacheModel.set('pId',this.pId);
        cacheModel.set('depositId',this.getGtype());

    },
    fenqiSubmit:function(){
        var pId=this.pId;
        var color=this.color;
        var partsid=$(".car-form input[name='partsid']").val();
        var autoId=$('#autoId').val();
        var depositId=this.getGtype();
        var dealerid=this.pId;
        $("input[name='pId']").val(pId);
        $("input[name='color']").val(color);
        $("input[name='depositId']").val(depositId);
        $("input[name='dealerid']").val(dealerid);
        partsid&&$("input[name='partsid']").val(partsid);
        autoId&&$("input[name='autoId']").val(autoId);
        $('.fenqiForm').submit();
    },
    submit:function(el){
        var that=this;
       if(this.submiting)return;
        var color=this.color;
        var pId=this.pId;
        var colorNum=this.colorNum;
        var tpl=emao.carInfo.__lastCategory.tpl;
        if(tpl!=='3'&&tpl!=='7'&&tpl!=='8'&&tpl!=='9'&&!color){
            alert('请选择颜色');
            return;
        }
        if(!colorNum&&tpl!=='8'&&tpl!=='9'){
            alert(tpl=='3'?'所选套餐已售罄':'此颜色已售罄，请选择其他颜色');
            return;
        }
        $carForm.find('input[name="color"]').val(color);
        this.submiting=true;
        //log.ga1();
        if($(el).hasClass('fenqiBtn')){
            this.fenqiSubmit();
            return
        }
        $carForm.submit();
    },
    updataLi:function(index){
        $li.removeClass('active');
        $tabLi.eq(index).addClass('active');
        $posTabLi.eq(index).addClass('active');
    },
    upadataFix:function(stop){
        if(stop)return;
        var that=this;
        var t = $win.scrollTop();
        if(t<offTop){
            $detailPosTab.fadeOut(200);
        }else if(t>offTop){
            $detailPosTab.fadeIn(200);
        }
        if(!this.isAutoScroll){
            this.isAutoScroll=true;
        }
    }

};
return app;
