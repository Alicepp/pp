var base=require('common:widget/ui/base/base.js');
var app=require('../app.js');
var baseView=require('../view.js');
var map=require('gmobile:widget/map/map.js');
var View=base.Class(function(){
    baseView.apply(this, arguments);
},baseView).extend({
    init:function(modelKey){
        this.listKey=modelKey;
        this.list=app[modelKey];
        this.centerPoint=this.list.getSelectedData();
        this.$address=$('.choose-dealer .address');
        $.cachedGetScript(this.mapScriptUrl).then(this.creatMap.bind(this));
        this.updataDistance();
        this.inited=true;
    },
    updataList:function(){
        this.centerPoint=this.list.getSelectedData();
        this.mp.clearOverlays();
        this.addMarker(this.centerPoint);
        this.updataDistance();
    },
    updataDistance:function(){
        var that=this;
        that.$address.hide();
        map.getDistance(this.centerPoint.longitude, this.centerPoint.latitude,function(distance){
            distance?that.$address.html('距你'+distance).show():that.$address.hide();
        })
    },
    bindEvent:function(){
        var that=this;
        app.addEventListener(this.listKey+'.change',this.updataList,this);
    },
    mapScriptUrl:'http://api.map.baidu.com/getscript?v=1.4&ak=&services=',
    creatMap:function() {
        var that = this;
        this.mp = new BMap.Map(this.$el.find('.map-box')[0]);
        this.point = new BMap.Point(this.centerPoint.longitude, this.centerPoint.latitude);
        this.mp.centerAndZoom(this.point, 14);
        this.addMarker(this.centerPoint);
        this.mp.enableScrollWheelZoom(true);
        this.moveToCenter();
        this.bindEvent();
    },
    showAction:function(){
        setTimeout(this.moveToCenter.bind(this),200);
    },
    moveToCenter:function(){
        this.centerPoint=this.list.getSelectedData();
        var point = new BMap.Point(this.centerPoint.longitude, this.centerPoint.latitude);
        this.mp.centerAndZoom(point, 14);
    },
    clickHander:function(pointObj){
        this.dispatchEvent('change.list',{'listKey':this.listKey,'id':pointObj.dealerid});
        this.toMainPage();
    },
    addMarker:function(pointObj){
        var that=this;
        var point=new BMap.Point(pointObj.longitude,pointObj.latitude);
        var marker = new BMap.Marker(point);  // 创建标注
        this.mp.addOverlay(marker);              // 将标注添加到地图中
        var labelTxt=[
            pointObj.name,
            '电话：'+pointObj.telephone,
            '地址：'+pointObj.address
        ].join('<br/>');
        var label = new BMap.Label(labelTxt,{offset:new BMap.Size(-102,-105)});
        label.setStyle({
            whiteSpace:"normal",
            borderColor:"#A29E98",
            color : "#333",
            width : "220px",
            height : "80px",
            fontSize : "12px",
            padding : "10px",
            lineHeight : "20px",
            fontFamily:"微软雅黑"
        });
        label.addEventListener("click",function(){
            that.clickHander(pointObj,marker);
            that.point=point
        });
        marker.setLabel(label);
    }
});
return View;