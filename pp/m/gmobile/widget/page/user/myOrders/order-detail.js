var oSrcDown = __uri("images/rboxDown.png");
var oSrcUp = __uri("images/rboxUp.png");
var detail = {
	bindEvent:function()
	{
		$(".orderTlist").each(function(){
			this.oH = $(this).height();
			$(this).height($(this).height()+'px');
		});
		$(".btn-rBox").click(function(){
			var obj = $(this).parents(".orderPlisi").find(".orderTlist");
			var This = this;
			if(!This.oC)
			{
				This.oC = 1;
			}
			if(This.oC == 1)
			{
				obj.animate({"height":"0px"},300,function(){
					This.innerHTML = '<img src='+ oSrcDown +' class="rboxDown rboxBg">点击展开贷款信息';
					This.oC = 2;
				})
			}
			else if(This.oC == 2)
			{
				obj.animate({"height":obj[0].oH + "px"},300,function(){
					
					This.innerHTML = '<img src='+ oSrcUp +' class="rboxDown rboxBg">点击收起贷款信息';
					This.oC = 1;
				})
			}
		})
	}
}
return detail;