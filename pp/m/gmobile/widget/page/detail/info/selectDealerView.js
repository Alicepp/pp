var base=require('common:widget/ui/base/base.js');
var app=require('../app.js');
var baseView=require('../view.js');
var View=base.Class(function($el){
    baseView.apply(this, arguments);
    this.$el=$el;
},baseView).extend({
    init:function(modelKey){
        this.listKey=modelKey;
        this.list=app[modelKey];
        this.$province=this.$el.find('#provinceId');
        this.$city=this.$el.find('#cityId');
        this.$dealer=this.$el.find('#dealerid');
        this.updataModel();
        this.bindEvent();
        this.initArea();
    },
    updataPage:function(){
        this.$el.show();
    },
    updataModel:function(){

    },
    initArea:function(){
        var that=this;
        $.ajax({
            url:'http://mall.api.emao.com/newcar/public/?c=location/ip&a=getareabyip',
            dataType:'jsonp'
        }).then(function(data) {
            if(data.code !== 0||!data.data)return;
            if(!emao.points.city[data.data.provinceId])return;
            if(!emao.points.dealer[data.data.cityId])return;
            that.changeProvince({
                provinceId:data.data.provinceId,
                cityId:data.data.cityId
            });
        })
    },
    changeProvince:function(e){
        e=e||{};
        var id= e.provinceId||this.$province.val();
        this.$province.val(id);
        var citys=emao.points.city[id];
        var html='';
        for(var i=0;i<citys.length;i++){
            html+='<option value="'+citys[i].cityId+'">'+citys[i].cityName+'</option>'
        }
        var cityId= e.cityId||citys[0].cityId;
        this.$city.html(html).val(cityId);
        this.changeCity();

    },
    changeCity:function(){
        var id=this.$city.val();
        var dealers=emao.points.dealer[id];
        var html='';
        for(var i=0;i<dealers.length;i++){
            html+='<option value="'+dealers[i].dealerid+'">'+dealers[i].name+'</option>'
        }
        this.$dealer.html(html).val(dealers[0].dealerid);
        this.changeDealer()
    },
    changeDealer:function(toMainPage){
        var id=this.$dealer.val();
        this.dispatchEvent('change.list',{'listKey':this.listKey,'id':id});
        toMainPage&&this.toMainPage();
    },
    bindEvent:function(){
        var that=this;
        this.$province.on("change",this.changeProvince.bind(this));
        this.$city.on("change",this.changeCity.bind(this));
        this.$dealer.on('change',this.changeDealer.bind(this,true));

    }


});
return View;