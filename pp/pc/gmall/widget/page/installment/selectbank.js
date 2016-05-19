var bankBox = $('.install-bank'),
	selectBtn = bankBox.find('.payment a'),
	selectmentBtn = bankBox.find('.llment a'),
	results = $('.install-jieguo'),
	submitBtn = $('.install-tijiao'),
	lookRule = $('.install-c-look'),
	maskClose = $('.install-close'),
	fenqiDiv = $('.llmenbox'),
	mask = $('.install-fuceng'), //弹层
	yearRateOne = 0.046, //中国银行贷款一年以下的年利率
	yearRateMore = 0.050, //中国银行贷款一年以上五年以内的年利率
	paymentRatio = 0,  //首付比例
	repayment = 0,     //还款期数
	monthRate = 0,     //月利率
	firstPayment = 0,  //首付款
	loanAmount = 0,    //贷款金额
	monthRepay = 0,    //每月应还金额
	monthInterest = 0, //每月利息
	fortheMonth = 0,   //月供
	rateTwe = 0,       //12期月利率
	rateTweFour = 0,   //24期月利率
	rateThiSix = 0,    //36期月利率
	rateForEight = 0,  //48期月利率
	rateSixty = 0,     //60期月利率
	procedureVal = 0,  //手续费
	bankstrid = 0,     //银行id
	provinceStrid = 0, //省份id
	czfirst = 0,       //需要传的首付值
	czstag = 0,        //需要传的值分期
	truePrice = 0,     //真正的购车价格
	freenum = 0,       //免息几个月
	mayresult1 = '',   //可能结果1
	mayresult2 = '',   //可能结果2
	resultHtml = '';

