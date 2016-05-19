var utils=require('common:widget/ui/base/utils.js');
var app={
    cData:{},
    time:(new Date).getTime(),
    init:function() {
        if(this.inited)return;
        this.$commentsCount=$('.commentsCount em');
        this.$commentsCount10=$('.commentsCount10 em');
        this.$commentsCount5=$('.commentsCount5 em');
        this.$commentsCount1=$('.commentsCount1 em');
        this.$el = $('#discuss');
        this.goodsId = this.$el.attr('goodsId');
        this.objType = this.$el.attr('objType');
        this.url = '/?c=goods&a=comment&page=1';
        this.getCommentsCount();
        this.bindEvent();
        this.inited=true;


    },
    bindEvent:function(){
        var that=this;
        this.$el.on('click','.home-pag a',function(){
            var url=$(this).attr('url');
            if($(this).hasClass('active')||!url)return false;
            that.showHomePage(url);
            return false;
        });
        this.$el.on('click','.reply-pag a',function(){
            var url=$(this).attr('url');
            var replyId=$(this).parents('.dis-reply').attr('replyId');
            if($(this).hasClass('active')||!url||!replyId)return false;
            that.showReplyPage(url,replyId);
            return false;
        });
        this.$el.on('keyup','.dis-com',function(){
            var count=$(this).val().length;
            $(this).parent().find('.font-num em').text(count);
        });
        this.$el.on('click','.huifu',function(){
            that.checkIfLogin();
            $(this).parents('.dis-item').find('.reply-box').show();
        });
        this.$el.on('click','.dis-haslogin .btn-primary',function(){
            var val=$(this).parents('.dis-haslogin').find('.dis-com').val()||'';
            that.addComment($(this).parents('.dis-haslogin'),'home')

        });
        this.$el.on('click','.dis-reply .btn-primary',function(){

            var $reply=$(this).parents('.dis-reply');
            var replyName=$reply.attr('replyName');
            var replyUserUrl=$reply.attr('replyUserUrl');
            that.addComment($reply,'reply',$reply.attr('replyId'),replyName,replyUserUrl);
        });

        this.$el.on('click','.zan',function(){
            var userid=$('#userID').val();
            if(!userid){
                that.noLoginCallback();
                return;
            }
            if($(this).hasClass('select')||that.isZanIng){
                return;
            }
            var $el=$(this);
            var replyid=$el.parents('.dis-reply').attr('replyid');
            var touserid=$el.parents('.dis-reply').attr('touserid');
            that.isZanIng=true;
            $.ajax({
                url:'/?c=goods&a=support',
                type:'post',
                data:{
                    id:replyid,//评论ID
                    userid:userid,
                    touserid:touserid
                },
                success:function(data){
                    that.isZanIng=false;
                    if(data.code==0){
                        var count=parseInt($el.find('em').text());
                        count=count+1;
                        $el.find('em').text(count);
                        $el.addClass('select');
                    }else{
                        data.msg&&$.alert(data.msg);
                    }

                },
                error:function(){
                    that.isZanIng=false;
                }

            })
        })
        $('.com-score li').on('click',function(){
            var score=$(this).attr('score');
            $(this).addClass('active').siblings().removeClass('active');
            that.showHomePage(null,null,score);
        })

    },
    getCommentsCount:function(){

        var that=this;
        $.ajax({
            url:'/?c=goods&a=commentcount',
            data:{
                objid:this.goodsId
            },
            success:function(data){
                that.$commentsCount.each(function(){
                    $(this).text(data.data.commentsCount);
                });
                that.$commentsCount10.text(data.data.commentsCount10);
                that.$commentsCount5.text(data.data.commentsCount5);
                that.$commentsCount1.text(data.data.commentsCount1);
            }
        })
    },
    getCommentTpl:function(data){
        var str='<div class="dis-reply">'+
        '<div class="dis-item">'+
        '<div class="header"><img src="'+data.avatar+'" alt=""/></div>'+
        '<div class="dis-info">'+
        '<a class="dis-name" href="'+data.userUrl+'">'+data.userName+'</a><i>'+data.time+'</i>'+
        '<p class="satis-extent">满意度：'+data.score+'</p>'+
        '<p class="comment-con">'+data.content+'</p>'+
        '</div>'+
        '</div>'
      return str;
    },
    getReplyTpl:function(data){
        var str='<div class="dis-item">'+
        '<div class="header"><img src="'+data.avatar+'" alt=""></div>'+
        '<div class="dis-info">'+
        '<a class="dis-name" href="'+data.userUrl+'">'+data.userName+'</a>回复<a class="dis-name" href="'+data.replyUrl+'">'+data.replyName+'</a>'+
        '<p class="comment-con">'+data.content+'</p>'+
        '</div>'+
        '</div>'
        return str;
    },
    getLoginInfo:function(){
        return {
            userUrl:this.$el.find('#userUrl').val(),
            avatar:this.$el.find('#userAvatar').val(),
            userName:this.$el.find('#userName').val(),
            userId:this.$el.find('#userID').val()
        }
    },
    noLoginCallback:function(){
        location.href='http://passport.emao.com/login';
    },
    checkIfLogin:function(){
        if(!this.getLoginInfo().userId){
            this.noLoginCallback();
            return false;
        }
        return true;
    },
    checktime:function(i){
        if(i < 10){
            i = '0' + i;
        }
        return i;
    },
    addComment:function($el,tag,replyId,replyName,replyUserUrl){
        if(this.isAdding){
            return;
        }
        this.checkIfLogin();
        var that=this;
        var val=$el.find('.dis-com').val()||'';
        val= $.trim(val);
        var len=val.length;
        var score=$("input[name='score']:checked").val();
        if(len<=0 || len>300){
            $.alert('内容限制1-300个字');
            return;
        }
        this.isAdding=true;
        $.ajax({
            url:tag=='home'?'/?c=goods&a=addcomment':'/?c=goods&a=replycomment',
            type:'post',
            data:tag=='home'?{
                objid:this.goodsId,          //当前评论的商品id
                content:val,                //评论内容
                score:score                 //满意度
            }:{
                commentid:replyId,          //评论ID
                content:val                 //回复内容
            },
            success:function(data){
                that.isAdding=false;
                /*tag=='home'?
                    that.showHomePage(that.url,(new Date).getTime())
                    :that.showReplyPage(that.getReplyUrl(replyId),replyId,(new Date).getTime())
*/
                //console.log(data);
            },
            error:function(){
                that.isAdding=false;
            }
        });
        var scoreList={
            1:'不满意',
            5:'一般满意',
            10:'非常满意'

        }
        var today=new Date();
        var year=today.getFullYear();
        var month=this.checktime(today.getMonth()+1);
        var day=this.checktime(today.getDate());
        var hour=this.checktime(today.getHours());
        var min=this.checktime(today.getMinutes());
        var sec=this.checktime(today.getSeconds());

        var time=year+'-'+month+'-'+day+' '+hour+':'+min+':'+sec;
        var dataList= $.extend({
            score:scoreList[score],
            content:val,
            time:time,
            replyUrl:replyUserUrl,    //被评论的用户的空间
            replyName:replyName        //被评论的用户名
        },this.getLoginInfo());

        if(tag=='home'){
            $el.after(that.getCommentTpl(dataList))
        }else{
            $el.find('.wrap-pin').prepend(that.getReplyTpl(dataList));
        }
        $el.find('.dis-com').val('');
        $el.find('.font-num em').text(0);

    },
    getReplyUrl:function(replyId,page){
        page=page||1;
        var url='/?c=goods&a=reply&commentid='+replyId+'&page='+page
        return url;
    },
    getData:function(url,callback){
        var that=this;
        url=url||this.url;
        callback=callback||function(){};
        if(this.cData[url]){
            callback.call(this,this.cData[url]);
            return;
        }
        $.ajax({
            url:url,
            data:{
                objid:this.goodsId
            },
            cache:false,
            success:function(data){
                that.cData[url]=data||'';
                callback.call(that,that.cData[url]);
            }
        })

    },
    insertHtml:function(data){
        data=data||'';
        this.$el.html(data);
    },
    insertReplyHtml:function(replyId,data){
        data=data||'';
        this.$el.find('#reply-'+replyId).html(data);
    },
    showHomePage:function(url,timestr,score){
        url=url||this.url;
        if(timestr){
            url+='&time='+timestr;
        }
        if(score){
            url+='&score='+score;
        }
        if(this.currUrl==url)return;
        this.currUrl=url;
        this.getData(url,this.insertHtml.bind(this));
    },
    showReplyPage:function(url,replyId,timestr){
        if(timestr){
            url+='&time='+timestr;
        }
        this.getData(url,this.insertReplyHtml.bind(this,replyId));
    },
    show:function(){
        !this.hasShowed&&this.showHomePage();
        this.hasShowed=1;
        this.$el.show();
    }


};
return app;