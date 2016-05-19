var utils=require('common:widget/ui/base/utils.js');
var slide={
    init:function(datas){
        this.datas=datas||[];
        if(!this.datas.length)return;
        this.bigData=this.datas[0];
        this.smallDatas=this.datas.splice(1);
        this.$el=$('.detail-slide');
        this.$bidImg=$('.detail-img');
        this.$mainImg=$('.bigImg-main');
        this.$subImg=$('.bigImg-sub');
        this.$imgUl=$('.detail-list');
        this.buildBigDom();
        this.buildSmallDom();
        this.bindEvent();

    },
    buildBigDom:function(){
        this.$mainImg.empty();
        var item= this.bigData;
        var bigImg=utils.creatImage(item,item.bigUrl,{
            loadHandler:function(){
                utils.zoomImg(this);
            }
        });
        $(bigImg).hide();
        this.$mainImg.append(bigImg);
    },
    buildSmallDom:function(){
        var that=this;
        var fragment=document.createDocumentFragment();
        $(this.smallDatas).each(function(i,item){
            var $li=$('<li index="'+i+'"></li>');
            var img=utils.creatImage(item,item.smallUrl,{
                loadHandler:function(){
                    utils.zoomImg(this);
                }
            });
            $(img).hide();
            $li.append(img).appendTo(fragment);
        });
        this.$imgUl.append(fragment);

    },
    moveIn:function(index){
        this.currentIndex=index;
        this.$subImg.empty();
        var item=this.smallDatas[index];
        var bigImg=utils.creatImage(item,item.bigUrl,{
            loadHandler:function(){
                utils.zoomImg(this);
            }
        });
        $(bigImg).hide();
        this.$subImg.append(bigImg);
        this.$mainImg.addClass('hidden');
        this.$subImg.removeClass('hidden');
    },
    moveOut:function(){
        this.$mainImg.removeClass('hidden');
        this.$subImg.addClass('hidden');
    },
    bindEvent:function(){
        var that=this;
        this.$el.on('mouseenter','.detail-list li',function(){
            that.moveIn($(this).attr('index'));
        });
        this.$el.on('mouseleave','.detail-list li',function(){
            that.moveOut();
        });

    }
};
return slide;