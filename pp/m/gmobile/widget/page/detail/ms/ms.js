var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var app={
    init:function() {
        if(emao.carInfo.isSeckill!=1)return;
        this.$el = $('.pop-ms');
        this.$backBtn = this.$el.find('.backBtn');
        this.$code = this.$el.find('.huoqu');
        this.$submit = this.$el.find('.ms-get');
        this.bindEvent();
        this.defaultCity();
        this.loadBrand();
        this.hide();
        this.checkIfMsed()
    },


    checkIfMsed:function(){
        var that=this;
        $.ajax({
            url:'/?c=seckill&a=getbygid',
            data:{
                gId:emao.carInfo.id
            },
            type:'post',
            success:function(json){
                that.updateMsBtn(json&&(json.code===0));
            }
        })
    },
    updateMsBtn:function(hasMsed){
        if(hasMsed){
            $('.msBtn').hide();
            $('.qiang-btns').show();
        }else if($('.msBtn').length){
            $('.msBtn').show();
            $('.qiang-btns').hide();
        }
    },
    bindEvent:function(){
        var that=this;
        this.$backBtn.click(this.hide.bind(this));
        this.$code.click(this.getCode.bind(this));
        this.$submit.click(this.submit.bind(this));
        $('.msBtn').click(function(){
            utils.checkIfLogin(function(){
                that.show();
            });
        });
        $('#province').change(function(){
            that.changeProvince();
        });
        $('.subBrandId').on('change',function(e){
            that.selectModel();
        });
        $('.s_serie_id').on('change',function(e){
            that.carModel();
        });
        $('name-input').blur(function(e){
            that.checkName()
        });

    },
    changeProvince:function(){
        var proId=$('#province').val();
        if(proId==0){
            this.emptyCity();
            return;
        }
        $.ajax({
            url:'/?c=index&a=ajaxCity',
            data:{
                province:proId
            },
            dataType:'jsonp',
            success:function(json){
                var len=json.data.length,
                    data=json.data,
                    htmlStr='';
                for(var i=0; i<len; i++){
                    htmlStr+='<option value="'+data[i].cityid+'">'+data[i].cityname+'</option>';
                }
                $('#city').html(htmlStr);


            }

        })
    },
    emptyCity:function(){
        $("#city").html('<option value="0">选择城市</option>');

    },
    defaultCity:function(){
        var that=this;
        $.ajax({
            type: 'GET',
            url: 'http://loc.emao.com/getareabyip',
            data: {},
            dataType: 'jsonp',
            jsonp: 'cb',
            success: function(data) {
                that.pro_id=data.data["provinceID"];
                that.city_id=data.data["cityID"];
                $('#province').val(that.pro_id);
                that.changeProvince();
            }
        });

    },
    secondDown:function(time){
        var that=this;
        time=time-0;
        if(time<=0){
            clearTimeout(this.countdownTimer);
            $('.huoqu').show();
            $('.second-down').hide();
            return;
        }
        $('.second-down').html(time+'s').css('display','inline-block');
        $('.huoqu').hide();

        var callee=arguments.callee;
        this.countdownTimer&&clearTimeout(this.countdownTimer);
        this.countdownTimer=setTimeout(function(){
            callee.call(that,time-1);
        },1000);

    },
    getCode:function(){
        var phone=$('.phone-input').val();
        if(!this.checkPhone()){
            return;
        }
        var that=this;
        $.ajax({
            url:'/?c=seckill&a=getPhoneCode',
            data:{
                phone:phone
            },
            type:'post',
            success:function(data){
                that.secondDown('60');
            }
        })
    },
    loadBrand:function(){
        var url =window.URL.home+'?c=dealerwish&a=getList';
        var that=this;
        $.getJSON(url, function(result){
            that.parseBrand(result.data);
        });
    },
    parseBrand:function(data){
        var that=this;
        var brandopt = '';
        if(data){
            brandopt = '<option value="0" selected>品牌</option>';
            $.each(data, function(word, blist){
                $.each(blist, function(bname, sublist){
                    bname = bname.split('_');
                    if(sublist.length>0){
                        brandopt += '<optgroup label="['+word+']'+bname[1]+'">';
                        $.each(sublist, function(j,sub){
                            brandopt += '<option value="'+sub.id+'">'+sub.subBrandName+'</option>';
                        });
                        brandopt += '</optgroup>';
                    }
                });
            });
            $('.subBrandId').html(brandopt);
            that.selectModel()
        }
    },
    selectModel:function(){
        var that=this;
        var _this=$('.subBrandId');
        var subbrandid = $('.subBrandId').val();
        if(subbrandid==0){
            $('.s_serie_id').html('<option value="0">车系</option>').val(0);
            this.carModel();
            return ;
        }
        $.getJSON(
            window.URL.home+'?c=dealerwish&a=getList',
            {'subbrandid': subbrandid,'opt':'series'},
            function (data) {
                var html = '<option value="0">车系</option>';
                if(data.data != '' ){
                    $.each(data.data, function(key, obj){
                        html += '<option value="' + obj['id'] + '">' + obj['serieName'] + '</option>';
                    });
                }
                _this.siblings('.s_serie_id').html(html).val(0);
                that.carModel();
            }
        );
    },
    carModel:function(){
        var _this=$('.s_serie_id');
        var seriesid = _this.val();
        if(seriesid==0){
            $('.s_car_id').html('<option value="0">车型</option>').val(0);
            return
        }
        $.getJSON(
            window.URL.home+'?c=dealerwish&a=getList',
            {'seriesid': seriesid,'opt':'car'},
            function (data) {
                var html = '<option value="">车型</option>';
                if(data.data != '' ){
                    $.each(data.data, function(key, obj){
                        html += '<option value="' + obj['id'] + '">' + obj['autoName'] + '</option>';
                    });
                }
                _this.siblings('.s_car_id').html(html);
            }
        );
    },
    checkName:function(){
        var name=$('.name-input').val();
        if(name.length==0){
            alert("姓名不能为空");
            return;
        }else{
            return name;
        }
    },
    checkPhone:function(){
        var phone=$('.phone-input').val();
        var reg=/^1\d{10}$/;
        if(phone.length==0){
            alert("手机号不能为空");
            return;
        }else if(!reg.test(phone)){
            alert("手机号错误,请重新输入！");
            return;
        }else{
            return phone;
        }
    },
    checkCode:function(){
        var code=$('.ma-input').val();
        if(code.length==0){
            alert('请输入验证码');
        }else{
            return code;
        }
    },
    checkCity:function(){
        var province=$('#province');
        var city=$('#city');
        if(province.get(0).selectedIndex==0){
            alert('请输入省份');
            return;
        }
        return true;

    },
    checkCarModel:function(){
        if($('.s_car_id').val()==0){
            alert('请选择意向车型');
            return false;
        }
        return true;
    },
    submit:function(){
        if(this.isSubmiting)return;
        var that=this;
        var checks=[this.checkName,this.checkCity,this.checkPhone,this.checkCode,this.checkCarModel];
        var ctrl=true;
        $(checks).each(function(i,item){
            if(!ctrl) return;
            if(!item()){
                ctrl=false;
            }
        });
        if(!ctrl){
            return;
        }
        var name=$('.name-input').val();
        var phone=$('.phone-input').val();
        var code=$('#code').val();
        var cityId=$('#city').val();
        var autoId=$('.s_car_id').val();
        this.isSubmiting=true;
        $.ajax({
            url:"/?c=seckill&a=add",
            type:'post',
            data:{
                gId:emao.carInfo.id,
                name:name,
                phone:phone,
                cityId:cityId,
                code:code,
                autoId:autoId
            },
            success:function(json){
                that.isSubmiting=false;
                if(json.code==0){
                    that.hide();
                    that.updateMsBtn(true);

                    return;
                }
                alert('验证码错误')
            }

        })

    },


    show:function(){
        if(emao.carInfo.isSeckill!=1)return;
        this.$el.show();
    },
    hide:function(){
        this.$el.hide();
    }

};
return app;