var MapPop=require('gmall:widget/mappop/mappop.js');
var endDown=require('common:widget/ui/plugin/countdown.js');
var base=require('common:widget/ui/base/base.js');
var utils=require('common:widget/ui/base/utils.js');
var cacheModel=require('../cacheModel.js');
var Gid=emao.carInfo.id;

var info={
    init:function(){
        if(this.inited)return;
        $('.detail-ctbox').css('min-height',$('.detail-lf').height());
        this.$color=$('.choose-color .item');
        this.$payType=$(".payType");
        this.$address=$('.address');
        this.matrixKey=emao.matrixKey;
        this.noneCls='nonePart';
        this.splitStr='_';
        this.group={};
        this.initGroupData();
        this.bindEvent();
        this.updataColorSelect();
        //this.getPageData();
        this.getNowTime();
        this.updataPayTypeSelect();
        this.initArea();
        this.initTuanInfo();


        this.inited=true;
    },
    initArea:function(){
        var that=this;
        $.ajax({
            url:'http://mall.api.emao.com/newcar/public/?c=location/ip&a=getareabyip',
            dataType:'jsonp'
        }).then(function(data) {
                if(data.code !== 0||!data.data)return;
               if(!emao.points.city[data.data.provinceId])return;
               if(!emao.points.dealer[data.data.cityId])return;
               that.changeProvince({
                   provinceId:data.data.provinceId,
                   cityId:data.data.cityId
               });
        })
    },
    initTuanInfo:function(){
        var that=this;
        var $progressBox=$('.progress-box');
        $.ajax({
            url:'/?c=goods&a=gettuan',
            data:{id:emao.carInfo.id},
            success:function(data){
                data.data&&that.updataTuanInfo(data.data);
                data.data&&that.upDataPerson(data.data);
                if(data.data&&data.data.__isTuan){
                    //$progressBox.addClass('tuan-succes');
                }
            }
        })
    },
    updataTuanInfo:function(data,emaoprice){
        data=data||{};
        var $priceDiscount=$('.priceDiscount'),$priceAdd=$('.priceAdd');
        if(emaoprice){
            $priceDiscount.attr('price',emaoprice);
        }
        if(data.__emaodiscount){
            $priceDiscount.attr('discount',data.__emaodiscount);
        }
        if(data.__coupdiscount){
            $priceAdd.attr('add',data.__coupdiscount);
        }
        $priceDiscount.each(function(){
            var discount=$(this).attr('discount')||0;
            var price=$(this).attr('price')||0;
            discount=discount-0;
            price=price-0;
            $(this).html(utils.fprice(price-discount));
        });
        $priceAdd.each(function(){
            var add=$(this).attr('add')||0;
            var price=$(this).attr('price')||0;
            add=add-0;
            price=price-0;
            $(this).html(price+add);
        });
    },
    upDataPerson:function(data) {
        var $Hasperson = $('.tuan-over em');
        var $tuanOver = $('.tuan-over');
        var $curTuan = $('.cur-tuan');
        var $progressBar = $('.progress-hui .progress-bar');
        var percentRed=data.groupNum/data.maxGroupnum*100;
        $Hasperson.text(data.groupNum);
        $curTuan.text(data.groupNum);
        $tuanOver.css('left',percentRed+'%');
        $progressBar.css("width",percentRed+'%');
    },
    getNowTime:function(){
        $.ajax({
            url:window.URL.home+'?c=server&a=curtime',
            dataType:'jsonp'
        }).then(this.updataNowTime.bind(this),this.updataNowTime.bind(this));
    },
    updataNowTime:function(json){
        var that=this;
        var time=json&&json.data&&json.data.format1;
        if(time){
            $('.time-shi').attr('nowTime',time);
        }
        $('.time-txt').endDown(function(){
            this.$el.parents('.time-out').html('<i></i>已结束');
        });
    },
    getNoColorTpl:function(data){
        var noTpl=['<div class="sold-out">',
            '<div class="color-box color',data.color,'"></div>',
            '<div class="sold-bg"></div>',
            '<div class="sold-zi">售罄</div>',
            '</div>'].join('');
        return noTpl
    },
    getPageData:function(){
        $.ajax({
            url:window.URL.home+'?c=server&a=getAutoAmountByGids',
            dataType:'jsonp',
            data:{
                gids:Gid
            }
        }).then(this.updataPageData.bind(this),this.updataPageData.bind(this));
    },
    updataPageData:function(json){
        var data=json&&json.data&&json.data[Gid];
        var that=this;
        if(data){
            $(data.amount).each(function(){
                var $el=$('#color-'+this.color);
               if(this.number>0){
                   $el.find('.amount').html(this.number);
               }else{
                   $el.html(that.getNoColorTpl(this));
               }

            });
            if(data.__saleState){
                $('.dl-submit')
                    .removeClass('goods-type-1')
                    .removeClass('goods-type-2')
                    .removeClass('goods-type-3')
                    .removeClass('goods-type-4')
                    .addClass('goods-type-'+data.__saleState);
            }
        }

        this.updataColorSelect();
    },
    getPointData:function(id){
        var cityId=$('#cityId').val();
        var points=emao.points.dealer[cityId];
        id=id||$('#dealerid').val();
        for(var i in points){
            if(points[i].dealerid==id){
                points[i].index=i;
                return points[i];
            }
        }
    },
    bindEvent:function(){
        var that=this;
        $(".showMap").on("click",function(){
           var map= new MapPop(that.getPointData());
            map.show();
        });
        $('.choose-color').on('click','.item a',function(){
            $('.choose-color .item').removeClass('selected');
            $(this).parent().addClass('selected');
            that.updataColor();
        });
        $('.parts-item').on('click',function(){
            if($(this).hasClass('selected'))return;
            var groupId=$(this).attr('groupId');
            var id=$(this).attr('partid');
            that.setGroupData(id,groupId);
        });

        this.$payType.click(function(){
            that.updataPayType()

        })
        $('#autoId').on("change",function(){
            var id=$(this).val();
            $(emao.goodsAuto).each(function(i,item){
                if(item[0].autoId==id){
                   that.updataColorsTpl(item);
                }
            });
            $.ajax({
                url:'/ajax/auto/param/',
                data:{
                    id:id
                },
                success:function(data){
                    $('.autoparam').html(data);
                }
            })

        });
        if($('#autoId')[0]){
            $('#autoId')[0].selectedIndex=0
        }
        $('#provinceId').on("change",this.changeProvince.bind(this));
        $('#cityId').on("change",this.changeCity.bind(this));


    },
    initGroupData:function(){
      var that=this;

      $('.dl-group').each(function(){
          var groupId = $(this).attr('groupId');
          that.group[groupId]=new base.listModel();
          $(this).find('.parts-item').each(function(i,item){
              var id=$(this).attr('partid');
              that.group[groupId].push({id:$(this).attr('partid')});
              that.isSelectId(id)&&(that.group[groupId].selectId=id);
          })
      });
      this.updataMatrix();
    },
    setGroupData:function(id,groupId){
        if(!this.group[groupId])return;
        this.group[groupId].selectId=id;
        this.updataMatrix(this.getMatrixKey())
    },
    isSelectId:function(id,matrixKey){
        matrixKey=matrixKey||this.matrixKey;
        var list=matrixKey.split(this.splitStr);
        for(var i=0;i<list.length;i++){
            if(list[i]==id)return id;
        }
        return false;
    },
    getMatrixKey:function(id,groupId){
        var list=[];
        for(var k in this.group){
            var item=(groupId&&groupId==k)?id:this.group[k].selectId;
            list.push(item-0);
        }
        return list.sort(function(a,b){return a-b}).join(this.splitStr);
    },
    updataMatrix:function(matrixKey){
        matrixKey=matrixKey||this.matrixKey;
        this.matrixKey=matrixKey;
        if(!matrixKey)return;
        var that=this;
        $('.parts-item').each(function(i,item) {
                var groupId = $(this).attr('groupId');
                var id = $(this).attr('partid');
                var selectId=that.group[groupId].selectId;
                var mdata = emao.matrix[that.getMatrixKey(id,groupId)] || {};
                    mdata.num=mdata.num||0;
                    mdata.num=mdata.num-0;
                $(this).removeClass('selected');
                $(this).removeClass(that.noneCls);
            selectId == id ? $(this).addClass('selected') : $(this).removeClass('selected');
            (mdata.num && mdata.num > 0) ? $(this).removeClass(that.noneCls) : $(this).addClass(that.noneCls);
        });
        var data=emao.matrix[this.matrixKey]||{};
        $('input[name="partsid"]').val(matrixKey);
        that.updataColorNumTpl(data.num-0);
        if(typeof data.price=="undefined")return;
        that.updataPrice(data.price);

    },
    changeProvince:function(e){
        e=e||{};
        var id= e.provinceId||$('#provinceId').val();
        $('#provinceId').val(id);
        var citys=emao.points.city[id];
        var html='';
        for(var i=0;i<citys.length;i++){
            html+='<option value="'+citys[i].cityId+'">'+citys[i].cityName+'</option>'
        }
        var cityId= e.cityId||citys[0].cityId;
        $('#cityId').html(html).val(cityId);
        this.changeCity();
    },
    changeCity:function(){
        var id=$('#cityId').val();
        var dealers=emao.points.dealer[id];
        var html='';
        for(var i=0;i<dealers.length;i++){
            html+='<option value="'+dealers[i].dealerid+'">'+dealers[i].name+'</option>'
        }
        $('#dealerid').html(html).val(dealers[0].dealerid);
    },
    updataColorsTpl:function(item){
        emao.colors=item;
        var tpl='';
        $(item).each(function(i,color){
            color.number=color.number-0;
            tpl+='<div id="color-'+color.color+'" data-id="'+color.color+'"  class="'+(color["default"]==1?"selected":"")+' item">';
            tpl+='<a href="javascript:void(0)" class="color-box color'+color.color+'">';
            tpl+='</a>';
            tpl+='<div class="car-amount none">'+color.colorName;
            tpl+='</div></div>';
        });
        $('.choose-color').html(tpl);
        this.updataColor();
    },
    updataColorNumTpl:function(number){
      var $num=$('.dl-number dd');
        var num =number|| 0,
            html=num>0?'还剩'+number+'辆':'售罄';
        if(num>0&&emao.carInfo.stockType==2){
            html=num>10?'现车充足':'少量现车';
        }
        $num.html(html).attr('num',num);
    },
    updataPayTypeSelect:function(){
        var id=cacheModel.get('depositId');
        if(id){
            $("input[name='depositId'][value='"+id+"']").attr('checked','checked');
            this.updataPayType()
        }
    },
    updataPayType:function(){
        var id=$("input[name='depositId']:checked").val();
        var data=this.getPayTypeData(id);
        if(!data||!data.giftInfo)return;
        $('.gift-desc').html(data.giftInfo.name);
        data.giftInfo.name?$('.dl-gift').show():$('.dl-gift').hide();
    },
    getDefaultColor:function(id){
        var colors=emao.colors;
        if(id){
            return this.getColorData(id);
        }
        var defemaoPrice=emao.carInfo.defemaoPrice;
        for(var i in colors){
            colors[i].index=i;
            if(colors[i]["default"]==1){
                return colors[i];
            }
        }
        return colors[0];
    },
    updataColorSelect:function(){
      var data=this.getDefaultColor(cacheModel.get("color"));
        if(!data)return;
        this.$color.removeClass('selected');
        this.$color.eq(data.index).addClass('selected');
        this.updataColor();

    },

    getColorData:function(id){
        var colors=emao.colors;
        for(var i in colors){
            if(colors[i].color==id){
                colors[i].index=i;
                return colors[i];
            }
        }
    },
    getPayTypeData:function(id){
        var deposit=emao.deposit;
        for(var i in deposit){
            if(deposit[i].id==id){
                return deposit[i];
            }
        }
    },
    updataPrice:function(price,guidePrice){
        price=price-0;
        if(typeof price =="number"){
            $('.emaoprice strong').html(utils.fprice(price,0));
            $('.emaoprice em').html(utils.fprice(price,1));
            $('.car-price2 .emaoprice').html(utils.fprice(price));
            $('.fullprice').html(''+utils.fprice(price));
        }
        if(guidePrice){
            $('.guidePrice').html(guidePrice);
        }
        this.updataTuanInfo(null,price);
    },
    updataColor:function(){
        var id=$('.choose-color').find('.selected').attr('data-id');
        var data=this.getColorData(id);
        if(!data)return;
        this.updataColorNumTpl(data.number);
        this.updataPrice(data.price,data.guidePrice);
    }

};
return info;