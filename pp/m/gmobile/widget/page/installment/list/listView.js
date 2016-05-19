/**
 * Created by xiaochao on 2015/12/14.
 */
var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var log=base.log;
var app=require('../app.js');
var baseView=require('../view.js');
var View=base.Class(function(){
    this.pageCls='page-list';
    baseView.apply(this, arguments);
},baseView).extend({
    init:function(opts){
        opts=opts||{};
        this.bindEvent();

    },
    bindEvent:function(){
        var that=this;


    }



});
return View;