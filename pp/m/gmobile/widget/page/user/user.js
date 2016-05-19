var base=require('common:widget/ui/base/base.js');
var endDown=require('common:widget/ui/plugin/countdown.js');
var utils=base.utils;
var user={
    init:function(opts){
        opts=opts||{};
        this.listUrl=opts.url||window.URL.user+'?c=users/order&a=lists';
        if(window.location.href.indexOf("ot=3")>0)//如果是巨惠购页面
        {
            this.listUrl+="&ot=3";
        }
        this.bindEvent();
        this.index=10;
        $('.litPrice').litPrice();
        this.codeFormat();
        if($('.ask-online').length){
            BizQQWPA&&BizQQWPA.addCustom({aty: '0', a: '0', nameAccount: 4008903881, selector: $('.ask-online')[0].id});
        }
    },
    bindLoadMore:function(){
        var that=this;
        $(window).scroll(function(){
            var countHigh=$(window).height()+$(window).scrollTop()+20,
                dHigh=$(document).height();
            if(countHigh>dHigh){
                that.loadMore();
            }
        });
        $('.litPrice').litPrice();
    },
    confirm:function(options){
        var that=this;
        var defaults={
            type:'get',
            data:{},
            callback:function(json){
                if(json.code==0){
                    window.location.reload();
                }else{
                    $.alert(json.msg);
                }
            }
        };
        var opts= $.extend(defaults,options);
        $.confirm(opts.msg,function(isTure){
            if(!isTure)return;
            $.ajax({
                url:window.URL.user+opts.url,
                data:opts.data,
                type:opts.type,
                success:function(data){
                    var json = data;
                    if(typeof json === 'string'){
                        try{
                            json = $.parseJSON(json);
                        }catch(e){
                            window.location.reload();
                            return;
                        }
                    }
                    opts.callback(json);
                }
            })

        });
    },
    bindEvent:function(){
        var that=this;
        var $img=$('.hasLoadimg');
        $img.load(function(){
            utils.zoomWapImg(this);
        });
        $img.attr('src',$img.attr('data-src'));
        $('.down-time').endDown(function(){
            this.$el.parent().html('已结束');
        });

        $('.cancel-but').click(function(){
            var orderId=$('.code-box').attr('order-id');
            that.confirm({
                msg:'确定要取消订单吗？',
                url:'?c=order&a=cancel',
                data:{'orderId':orderId},
                callback:function(json){
                    if(json.code>0){
                        window.location.reload();
                    }else{
                        $.alert(json.msg);
                    }
                }
            });


        });
        $('.user-wap').on('click','.btn-cancel',function(){
            var goodsId=$(this).attr('data-id');
            that.confirm({
                msg:'确定要取消关注吗？',
                url:'?c=user/follow&a=followingsetApi',
                data:{'goodsId':goodsId, state:0},
                type:'post'
            });
        });
        $('.user-wap').on('click','.remind-cancel',function(){
            var goodsId=$(this).attr('data-id');
            that.confirm({
                msg:'确定要取消提醒吗？',
                url:'?c=sms&a=smssetApi',
                data:{'goodsId':goodsId,'state':1},
                type:'post'
            });
        });

        $('.refund-sub').click(function(){
            that.refundAjax();
        })
        $('.refund-xiao').click(function(){
            that.refundCancle();

        })
        $('.upload-file').change(this.fileChange.bind(this));
        $('.upload-but').click(function(){
            var VIN=$('input[name="VIN"]').val();
            var addr=$('input[name="addr"]').val();
            var file=$('input[name="file"]').val()||$('input[name="imgsrc"]').val();
            var imgTotal=$('.upload-img').attr('total')||0;
            var reg=/^[a-z0-9]{1,17}$/i;
            if(!VIN){
                $.alert('车架号码不能为空');
                return;
            }
            if(!reg.test(VIN)){
                $.alert('车架号码不能大于17位');
                return;
            }
            if(!addr){
                $.alert('油卡寄送地址不能为空');
                return;
            }
            if(!file){
                $.alert('请上传发票');
                return;
            }
            if(imgTotal>1024*1024*4){
                $.alert('图片不能超过4MB');
                return;
            }
            $.ajax({
                url:window.URL.user+'?c=order&a=invoice',
                type:"post",
                data:new FormData($('.form-piao')[0]),//将表单数据转成data数据
                processData:false, // 告诉jQuery不要去处理发送的数据
                contentType:false, // 告诉jQuery不要去设置Content-Type请求头
                success:function(data){
                    if(data.code>0){
                        $.alert('上传发票成功，正在审核中。。。');
                        window.location.reload();
                    }else{
                       $.alert(data.msg)
                    }
                }
            });
            //$('.form-piao')[0].submit();
        })
        $(".card-quan .copy-code").click(function(event){
            var codeVal=$(this).parents(".card-code").find(".quan-code").text();
            console.log(codeVal);
            //try{
            //    window.clipboardData.setData('Text', codeVal)
            //}catch (e){
            //    alert('复制失败');
            //}
            //that.copyToClipBoard(codeVal);
            //that.copy_clip(codeVal);
            //that.setClipboardText(event,codeVal);
            that.copyToClipboard(codeVal);
        })

        //function getClipboardText(event){
        //    var clipboardData = event.clipboardData || window.clipboardData;
        //    return clipboardData.getData("text");
        //};
        //
        //$(".card-quan .copy-code")[0].addEventListener('paste',function(event){
        //    var event = event || window.event;
        //    var text = getClipboardText(event);
        //
        //    if(!/^\d+$/.test(text)){
        //        event.preventDefault();
        //    }
        //}, false);


    },
    checkImgType:function(fileURL) {
        var right_type = new Array(".jpg", ".jpeg", ".png");
        var right_typeLen = right_type.length;
        var imgUrl = fileURL.toLowerCase();
        imgUrl=imgUrl.replace(/(^\s*)/g, "");//去除行首空格
        imgUrl=imgUrl.replace(/(\s*$)/g, "");//去除行尾空格
        var postfixLen = imgUrl.length;
        var len4 = imgUrl.substring(postfixLen - 4, postfixLen);
        var len5 = imgUrl.substring(postfixLen - 5, postfixLen);
        for (var i = 0; i < right_typeLen; i++) {
            if ((len4 == right_type[i]) || (len5 == right_type[i])) {
                return true;
            }
        }
        return false;
    },
    fileChange:function(e){
        e=e||window.event;
        var $img=$('.upload-img');
        var files= e.target.files;
        var reader=new FileReader();
        var file=files[0];
        //console.log(file.name);
        //if(!this.checkImgType(file.name)){
        //    $.alert("仅支持JPG.JPEG.PNG格式的图片文件!");
        //    $('input[name="file"]').val('');
        //    $img.attr('src', "").hide();
        //    return;
        //}
        //if(file.size>1024*1024*2){
        //    $.alert('图片不能超过4MB');
        //    $('input[name="file"]').val('');
        //    $img.attr('src', "").hide();
        //    return;
        //}
        $img.attr('total',file.size);
        $img.show();
        $img.load(function(){
            utils.zoomWapImg(this);
        });
        reader.onload=function(e){

            $img.attr('src', e.target.result);

            //console.log(e);
            $('.upload-liter').html('点击图片，重新上传');
            $('.img-input-hidden').remove();

        };
        reader.readAsDataURL(file);

    },
    navChange:function(that) {
        that.addClass("active").siblings().removeClass('active')
    },
    loadMore:function(){
        var that=this;
        if(window.isEnd||this.isAjaxing) return;
        this.isAjaxing=true;
        var data={
            pn:this.index,
            rn:10
        }
        $.ajax({
            url:this.listUrl,
            data:data,
            success:function(data){
                var $el=$('.list-con').append(data);
                that.index+=10;
                that.isAjaxing=false;
            }
        })
    },
    refundAjax:function(){
        var orderId=$('.refund-box').attr('order-id'),
            resonId=$('#refund-reason').val(),
            remark=$('.describe').val();
        var data={
            orderId:orderId,
            reasonId:resonId,
            remark:remark
        }
        $.ajax({
            url:window.URL.user+'/?c=order&a=toRefund',
            data:data,
            type:'post',
            success:function(data){
                if(data.code>0){
                    $.alert(data.data);
                    if(window.isGroup){
                        location.href=window.URL.user+'?c=users/order&a=index&ot=3';
                    }else{
                        location.href=window.URL.user+'?c=users/order&a=index';
                    }
                }else{
                    $.alert(data.msg);
                }
            }
        })
    },
    refundCancle:function(){
        var orderId=$('.refund-box').attr('order-id');
        location.href=window.URL.user+"?c=order&a=detail&oId="+orderId;

        //$.ajax({
        //    url:window.URL.user+'/?c=order&a=cancel',
        //    data:{'orderId':orderId},
        //    success:function(data){
        //        if(data.code>0){
        //            $.alert(data.data);
        //            location.href=window.URL.user+"?c=order&a=detail&oId="+orderId;
        //        }else{
        //            $.alert(data.msg);
        //        }
        //    }
        //})
    },
    codeFormat:function(){
        $(".card-quan .quan-code").each(function(i,item){
            var code=$(item).text().replace(/(\w{4})/g,'$1&nbsp;').replace(/&nbsp;$/,"");
            $(item).html(code)
        });
    },
    setClipboardText:function(event, value){
    if(event.clipboardData){
        return event.clipboardData.setData("text/plain", value);
            }else if(window.clipboardData){
        return window.clipboardData.setData("text", value);
        }
    },
    copyToClipboard:function(txt) {
        if (window.clipboardData) {
            window.clipboardData.clearData();
            window.clipboardData.setData("Text", txt);
            alert("复制成功！")
        } else if (navigator.userAgent.indexOf("Opera") != -1) {
            window.location = txt;
            alert("复制成功！");
        } else if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            } catch (e) {
                alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将 'signed.applets.codebase_principal_support'设置为'true'");
            }
            var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
            if (!clip)
                return;
            var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
            if (!trans)
                return;
            trans.addDataFlavor('text/unicode');
            var str = new Object();
            var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
            var copytext = txt;
            str.data = copytext;
            trans.setTransferData("text/unicode", str, copytext.length * 2);
            var clipid = Components.interfaces.nsIClipboard;
            if (!clip)
                return false;
            clip.setData(trans, null, clipid.kGlobalClipboard);
            alert("复制成功！")
        }
    }





}
return user;