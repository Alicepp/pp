<!--侧边栏-->
<div class="rightBar rightBar-show">
    <ul id="fubox">
        <li>
            <a class="shop-wish rightBar-item" href="http://mall.emao.com/?c=index&a=desire" target="_blank">
                <span></span>
                <p class="con">购车愿望</p>
            </a>
            <p class="to">
                <a href="http://mall.emao.com/?c=index&a=desire" target="_blank">
                    购车愿望
                </a>
            </p>
        </li>
        <li >
            <a class="zhihuancar rightBar-item" href="http://mall.emao.com/{%$tplData.curCity.pinyin|default:'beijing'%}/secondhandcar.html" target="_blank" onclick="ga('send','event','Second_handcar','shcar');" >
                <span></span>
                <p class="con">二手车置换</p>
            </a>
            <p class="to">
                <a  href="http://mall.emao.com/{%$tplData.curCity.pinyin|default:'beijing'%}/secondhandcar.html" target="_blank" onclick="ga('send','event','Second_handcar','shcar');">
                    二手车置换
                </a>
            </p>
        </li>
        <li>
            <a class="ask-online rightBar-item" id="BizQQWPA" href="javascript:void(0)" target="_self">
                <span></span>
                <p class="con">咨询</p>
            </a>
            <p class="to">
                <a  href="javascript:void(0)" id="BizQQWPA2" target="_self" onclick="">
                    咨询
                </a>
            </p>
        </li>
        <li>
            <a class="order-list rightBar-item" href="http://i.emao.com/homecp/shangcheng/order/" target="_blank">
                <span></span>
                <p class="con">订单</p>
            </a>
            <p class="to">
                <a href="http://i.emao.com/homecp/shangcheng/order/" target="_blank">
                    订单
                </a>
            </p>
        </li>
        <li id="gotop-box">
            <div class="gotop-box">
                <span></span>
            </div>
            <p class="to">返回顶部</p>
        </li>
    </ul>
</div>
<div class="rightBar-bg"></div>
<!--侧边栏end-->

<script>
    BizQQWPA.addCustom({aty: '0', a: '0', nameAccount: 4008903881, selector: 'BizQQWPA2'});</script>


{%script%}
/*移入显示*/
(function(){
var oUl=document.getElementById('fubox');
var aLi=oUl.getElementsByTagName('li');
for(var i=0;i<aLi.length;i++){
aLi[i].index=i;
aLi[i].timer=null;
aLi[i].onmouseover=function(ev){
var oP=getByClass(this,'to')[0];
var oP2=getByClass(this,'con')[0];
var oSpan=this.getElementsByTagName('span')[0];
if(this.index==4){
clearTimeout(this.timer);
this.timer=setTimeout(function(index){
oP.style.display='block';
move(oP,{left:-93,opacity:1},{duration:150});
oSpan.style.backgroundColor='red';
},100);
}else{
clearTimeout(this.timer);
this.timer=setTimeout(function(index){
oP.style.display='block';
move(oP,{left:-93,opacity:1},{duration:150});
oP2.style.opacity='0';
oSpan.style.backgroundColor='red';
},100);
}
}
aLi[i].onmouseout=function(ev){
var oP=getByClass(this,'to')[0];
var oP2=getByClass(this,'con')[0];
var oSpan=this.getElementsByTagName('span')[0];
if(this.index==4)
{
clearTimeout(this.timer);
this.timer=setTimeout(function(index){
move(oP,{left:-145,opacity:0},{duration:150});
timer1=setTimeout(function(){
oP.style.display='none';
clearTimeout(timer1);
},150)
oSpan.style.backgroundColor='';
},100);
}else{
clearTimeout(this.timer);
this.timer=setTimeout(function(){
move(oP,{left:-145,opacity:0},{duration:150});
timer1=setTimeout(function(){
oP.style.display='none';
clearTimeout(timer1);
},150)
oP2.style.opacity='1';
oSpan.style.backgroundColor='';
},100);
}
}
}
})();
{%/script%}

{%script%}
    require.async('./gotop2.js',function(gotop){
        gotop.init();
    });
{%/script%}



<script src="http://s.emao.net/tmall/html/static/pc/js/move.js" type="text/javascript"></script>