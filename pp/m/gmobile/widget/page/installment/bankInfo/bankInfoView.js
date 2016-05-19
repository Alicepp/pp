/**
 * Created by xiaochao on 2015/12/14.
 */
var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var log=base.log;
var app=require('../app.js');
var baseView=require('../view.js');
var View=base.Class(function(){
    baseView.apply(this, arguments);
},baseView).extend({
    init:function(opts){
        opts=opts||{};
        this.$citySelect=this.$el.find('.select-city select');
        this.$cityBox=this.$el.find('.city-box');
        this.bindEvent();
        this.updateCity();

    },
    bindEvent:function(){
        var that=this;
        this.$citySelect.change(this.updateCity.bind(this));
    },
    updateCity:function(){
        var that=this,htmlStr='';
        var provinceStrid = this.$citySelect.val();
        var bankId=this.$el.attr('bankId');
        if(provinceStrid=='0'){
            that.$cityBox.html(htmlStr);
            return;
        }
        $.ajax({
            url:'/ajax/installment/city/'+bankId+'/'+provinceStrid,
            type: 'post',
            success: function(json) {
                json=json||{};
                if(json.data){
                    for(var i=0; i<json.data.length; i++){
                        htmlStr+='<span class="city-item">'+json.data[i].cityName+'</span>';
                    }
                }
                that.$cityBox.html(htmlStr);
            }
        });
    }



});
return View;