var base=require('common:widget/ui/base/base.js');
var Model=base.Model.extend({
    init:function(opts){
        opts=opts||{};
        this.maxNum=5;
        this.cityData={};
        this.brand=new base.listModel(emao.brand);
        this.list=new base.listModel();
        this.url='?c=dealerwish&a=getList';
    },
    getSerie:function(id,callback) {
        var brandData = this.brand.getData(id);
        if (!brandData) {
            callback && callback();
            return;
        }
        if(brandData.serie){
            callback && callback(brandData.serie);
            return;
        }
        $.ajax({
            url:'?c=dealerwish&a=getBrandById',
            dataType:'json',
            data:{
                'brandid': id

            }
        }).then(function(json){
            if(json&&json.data){
                brandData.serie=new base.listModel(json.data);
                callback && callback(brandData.serie);
            }
        })
    },
    getChexing:function(id,brandId,callback) {
        var brandData = this.brand.getData(brandId)||{};
        var serie = brandData.serie;
        if (!serie) {
            callback && callback();
            return;
        }
        var serieData = brandData.serie.getData(id);
        if (!serieData) {
            callback && callback();
            return;
        }

        if(serieData.car){
            callback && callback(serieData.car);
            return;
        }
        $.ajax({
            url:this.url,
            dataType:'json',
            data:{
                'seriesid': id,
                'opt':'car'
            }
        }).then(function(json){
            console.log(json);
            if(json&&json.data){
                serieData.car=new base.listModel(json.data);
                callback && callback(serieData.car);
            }
        })
    },
    getCity:function(id,callback){
        var that=this;
        if(this.cityData[id]){
            callback&&callback(this.cityData[id]);
            return;
        }
        $.ajax({
            url:window.URL.home+'?c=index&a=ajaxCity',
            data:{
                province:id
            },
            dataType:'json',
            success:function(json){
                if(!json||!json.data)return;
                that.cityData[id]=json.data;
                callback&&callback(json.data);
            }
        })
    },
    getList:function(){
        return this.list;
    },
    resetList:function(){
        this.list=new base.listModel();
    },
    setPage:function(page){
        this.set('page',page);
        this.listKey=page+'list';
        this.initList();
    },
    getCarItem:function(id){
        var serie,car,data;
        for(var i=0;i<this.brand.length;i++){
            if(serie=this.brand[i].serie){
                for(var j=0;j<serie.length;j++) {
                    if (car=serie[j].car) {
                        if(data=car.getData(id)){
                            return data;
                        }
                    }
                }
            }
        }
    },
    del:function(key){
        this.list.del(key);
    },
    add:function(id){
        var car=this.getCarItem(id);
        if(!car)return;
        if(this.list.length>=this.maxNum){
            $.alert('最多添加'+this.maxNum+'条');
            return;
        }
        this.list.add(car);
    }

})
return Model;