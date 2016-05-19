var base=require('common:widget/ui/base/base.js');
var View=require('./view.js');

var Me = base.Class(function(opts) {
    this.pageCls='wish3';
    View.apply(this, arguments);
}, View).extend({
    init:function(opts){
        opts=opts||{};
        this.$prev= this.$el.find('.pre-but');
        this.$next= this.$el.find('.next-but');
        this.bindDOMEvent();
        this.loadBrand();
        this.defaultCity()

    },
    bindDOMEvent:function(){
        var that=this;
        $('#province').change(function(){
            that.selectCity();
        })
        $('#code').click(function(){//获取验证码
            that.getCode();

        });
        $('.buy-car-info dd').find('a').click(function(){//购车时间选择
            that.selectTime($(this));
        });
        $('.add-sel').find('span').click(function(){//添加
            that.addSelectModel($(this));
        });
        $('.select').on('change','.subBrandId',function(e){
             that.selectModel($(this));
        });
        $('.select').on('change','.s_serie_id',function(e){
             that.carModel($(this));
        });

    },
    phone:null,
    pro_id:0,
    city_id:0,
    checkCarModel:function(){
        var target=$('.sel-model .buy-car-info').find('dd:first');
        var all=$('.sel-model .buy-car-info').find('dd');
        var rest=$('.sel-model .buy-car-info').find('dd:not(:first)');
        var selects=target.find('select');
        var ctrl=true;
        var ret=[];
        if(selects.get(0).selectedIndex==0){
            alert('请选择品牌');
            return;
        }else if(selects.get(1).selectedIndex==0){
            alert('请选择车系');
            return;
        }else if(selects.get(2).selectedIndex==0){
            alert('请选择车型');
            return;
        }
        rest.each(function(index,item){
            var selects=$(item).find('select');
            if(selects.get(0).selectedIndex>0&&selects.get(1).selectedIndex==0){
                alert('请选择车系');
                ctrl=false;
                return false;
            }
            if(selects.get(0).selectedIndex>0&&selects.get(1).selectedIndex>0&&selects.get(2).selectedIndex==0){
                alert('请选择车型');
                ctrl=false;
                return false;
            }
        });
        if(ctrl){
            $.each(all,function(index,item){
                var target=$(item);
                var selects=target.find('select');
                if(selects.get(0).selectedIndex==0){
                    return null
                }else{
                    ret.push($.map(selects,function(item,index){
                        if(item.selectedIndex==0){
                            return null;
                        }else{
                            return $(item).val();
                        }
                    }));
                }
            });
            return ret;
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
    nextClickHandler:function(item){
       this.submitData();
    },
    updataPage:function(e){
        if(e.pageCls==this.pageCls){
            this.initPage(e.data);
            this.list=e.data;
            this.reset();
            this.show(e);
        }else{
            this.hide();
        }
    },
    initPage:function(){
        this.$prev.show();
        this.$next.show();
    },
    updataBtn:function(list){
        this.$prev= this.$el.find('.pre-but');
        this.$next= this.$el.find('.next-but');
        this.$next.show();
    },
    emptyCity:function(){
        $("#city").html('<option value="0">选择城市</option>');
    },
    reset:function(){
        $('#buy-car-form')[0].reset();
    },
    selectCity:function(){
        var proId=$('#province').val();
        if(proId==0){
            this.emptyCity();
            return;
        }
        $.ajax({
            url:window.URL.home+'?c=index&a=ajaxCity',
            data:{
                province:proId
            },
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
                that.selectCity();
            }
        });

    },
    
    addSelectModel:function(){
        var len=$('.add-sel i').text();
        var addnum=Number(len);
        addnum--;
        var dd=$('.select dl dd:first');
        var wrapper=$('.select dl');
        var clone=dd.clone(true).addClass('add-select').append('<span>删除</span>');
        clone.find('select:not(:eq(0))').find('option:not(:eq(0))').remove();
        wrapper.append(clone);

        $('.add-sel i').text(addnum);
        if(addnum == 0){
           $('.add-sel').hide();
        }else{
           $('.add-sel').show();
        }
        $('.add-select span').on('click',function(){
            $(this).parent('.add-select').remove();
             var len=$('.select dl dd').length;
             var addnum=Number(len);
            $('.add-sel i').text(5-addnum);
            if(addnum == 0){
               $('.add-sel').hide();
            }else{
               $('.add-sel').show();
            }
        })
    },
    secondDown:function(time){
        var that=this;
        time=time-0;
        if(time<=0){
            clearTimeout(countdownTimer);
            $('.huoqu').show();
            $('.second-down').hide();
            return;
        }
        $('.second-down b').html(time);
        $('.huoqu').hide();
        $('.second-down').css('display','inline-block');
        var callee=arguments.callee;
        countdownTimer=setTimeout(function(){
            callee.call(that,--time);
        },1000);

    },
    getCode:function(){
        var phone=$('.phone-input').val();
        if(phone.length==0){
            alert("手机号不能为空");
            return;
        }
        var reg=/^1\d{10}$/;
        if (!reg.test(phone)) {
            alert("手机号错误,请重新输入！");
            return;
        }
        var that=this;
        $.ajax({
            url:window.URL.home+'?c=index&a=ajaxCode',
            data:{
                phone:phone
            },
            success:function(data){
                if(data.code==0){
                    that.secondDown('60');
                    
                }

            }
        })
        
    },
    selectTime:function(_this){
        _this.addClass('active').siblings().removeClass('active');
    },
    submitData:function(){
        var checks=[this.checkCarModel,this.checkCity,this.checkPhone,this.checkCode];
        var ctrl=true;
        var data=[];
        $.each(checks,function(index,check){
            var content=check();
            var flag=!content;
            if(flag){
                
                ctrl=false;
                return false;
            }else{
                data[index]=content;
            }
        });
        if(!ctrl){
            return;
        }
        var timeId=$('#times .active').text(),
            model=data[0],
            province=$('#province').val(),
            city=$('#city').val(),
            phone=$('.phone-input').val(),
            other=$('#phone-text').val(),
            code=$('.ma-input').val();
        $.ajax({
            url:window.URL.home+"?c=dealerwish&a=add",
            type:'post',
            data:{
                model:model,
                proid:province,
                cityid:city,
                desc:other,
                phone:phone,
                code:code,
                time:timeId

            },
            success:function(ms){
                if(ms>0){
                    ga('send', 'event', 'purchase_wish', 'submit_wish',phone);
                    window.location.href=window.URL.home+"?c=dealerwish&a=success";
                }else{
                    alert('该区域无可用经销商，请选择其它区域。');
                }
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
        }
    },
    selectModel:function(_this){
        var subbrandid = _this.val();
        $.getJSON(
             window.URL.home+'?c=dealerwish&a=getList',
            {'subbrandid': subbrandid,'opt':'series'},
            function (data) {
                var html = '<option value="">车系</option>';
                if(data.data != '' ){
                    $.each(data.data, function(key, obj){
                        html += '<option value="' + obj['id'] + '">' + obj['serieName'] + '</option>';
                    });
                }
                _this.siblings('.s_serie_id').html(html); 
            }
        );
    },

    carModel:function(_this){
        var seriesid = _this.val();
        $.getJSON(
            window.URL.home+'?c=dealerwish&a=getList',
            {'seriesid': seriesid,'opt':'car'},
            function (data) {
                var html = '<option value="">车型</option>';
                if(data.data != '' ){
                    $.each(data.data, function(key, val){
                        $.each(val,function(kk,obj){
                            html += '<option value="' + obj['id'] + '">' + obj['year'] + '款 &nbsp;&nbsp;&nbsp;&nbsp;'+obj['autoName'] + '</option>';
                        })
                    });
                }
                _this.siblings('.s_car_id').html(html);
            }
        );
    }

});

return Me;
