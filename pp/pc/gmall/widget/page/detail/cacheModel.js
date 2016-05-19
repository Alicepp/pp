var model={
    _data:{},
    key:'carInfo',
    init:function(){
        this.initData();
        if(this.get('goodsId')!=emao.carInfo.id){
          this.clear();
        };
        this.set('goodsId',emao.carInfo.id);
    },
    initData:function(){
        var jsonStr= $.cookie(this.key)||'{}';
        this._data= $.json.parse(jsonStr);

    },
    setData:function(){
        $.cookie(this.key, $.json.stringify(this._data) , { path: '/'});
    },
    clear:function(){
      var list=['color','pId','depositId','submit'];
        for(var i= 0;i<list.length;i++){
            this.del(list[i]);
        }
    },
    set:function(COOKIE_NAME,val){
        this._data[COOKIE_NAME]=val;
        this.setData();
        return this;
    },
    get:function(COOKIE_NAME){
        return this._data[COOKIE_NAME];
    },
    del:function(COOKIE_NAME){
        delete this._data[COOKIE_NAME];
        this.setData();
        return this;
    }
};
model.init();
return model;