var map={
    mapScriptUrl:'http://api.map.baidu.com/getscript?v=1.4&ak=&services=',
    getNowPoint:function(callback){
        var that=this;
        if(this.nowPoint){
            callback&&callback.call(this,this.nowPoint);
            return this.nowPoint;
        };
        $.cachedGetScript(this.mapScriptUrl).then(function(){
            if(!$('#hideMapDiv').length){
                $('<div id="hideMapDiv"></div>').appendTo($('body'));
            };
            that.map= new BMap.Map("hideMapDiv");
            var geolocation = new BMap.Geolocation();
            var gc = new BMap.Geocoder();
            geolocation.getCurrentPosition(function(r){
                //关于状态码
                //BMAP_STATUS_SUCCESS	检索成功。对应数值“0”。
                //BMAP_STATUS_CITY_LIST	城市列表。对应数值“1”。
                //BMAP_STATUS_UNKNOWN_LOCATION	位置结果未知。对应数值“2”。
                //BMAP_STATUS_UNKNOWN_ROUTE	导航结果未知。对应数值“3”。
                //BMAP_STATUS_INVALID_KEY	非法密钥。对应数值“4”。
                //BMAP_STATUS_INVALID_REQUEST	非法请求。对应数值“5”。
                //BMAP_STATUS_PERMISSION_DENIED	没有权限。对应数值“6”。(自 1.1 新增)
                //BMAP_STATUS_SERVICE_UNAVAILABLE	服务不可用。对应数值“7”。(自 1.1 新增)
                //BMAP_STATUS_TIMEOUT	超时。对应数值“8”。(自 1.1 新增)
                if(this.getStatus() == BMAP_STATUS_SUCCESS){
                    that.nowPoint=new BMap.Point(r.point.lng, r.point.lat);
                    callback&&callback.call(that,that.nowPoint);
                }
                else {
                    callback&&callback.call(that);
                }
            })
        });



    },
    getDistance:function(longitude,latitude,callback){
        this.getNowPoint(function(point){
            if(point){
                var point1= new BMap.Point(longitude, latitude);
                var distance=this.map.getDistance(point,point1)||0;
                distance=distance-0;
                if(distance>1000){
                    distance=(distance/1000).toFixed(1)+'km';
                }else{
                    distance=distance.toFixed(0)+'m';
                }

                callback&&callback(distance);
            }else{
                callback&&callback()
            }
        })


    }


}
return map;