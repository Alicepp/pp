var user={
    init:function(){
        this.bindDOMEvent();
        this.selectCity();
    },
    bindDOMEvent:function(){
    	var that=this;
    	$('.name-info input').on('blur',function(){
    		that.checkName($(this));
    	})
        $('.contact-info input').on('blur',function(){
            var vals=$(this).val();
            if(vals != ''){
               that.checkName($(this));
            }else{
                $(this).parent().find('.error-int').hide();
            } 
        })
    	$('.phone-info input , .gency-info input').on('blur',function(){
    		that.checkPhone($(this));
    	})
        $('.gency-info input').on('blur',function(){
            var vals=$(this).val();
            if(vals != ''){
               that.checkPhone($(this));
            }else{
                $(this).parent().find('.error-int').hide();
            } 
        })
        $('.education-info input').on('blur',function(){
            that.checkEdu($(this));
        })
        $('.info-info em').on('click',function(){
            $(this).addClass('cur').siblings().removeClass('cur');
        })
        $('.info-info input').on('focus',function(){
            that.checkPapers($(this));
        })
    	$('.age-ingo input').on('blur',function(){
    		that.checkAge($(this));
    	})
    	$('.income-info input').on('blur',function(){
    		that.checkIncome($(this));
    	})
        $('.rt-rt textarea').on('keydown',function(){
            that.checkOther($(this));
        })
        $('.sub-btn').on('click',function(){
            that.submitData($(this));
        })
        $('#province').change(function(){
            that.selectCity();
        })
        $('.fenqiBtn').on('click',function(){
            $('.fenqi').submit();
        })
        
    },
    pro_id:0,
    city_id:0,
    checkName:function(_this){
    	var nameVal=_this.val();
    	var nameReg=/^[\u4E00-\u9FA5A-Za-z]{2,20}$/;
    	if(!nameReg.test(nameVal)){
            _this.parent().find('.error-int').show();
    	}else{
    		_this.parent().find('.error-int').hide();
    	}
    },
    checkPapers:function(_this){
        var curInfo= _this.parent().find('.cur').text();
        $('.info-info input').on('blur',function(){
            var papersVal=_this.val();
            var lens=_this.val().length;
            if(curInfo == '护照'){
               if(lens > 15 || lens == 0){
                    _this.parent().find('.error-int').show();
                    _this.parent().find('.error-int').text('请输入正确的护照号码');
                }else{
                    _this.parent().find('.error-int').hide();
                }
            }else if(curInfo == '军官证'){
                if(lens > 15 || lens == 0){
                    _this.parent().find('.error-int').show();
                    _this.parent().find('.error-int').text('请输入正确的军官证号码');
                }else{
                    _this.parent().find('.error-int').hide();
                }
            }else{
                var idReg=/^\d{17}(\d{1}|[x|X]{1})$/;
                if(!idReg.test(papersVal)){
                    _this.parent().find('.error-int').show();
                    _this.parent().find('.error-int').text('身份证18位');
                }else{
                    _this.parent().find('.error-int').hide();
                }
            }
        })
    },
    checkPhone:function(_this){
        var phone=_this.val();
        var reg=/^1\d{10}$/;
        if(!reg.test(phone)){
            _this.parent().find('.error-int').show();
        }else{
        	_this.parent().find('.error-int').hide();
        }
    },
    checkAge:function(_this){
    	var age=Number(_this.val());
    	if(isNaN(age)){
    		_this.parent().find('.error-int').show();
    	}else{
            
    		if(age < 18 || age > 60){
	            _this.parent().find('.error-int').show();
	    	}else{
	    		_this.parent().find('.error-int').hide();
	    	}
    		
    	}	
    },
    checkEdu:function(_this){
       var reg=/^[\u4e00-\u9fa5]{0,20}$/,
           eduinfo=_this.val();
        if(!reg.test(eduinfo)){
            _this.parent().find('.error-int').show();
        }else{
            _this.parent().find('.error-int').hide();
        }

    },
    checkIncome:function(_this){
    	var income=Number(_this.val());
        var len=_this.val().length;
    	if(isNaN(income)){
    		_this.parent().find('.error-int').show();
    	}else{
            if(income != ''){
                _this.val(income.toFixed(2));
                if(len > 10){
                    _this.parent().find('.error-int').show();
                }else{
                    _this.parent().find('.error-int').hide();
                }
            }else{
                _this.parent().find('.error-int').hide();
            }
    		
    		
    	}
    },
    checkOther:function(_this){
        var leng=_this.val().length;
        _this.parent().find('em i').text(leng);
    },
    selectCity:function(){
        var proId=$('#province').val();
        var bankid=$('.city-info').attr('bank');
        $.ajax({
            url:"/ajax/installment/city/"+bankid+"/"+proId,
            success:function(json){
                var len=json.data.length,
                    data=json.data,
                    htmlStr='';
                for(var i=0; i<len; i++){
                    htmlStr+='<option value="'+data[i].cityId+'">'+data[i].cityName+'</option>';
                }

                $('#city').html(htmlStr);

            }

        })
    },
    submitData:function(){
        var name=$('.name-info input').val(),
            codeType=$('.info-info .cur').index(),
            codeVal=$('.info-info input').val(),
            phone=$('.phone-info input').val(),
            age=$('.age-ingo input').val(),
            provinceId=$('.provinceId').val(),
            cityId=$('.cityId').val(),
            occupation=$('.occupation-info select').val(),
            house=$('.housing-info select').val(),
            security=$('.security-info select').val();
        var extendName=$('.contact-info input:visible').val(),
            extendEdu=$('.education-info input:visible').val(),
            extendIncome=$('.income-info input:visible').val(),
            extendLoan=$('.loan-info select:visible').val(),
            extendPhone=$('.gency-info input:visible').val(),
            remark=$('.rt-rt textarea').val();
        var bankId=$('input[name="bankId"]').val(),
            firstPay=$('input[name="firstPay"]').val(),
            stag=$('input[name="stag"]').val(),
            gId=$('input[name="gId"]').val(),
            pId=$('input[name="pId"]').val(),
            color=$('input[name="color"]').val(),
            partsid=$('input[name="partsid"]').val(),
            autoId=$('input[name="autoId"]').val(),
            depositId=$('input[name="depositId"]').val(),
            loanRatio=$('input[name="loanRatio"]').val();
            if(name == '' || codeVal =='' || phone == ''){
               $('.mask-wrap').show();
               $('.mask-wrap p').html('不符规范的信息已经用红色“<span>*</span>”标出，请重新填写');
               $('.mask-wrap .close-btn ,.mask-wrap .mask-close').on('click',function(){
                   $('.mask-wrap').hide();
               })
               return;
            }
            if($('.error-int:visible').length > 0){
               return;
            }
            $.ajax({
                url:"http://mall.emao.com/fenqi/submit/",
                type:'post',
                data:{
                    bankId:bankId,
                    firstPay:firstPay,
                    stag:stag,
                    gId:gId,
                    pId:pId,
                    color:color,
                    partsid:partsid,
                    autoId:autoId,
                    name:name,
                    codeType:codeType,
                    codeVal:codeVal,
                    phone:phone,
                    age:age,
                    provinceId:provinceId,
                    cityId:cityId,
                    occupation:occupation,
                    house:house,
                    security:security,
                    extendName:extendName,
                    extendEdu:extendEdu,
                    extendIncome:extendIncome,
                    extendLoan:extendLoan,
                    extendPhone:extendPhone,
                    remark:remark,
                    depositId:depositId,
                    loanRatio:loanRatio
                },
                success:function(data){
                    if(data.code == 0){
                        window.location.href="http://mall.emao.com/fenqi/success/"+data.data+".html";
                    }else{
                        if(data.msg == ''){
                            $('.mask-wrap').show();
                            $('.mask-wrap p').html('未知错误');
                            $('.mask-wrap .close-btn ,.mask-wrap .mask-close').on('click',function(){
                               $('.mask-wrap').hide();
                            })
                            return;
                        }else{
                            if(data.msg == 'param error'){
                                $('.mask-wrap').show();
                                $('.mask-wrap p').html('未知错误');
                                $('.mask-wrap .close-btn ,.mask-wrap .mask-close').on('click',function(){
                                   $('.mask-wrap').hide();
                                })
                                return;
                            }else{
                                $('.mask-wrap').show();
                                $('.mask-wrap p').html(data.msg);
                                $('.mask-wrap .close-btn ,.mask-wrap .mask-close').on('click',function(){
                                   $('.mask-wrap').hide();
                                })
                                return;
                            }
                            
                        }
                        
                    }
                }

            })

    }

}
return user;