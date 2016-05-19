var orderDe = {
	oPage:2,
	bindLoadMore:function(){
		var This = this;
		This.listUrl = window.URL.user + '?c=user/installmentorder&a=index&page=';
        $(window).scroll(function(){
            var countHigh=$(window).height()+$(window).scrollTop()+20,
                dHigh=$(document).height();
            if(countHigh>dHigh){
                This.loadMore();
            }
        });
    },
    loadMore:function()
    {
    	var This = this;
    	if(This.loading)return;
    	This.loading = true;
    	$.ajax({
            url:This.listUrl + This.oPage,
            success:function(data){
            	$(".myOrder").append(data);
            	This.oPage += 1;
            	This.loading = false;
            }
        })
    }
}
return orderDe;