/**
 * @require ./wish2.js
 */
var base=require('common:widget/ui/base/base.js');
var app=require('./app.js');
var baseView=require('./view.js');
var utils=base.utils;

var disableCls='disableCls';
var View=base.Class(function(){
    this.pageCls='page-wish1';
    baseView.apply(this, arguments);
},baseView).extend({
    init:function(){
        this.model=app.model;
        this.toPage(this.pageCls);
        this.liTpl='<li class="box-item"  brandId="{{=it.brandId}}" id="serie-item-{{=it.id}}" data-id="{{=it.id}}">{{=it.serieName}}<i></i></li>';
        this.chexingliTpl='<li class="box-item" brandId="{{=it.brandId}}" serieId="{{=it.serieId}}"  id="car-item-{{=it.id}}" data-id="{{=it.id}}">{{=it.year}}款 {{=it.autoName}}<i></i></li>';
        this.chexingliFun=base.template(this.chexingliTpl);
        this.liFun=base.template(this.liTpl);
        this.$bd=this.$el.find('.wish-bd');
        this.$brand=this.$el.find('.brand-dd .box-item');
        this.$serie=this.$el.find('.wish-serie');
        this.$chexing=this.$el.find('.wish-model');
        this.$xingUp=this.$chexing.find('.arr-up');
        this.$arr=this.$serie.find('.arr-up');
        this.$ul=this.$serie.find('ul');
        this.chexingul=this.$chexing.find('ul');
        this.$footer=this.$el.find('.wish-ft-fixed');
        this.$next=this.$el.find('.next-btn');
        this.$prev=this.$el.find('.prev-btn');
        this.$pageNum=this.$el.find('.page-num');
        this.$ul.html('');
        this.bindEvent();
        this.toMainPage();
    },
    showAction:function(){
        $('body').addClass('body-wish1');
    },
    hideAction:function(){
        $('body').removeClass('body-wish1');
    },
    bindEvent:function(){
        var that=this;
        this.$brand.tap(function(){
            var id=$(this).attr('data-id');
            if($(this).hasClass('open')){
                that.colseSerie();
            }else{
                that.colseSerie();
                that.openBrand(id);
            }
            return false;
        });
        $('body').tap(function(e){
           if($(e.target).parents('.wish-serie,.wish-model').length){
               return;
           }
            that.colseSerie();
        });
        this.$serie.on('tap','.box-item',function(){
            var id=$(this).attr('data-id');
            var brandId=$(this).attr('brandId');
            if($(this).hasClass('open')){
                that.colseChexing();
            }else{
                that.colseChexing();
                that.openSerie(id,brandId);
            }
            return false;
        });
        this.$chexing.on('tap','.box-item',function(){
            var id=$(this).attr('data-id');
            if($(this).hasClass('selected')){
                that.dispatchEvent('list.del',{'id':id});
            }else{
                that.dispatchEvent('list.add',{'id':id});
            }
            return false;
        });
        app.addEventListener('list.change',this.updataList,this);
    },
    updataList:function(e){
        e=e||{};
        var list= e.list||this.model.getList();
        console.log(list);
        this.$brand.removeClass('selected');
        this.$serie.find('.box-item').removeClass('selected');
        this.$chexing.find('.box-item').removeClass('selected');
        for(var i=0;i<list.length;i++){
            $('#brand-item-'+list[i].brandId).addClass('selected');
            $('#serie-item-'+list[i].serieId).addClass('selected');
            $('#car-item-'+list[i].id).addClass('selected');
        }
        if(!list.length){
            this.$footer.addClass('height0');
        }else{
            this.$next.addClass('visible');
            this.$pageNum.html(list.length+'/5');
            this.$footer.removeClass('height0');

        }


    },
    openBrand:function(id){
        var $el=$('#brand-item-'+id);
        this.$brand.removeClass('open');
        $el.addClass('open');
        this.updataSeriePos(id);
        this.model.getSerie(id,this.appendSerie.bind(this));
    },
    openSerie:function(id,brandId){
        var $el=$('#serie-item-'+id);
        $el.addClass('open').siblings().removeClass('open');
        this.updataChexingPos(id);
        this.model.getChexing(id,brandId,this.appendChexing.bind(this));
    },
    updataSeriePos:function(id){
        var $el=$('#brand-item-'+id);
        var w=$el.width(),h=$el.height();
        var elOffset=$el.offset();
        var bdOffset=this.$bd.offset();
        var top=elOffset.top-bdOffset.top+h+10;
        var left=elOffset.left-bdOffset.left+w/2-5;

        this.$serie.css('top',top);
        this.$arr.css('left',left);
    },
    updataChexingPos:function(id){
        var $el=$('#serie-item-'+id);
        var w=$el.width(),h=$el.height();
        var elOffset=$el.offset();
        var bdOffset=this.$bd.offset();
        var top=elOffset.top-bdOffset.top+h+10;
        var left=elOffset.left-bdOffset.left+w/2-5;

        this.$chexing.css('top',top);
        this.$xingUp.css('left',left);
    },
    appendSerie:function(list){
        list=list||[];
        var ulstr='';
        for(var i=0;i<list.length;i++){
            ulstr+=this.liFun(list[i]);
        }
        this.$ul.html(ulstr);
        var h=this.$ul.height();
        this.$serie.removeClass('height0');
        this.$serie.height(h);
        this.updataList();
    },
    appendChexing:function(list){
        list=list||[];
        var ulstr='';
        for(var i=0;i<list.length;i++){
            ulstr+=this.chexingliFun(list[i]);
        }
        this.chexingul.html(ulstr);
        var h=this.chexingul.height();
        this.$chexing.removeClass('height0');
        this.$chexing.height(h);
        this.updataList();
    },
    colseSerie:function(){
        this.$serie.addClass('height0');
        this.$ul.html('');
        this.$brand.removeClass('open');
        this.colseChexing();
    },
    colseChexing:function(){
        this.$chexing.addClass('height0');
        this.chexingul.html('');
        this.$serie.find('.box-item').removeClass('open');
    }


});
return View;