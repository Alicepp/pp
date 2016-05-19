var countCon = $('.confirm-count'),
    nowJump = $('.directjump'),
    monthMoney = $('#con-yue'),
    payrate = $('#con-qishu'),
    rateint = $('#con-lixi'),
    yuelilvtag = $('#con-lilv');

var confirm = {
	init:function(){
		this.count();
		this.monthPay();
	},
	count:function(){
		jumpHref = nowJump.attr('href');
		wait = parseInt(countCon.text());
		function time() {
	        if (wait == 0) {
	            wait = 60;
	            location.href = jumpHref;
	        } else { 
	            wait--;
	            countCon.text(wait);
	            setTimeout(function() {
	                time();
	            },
	            1000)
	        }
	    }
	    time();
	},
	monthPay:function(){
		//monthMoney.html(Number(parseFloat(monthMoney.attr('ratemoney'))+parseFloat(rateint.html())).toFixed(2)+'元');
		//yuelilvtag.html(Number(yuelilvtag.attr('yuelilv')).toFixed(2)+'%')
		//var scYuan = $('#sc-price').attr('scprice');
		//$('#sc-price').html(Number(scYuan).toFixed(2)+'万');
	}
}

return confirm;