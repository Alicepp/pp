var gId=emao.carInfo.id;
var formhash=emao.carInfo.formhash;
var share = {
    init: function (list) {
        list=list||[{}];
        this.$el=$('.share-item');
        this.$attention=$('.attention');

        window._bd_share_config = {
            "common": {
                "bdSnsKey": {},
                "bdText": "",
                "bdMini": "2",
                "bdMiniList": false,
                "bdPic": list[0].bigUrl,
                "bdStyle": "1",
                "bdSize": "24"
            }, "share": {}
        };
        $.cachedGetScript('http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5));
        this.initBtn();
        this.bindEvent()

    },
    initBtn:function(){
        $.ajax({
            type: "post",
            url: window.URL.home+"?c=common/following&a=getState",
            data:{'gId':gId,formhash:formhash},
            beforeSend: function(xhr) {
                xhr.setRequestHeader("X_Requested_With","XMLHttpRequest");
            }
        }).then(this.updataAttentionBtn.bind(this));
    },
    updataAttentionBtn:function(data){
        if(data.code==0){
            this.$attention.removeClass('attention');
            this.$attention.addClass('attentioned').text('取消关注');
        }else{
            this.$attention.removeClass('attentioned');
            this.$attention.addClass('attention').text('关注');
        }
    },
    updataUnAttentionBtn:function(data){
        if(data.code==0){
            this.$attention.removeClass('attentioned');
            this.$attention.addClass('attention').text('关注');
        }else{
            this.$attention.removeClass('attention');
            this.$attention.addClass('attentioned').text('取消关注');
        }
    },
    bindEvent:function(){
        var that=this;
        this.$el.on('click','.attention',function(){
            var $el=$(this);
            if(that.doing||$(this).hasClass('attentioned'))return;
            that.doing=true;
            $.ajax({
                type: "post",
                url: window.URL.home+"?c=common/following&a=doFollowing",
                data:{'gId':gId,formhash:formhash},
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("X_Requested_With","XMLHttpRequest");
                }
            }).then(function(data){
                that.doing=false;
                if(data.code==9999){
                    location.href='http://i.emao.com/?act=login&callbackUrl='+encodeURIComponent(location.href);
                    return;
                }
                that.updataAttentionBtn(data);
            });
        });
        this.$el.on('click','.attentioned',function(){
            var $el=$(this);
            if(that.doing||$(this).hasClass('attention'))return;
            that.doing=true;
            $.ajax({
                type: "post",
                url: window.URL.home+"?c=common/following&a=undoFollowing",
                data:{'gId':gId,formhash:formhash},
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("X_Requested_With","XMLHttpRequest");
                }
            }).then(function(data){
                that.doing=false;
                if(data.code==9999){
                    location.href='http://i.emao.com/?act=login&callbackUrl='+encodeURIComponent(location.href);
                    return;
                }
                that.updataUnAttentionBtn(data);
            });
        })
    }
}
return share;