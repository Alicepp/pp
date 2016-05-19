var ding={
    init: function(){
        $('.yz-img').click(function(){
            var prevsrc=$(this).attr('prevsrc')||$(this).attr('src');
            $(this).attr('src',prevsrc+'&t='+(new Date).getTime());
        });
        $('.ding-info-box  .col-style').on('click',function(){
            var indexs=$(this).index();
            $(this).addClass('active').siblings().removeClass('active');
            $('.white-car').eq(indexs).show().siblings('.white-car').hide();
        })
        $('.parts-list li').on('click',function(){
            if(!$(this).find('.img-mask').hasClass('cur')&&$('.cur').length>3){
                alert('最多可选择3个配置造车');
                return;
            };
            $(this).find('.img-mask').toggleClass('cur');


            var font=$(this).attr("brief");
            $(".jieshao").text(font);
        })
        $('.wrap-mask').on('click',function(){
            $('.wrap-mask').hide();
            $('.wrap-tip1').hide();
            $('.wrap-tip2').hide();
        })
        $('.design-dl .span-time').on('click',function(){
            $(this).addClass('time-active').siblings().removeClass('time-active');

        });
        var $firstBtn=$('.ding-info-box .pint-info');
        var parts='';
        var pertsImg='';
        var dataInfo='';
        $('.kaizao-btn').on('click',function(){

            ga('send', 'event', 'Dfbz_dz_wap', 'Built');
            var len=$('.parts-list li .img-mask.cur').length;
            if(len == 0){
              $firstBtn.text('亲！配件不能为空');
              $firstBtn.show();
              setTimeout(function () { $firstBtn.hide(); }, 3000);
            }else if(len > 3){
              $firstBtn.text('亲！配件不能大于3个');
              $firstBtn.show();
              setTimeout(function () { $firstBtn.hide(); }, 3000);
            }else{
               $('.wrap-mask').show();
               $('.wrap-mask').css('opacity',0.7);
               $('.wrap-tip1').show();
            }
        })
        $('.wrap-tip1 .tijiao').on('click',function(){
            ga('send', 'event', 'Dfbz_dz_wap', 'Submit');
            var color=$('.ding-info-box .active').text(),
                code=$('.input-code').val(),
                colText=$('.ding-info-box .active').html(),
                carModel='东风标致2008定制版车型',
                takeoutTime=$('.design-dl .time-active').attr('outtime'),
                TimeFont=$('.design-dl .time-active').text(),
                name=$('.input-big[name="name"]').val(),
                phone=$('.input-big[name="phone"]').val(),
                province=$('.input-small[name="province"]').val(),
                reg=/^1[3-8]{1}[0-9]{9}$/,
                city=$('.input-small[name="city"]').val();
                parts='';
                pertsImg='';
            $('.ding-info-box .parts-list').find('li').each(function(index, ele){
                if($(ele).find('.img-mask').hasClass('cur')){
                    parts = parts + '|' + $(ele).find('.img-font').text();
                    pertsImg=pertsImg+'|'+$(ele).find('.img-box').html();
                }
            });
            parts = parts.replace(/^\|/g, '');
            pertsImg = pertsImg.replace(/^\|/g, '');
            var arr = pertsImg.split('|');
            if(name == ''){
                $('.input-big[name="name"]').siblings('.pint-info').show();
                setTimeout(function () { $('.pint-info').hide(); }, 3000);
            }else if( phone == ''){
                $('.input-big[name="phone"]').siblings('.pint-info').show();
                setTimeout(function () { $('.pint-info').hide(); }, 3000);
            }else if( reg.test(phone) == ''){
                $('.input-big[name="phone"]').siblings('.pint-info').find('em').text('请输入正确的手机号');
                $('.input-big[name="phone"]').siblings('.pint-info').show();
                setTimeout(function () { $('.pint-info').hide(); }, 3000);
            }else if(province == '' || city ==''){
                $('.input-small[name="province"]').siblings('.pint-info').show();
                setTimeout(function () { $('.pint-info').hide(); }, 3000);
            }else if( code == ''){
                $('.input-code').siblings('.pint-info').show().delay(3000).hide(300);
            }else{
                var datas={
                    'color' : color,
                    'carModel' : carModel,
                    'parts' : parts,
                    'takeoutTime' : takeoutTime,
                    'name' : name,
                    'phone' : phone,
                    'province' : province,
                    'city' : city,
                    'code' :code
                };
                var dataPhone={
                    phone:phone,
                    classNo:0
                }
                $.ajax({
                    type:"post",
                    url:"/?c=special&a=checkphone",
                    data:dataPhone,
                    dataType:'json',
                    success:function(data){
                        if (data.status == 'success') {
                            $.ajax({
                                type:"post",
                                url:"/?c=special&a=special0805",
                                data:datas,
                                dataType:'json',
                                success:function(data){
                                    if(data.status=='success'){
                                        dataInfo=(data.res.coupon);
                                        //console.log(data.res.coupon);
                                        showInfo();
                                    }else{
                                        if(data.code==100021){
                                            alert('验证码错误')
                                        }else{
                                            data.msg&&alert(data.msg)
                                        }
                                    }
                                }
                            })
                        }else{
                            alert(data.msg);
                        }
                    }

                });

            }
            function showInfo(){
                $('.wrap-tip2 .parts-list').html('');
                $('.wrap-tip1').hide();
                $('.wrap-tip2').show();
                document.getElementsByTagName('body')[0].scrollTop = 0;
                //$('.wrap-tip2 .bg2-car span').text(carModel);
                $('.wrap-tip2 .big1-str em').text(dataInfo);
                $('.wrap-tip2 .bg2-color .col-style').html(colText);
                $('.wrap-tip2 .bg3-name span').text(name);
                $('.wrap-tip2 .bg3-phone span').text(phone);
                $('.wrap-tip2 .bg3-city span').text(province + city);
                $('.wrap-tip2 .bg3-time span').text(TimeFont);
                var html='';
                for(var i=0; i<arr.length; i++){
                    html+='<li><div class="img-box">'+arr[i]+'</div></li>'
                }
                $('.wrap-tip2 .parts-list').html(html);

            }

        });

    }
};
return ding;
