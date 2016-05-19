var Pop=require('common:widget/pop/pop.js');
function MapPop(pointObj,clickHander){
    this.init(pointObj,clickHander)
}
$.extend(MapPop.prototype,{
    mapScriptUrl:'http://api.map.baidu.com/getscript?v=1.4&ak=&services=',
    init:function(pointObj,clickHander){
        this.pop=new Pop({isRemove:1});
        this.pop.show();
        this.pointObj=pointObj||emao.point;
        this.clickHander=clickHander||function(){};
        $.cachedGetScript(this.mapScriptUrl).then(this.creatMap.bind(this));
        this.inited=true;
    },
    creatMap:function(){
        var that=this;
        this.mp = new BMap.Map(this.pop.$box[0]);
        this.point=new BMap.Point(this.pointObj.longitude,this.pointObj.latitude);
        this.mp.centerAndZoom(this.point,13);
        this.addMarker(this.pointObj);
        this.mp.enableScrollWheelZoom(true);
    },
    addMarker:function(pointObj){
        var that=this;
        var pointOb=this.pointObj
        var point=this.point;
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
            overflow:"hidden",
            fontSize : "12px",
            padding : "10px",
            lineHeight : "20px",
            fontFamily:"微软雅黑"
        });
        label.addEventListener("click",function(){
          that.clickHander(pointObj,marker);
       });
        marker.setLabel(label);
    },
    show:function(){
        this.pop.show();
    },
    hide:function(){
        this.pop.hide();
    }
});

return MapPop;
