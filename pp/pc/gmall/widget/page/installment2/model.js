//function List(){
//    return new List.prototype.init;
//}
//
//List.prototype=$.extend([],{
//    init:function(){
//        Array.apply(this,arguments);
//        this.aa=22;
//        return this;
//    },
//    next:function(){
//
//       return this.aa;
//    },
//    prev:function(){
//
//    },
//    curr:function(){
//
//    }
//
//});
//List.prototype.init.prototype=List.prototype;
var base=require('common:widget/ui/base/base.js');
var Class = base.Class;
var list = Class(function(arr,currIndex){
    this.push.apply(this,arr||[]);
    this.currIndex=currIndex||0;

}, Array).extend({
    next:function(){
        var index=this.currIndex+1;
        index=Math.min(this.length-1,index);
        index=Math.max(0,index);
        !tag&&(this.currIndex=index);
        return this[index];
    },
    prev:function(tag){
       var index=this.currIndex-1;
        index=Math.min(this.length-1,index);
        index=Math.max(0,index);
        !tag&&(this.currIndex=index);
        return this[index];
    },
    curr:function(){
       return this[this.currIndex];
    }

});
