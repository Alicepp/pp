var Class = require("./class.js");
var listModel = Class(function(arr,keyName,currIndex){
    this.push.apply(this,arr||[]);
    this.keyName=keyName||'id';
    this.currIndex=currIndex||0;
    this._data = {};
}, Array).extend({
    next:function(tag){
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
    },
    init:function(){


    },
    getSelectedData:function(){
      return this.getData(this.selectId);
    },
    getSelectedIndex:function(){
        return this.indexOf(this.selectId);
    },
    getData:function(key){
        for(var i=0;i<this.length;i++){
            if(this[i][this.keyName]==key)return this[i];
        }
        return null;
    },
    indexOf:function(key){
        for(var i=0;i<this.length;i++){
            if(this[i][this.keyName]==key)return i;
        }
        return -1;
    },
    getIdstr:function(){
        var list=[];
        var that=this;
        for(var i=0;i<this.length;i++){
            list.push(this[i][that.keyName]);
        }
        return list.join(',');
    },
    empty:function(){
      this.length=0;
      return this;
    },
    each:function(callback){
        for(var i=0;i<this.length;i++){
            callback&&callback.apply(this[i],[i,this[i]]);
        }
    },
    del:function(key){
        if(!key)return;
        var index=this.indexOf(key);
        if(index<0)return;
        this.splice(index,1);
        return this;
    },

    add:function(obj){
        if(!obj||!obj[this.keyName])return;
        var key=obj[this.keyName];
        if(this.indexOf(key)>-1)return;//已经添加
        this.push(obj);
    }

});
return listModel;