var install = {
	init:function(){
		//this.tagEach();
		this.bindDOMEvent();
		this.bankMask();
		this.bankCity();
	},
	bindDOMEvent:function(){
		var that=this;
		selectBtn.on('click',function(){
             that.tagActive($(this));
		})
		lookRule.click(function(){
			that.lookBankRule($(this));
		})
		maskClose.click(function(){
			that.masklookClose($(this));
		})
		$('.install-zhichi').change(function(){
			provinceStrid = $(this).val();
			var ruthat = $(this);
			var cdbankstrid = bankstrid;
			that.defaultCity(provinceStrid,cdbankstrid,ruthat);
		});
	},
	tagEach:function(){
		bankBox.each(function(){
			$(this).find('.llmenbox').eq(0).show();
		});
	},
	tagActive:function(_this){
		var index=_this.index();
		var that = this;
		var $parents = _this.parents('.install-bank');
		czfirst = _this.attr('firstpay');
		_this.addClass('active').siblings().removeClass('active');
		$parents.find('.llmentquan').hide();
		$parents.find('.llmenbox').hide();
		$parents.find('.llmenbox').eq(index-1).show();
		$parents.find('.llment').removeClass('llmcurrent');
		$parents.find('.llmenbox').find('a').removeClass('active');
		$parents.find('.install-jieguo').hide();
		$parents.find('.install-tijiao').hide();
        $parents.find('.llmenbox').eq(index-1).find('a').on('click',function(){
        	$(this).addClass('active').siblings().removeClass('active');
			that.tagSub($parents);
        });
	},
	lookBankRule:function(_this){
		var parindex = _this.parents('.install-bank').index();
			bankstrid = _this.parents('.install-bank').attr('bankId');
		mask.show();
		mask.find('.install-mask').height($(document).height());
		mask.find('.install-fcyin').hide();
		mask.find('.install-fcyin').eq(parindex).show();
	},
	masklookClose:function(){
		mask.hide();
	},
	tagSub:function($parents){
		var carprice = $('.install-plan').attr('carprice'); //购车价格--一猫价 接口单位是元
		var carPrice1 = $('.install-plan').attr('carprice');
		var carPrice2 = $('.install-plan').attr('carbuyerprice'); //购车价格--厂商指导价 接口单位是万元
		var bargaintype = $('.install-plan').attr('bargainType'); //是否支持议价，1支持，2不支持
		if($parents.find('.payment a').hasClass('active') && $parents.find('.llment .llmenbox:visible a').hasClass('active')){
			$parents.find('.install-jieguo').show();
			$parents.find('.install-tijiao').show();
			rateTwe = $parents.attr('rateTwe')*0.01; //12期月利率
			rateTweFour = $parents.attr('rateTweFour')*0.01; //24期月利率
			rateThiSix = $parents.attr('rateThiSix')*0.01; //36期月利率
			rateForEight = $parents.attr('rateForEight')*0.01; //48期月利率
			rateSixty = $parents.attr('rateSixty')*0.01; //60期月利率
			procedureVal = $parents.attr('procedureVal'); //手续费
			procedureType = $parents.attr('procedureType'); //手续费是固定值还是百分比
			paymentRatio = parseInt($parents.find('.payment a.active').html())*0.01; //首付比例 
			repayment = parseInt($parents.find('.llment a.active').html());  //还款期数
			freenum = $parents.find('.llmenbox:visible').find('.active').attr('freenum');
			
			if(procedureType == '2'){
               procedureVal = carprice*procedureVal/100
			}
			/*if(bargaintype == '1'){
				truePrice = carPrice2*10000;
			}else if(bargaintype == '2'){
				truePrice = carPrice;
			}*/
			//repayment <= 12 ? monthRate = yearRateOne/12 : monthRate = yearRateMore/12;
			if(repayment <= 12){
				monthRate = rateTwe;
				czstag = 1;
			}else if(repayment > 12 && repayment <=24){
				monthRate = rateTweFour;
				czstag = 2;
			}else if(repayment > 24 && repayment <= 36){
				monthRate = rateThiSix;
				czstag = 3;
			}else if(repayment > 36 && repayment <= 48){
				monthRate = rateForEight;
				czstag = 4;
			}else if(repayment > 48 && repayment <= 60){
				monthRate = rateSixty;
				czstag = 5;
			}
			firstPayment = Number(carprice * paymentRatio).toFixed(2); //首付款 = 购车价格 X 首付比例
			loanAmount = Number(carprice - firstPayment).toFixed(2); //贷款金额 = 购车价格 - 首付款
			monthRepay = Number(loanAmount/repayment).toFixed(2); //每月应还金额 = 贷款金额/还款期数
			monthInterest = Number(loanAmount * monthRate).toFixed(2); //每月利息 = 贷款金额 X 月利率
			var num1 = Number(monthRepay);
			var num2 = Number(monthInterest);
			fortheMonth = Number(num1 + num2).toFixed(2); //月供 = 每月应还金额 + 每月利息
			mayresult1= '<li>首付金额：<span>'+firstPayment+'</span>元</li>' +
						'<li>贷款金额：<span>'+loanAmount+'</span>元</li>' +
						'<li>预计月供：<span>'+fortheMonth+'</span>元</li>' +
						'<li>月利率：<span>'+Number(monthRate/0.01).toFixed(2)+'</span>%</li>' +
						'<li>预计月利息：<span>'+Number(monthInterest).toFixed(2)+'</span>元</li>' +
						'<li>手续费：<span>'+Number(procedureVal).toFixed(2)+'</span>元</li>' +
						'<li class="mianxi">恭喜您，您获得<span>'+freenum+'</span>个月的免息优惠</li>';
			mayresult2= '<li>首付金额：<span>'+firstPayment+'</span>元</li>' +
						'<li>贷款金额：<span>'+loanAmount+'</span>元</li>' +
						'<li>预计月供：<span>'+fortheMonth+'</span>元</li>' +
						'<li>月利率：<span>'+Number(monthRate/0.01).toFixed(2)+'</span>%</li>' +
						'<li>预计月利息：<span>'+Number(monthInterest).toFixed(2)+'</span>元</li>' +
						'<li>手续费：<span>'+Number(procedureVal).toFixed(2)+'</span>元</li>';
			if(freenum == 0)
			{
				resultHtml = mayresult2;
			}
			else
			{
				resultHtml = mayresult1;
			}
			$parents.find('.install-jieguo').html(resultHtml);
			$parents.find('.install-tijiao > input').click(function(){
				$('#bankid').val($parents.attr('bankId'));
				$('#firstpay').val(czfirst);
				$('#stag').val(czstag);
			});

		}
	},
	bankMask:function(){
		$('.install-fcyin').eq(0).show();
	},
	bankCity:function(){
		var rrthat = this;
		$('.install-zhichi').each(function(){
			var firstprovice = $(this).find('option:first').val();
			var twothat = $(this);
			var findex = $(this).parents('.install-fcyin').index();
			var initcdbankstrid = bankBox.eq(findex-1).attr('bankid');
			rrthat.defaultCity(firstprovice,initcdbankstrid,twothat);
		}) ;
	},
	defaultCity:function(provinceStrid,bankstrid,ruthat){
		$.ajax({
            url:'http://mall.emao.com/ajax/installment/city/'+bankstrid+'/'+provinceStrid,
			type: 'post',
			success: function(json) {
               var len=json.data.length,
                   data=json.data,
                   htmlStr='';
                for(var i=0; i<len; i++){
                    htmlStr+='<span>'+data[i].cityName+'</span>';
                }
               	ruthat.parents('.install-fcyin').find('.install-cheng').html(htmlStr);
           		//$('#city').html(htmlStr);
        	}
		});
	}
}

return install;