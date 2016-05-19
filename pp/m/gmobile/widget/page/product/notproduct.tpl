<div class="notproduct">
	<h4>很抱歉!</br>您查看的商品不存在，可能已下架或被转移</h4>
	<div class="notproduct_img"><img src="img/notproduct.jpg"></div>
	<p>您可以：<br/>1、联系一猫在线客服或拨打400电话进行咨询<br/>
		2、<a href="http://mall.m.emao.com">返回首页</a>查看其它商品&nbsp;将在<span id="jumpTo">10</span>秒后自动跳转
	</p>
</div>
<script>
(function(){
    var jumpTo = document.getElementById('jumpTo');
function countDown(secs,surl){
    //alert(surl);
    jumpTo.innerHTML=secs;
    if(--secs>0){
        setTimeout(function(){
        countDown(secs,surl);
        },1000);
    }
    else{
        location.href=surl;
    }
}
countDown(10,'http://mall.m.emao.com');
})()

</script>
