var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var Model=base.Class(function(data){
    base.Model.apply(this, arguments);
    this.prevURI='/?c=search&a=onlygoods';
    this._data= $.extend({
        'pinyin':window.city.pinyin,
        'page':1,
        'priceSort':''
    },data||emao.searchParam);
    this.urlData= $.extend({},this._data);

}, base.Model).extend({
    set:function(key,value,inner){
        var data;
        if(!key) return this;

        if(key && typeof key === 'object' && !inner) {
            for (var p in key) {
                this.set( p, key[p], true );
            }
            this.dispatchEvent('changed', {data: key});
            this.updataUrlData();
            return this;

        }else{
            key = key + '';
            if( this._data[key] === value ) {
                return ;
            }
            if((typeof this.urlData[key]!==undefined)&&key!='page'){
                this._data['page']=1;
            }
            this._data[key] = value;
            this.dispatchEvent('change', {
                key : key,
                value : value
            });
            this.dispatchEvent('change.' + key, {
                value : value
            });

            if(!inner) {
                data = {};
                data[key] = value;
                this.dispatchEvent('changed', {data: data});
                this.updataUrlData();
            }
        }

        return this;
    },
    updataUrlData:function(){
        var isChange=false;
        for(var k in this.urlData){
            if(this.urlData[k]!=this._data[k]){
                this.urlData[k]=this._data[k];
                isChange=true;
            }
        }
        isChange&&this.dispatchEvent('change.url', {data: this.urlData});
    },
    getGoodsListHtml:function(callback){
        return $.ajax({
            url:this.prevURI,
            data:this.urlData,
            success:function(data){
                callback&&callback(data)
            }
        })
    }
});
return Model;