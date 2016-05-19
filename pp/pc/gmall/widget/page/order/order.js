var jqui=require('common:widget/ui/plugin/jquery-ui/jquery-ui.js');
var pop=require('gmall:widget/page/order/volumepop.js');
var base=require('common:widget/ui/base/base.js');
var log=base.log;
var utils=base.utils;
window.pop=pop;
// /身份证省的编码
var vcity={ 11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古", 
        21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏", 
        33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",
        42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆", 
        51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃", 
        63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外" 
       }; 
var order = {
    init:function(ticket){
        this.$inputs=$('.vol-inputs input');
        this.$volUl=$('.vol-list');
        this.volModel=new base.listModel(ticket||[],'sn');
        this.maxVolumeNum=$('.order-volume').attr('maxNum')||0;
        this.maxVolumeNum=this.maxVolumeNum-0;
        $("#calendarDate").datepicker({
            dateFormat:'yy-mm-dd',
            minDate:new Date
        });
        this.liTpl='<li id="<%this.sn%>"><%this.sn%><span class="sn-del">删除</span></li>';
        this.liTpl=['<li class="<%if(this.selected){%>choose<%}else{%>unchoose<%}%>"  id="<%this.sn%>">',
            '<div class="li-volNum">',
            '<%this.name%>',
            '</div>',
            '<div class="li-volVal flex1">',
            '抵<%if(this.useScene==1){%>线上<%}else{%>线下<%}%>',
            '<span class="num-red"><%this.price%>元</span>',
            '</div>',
            '<div class="li-choose"></div>',
            '</li>'].join('');

        this.liFun=utils.tplEngine(this.liTpl);
        this.bindEvent();
        this.updataVol();
    },
    bindEvent:function(){
        var that=this;
        $('.sub-btn').on('click',function(){
            var $el=$(this);
        	var gType = $('#gType').val();
        	var goodsId = $('#goodsId').val();
        	var colorId = $('#colorId').val();
        	var pointId = $('#pointId').val();
        	var formHash = $('#formHash').val();
        	var partsid = $('#partsid').val();
        	var IDcard = $('#IDcard').val();
        	var depositId = $('#depositId').val();
            var autoId = $('#autoId').val();
            var planFetchTime = $('#calendarDate').val();
            var bankId=$('#bankId').val();
            var loanRatio=$('#loanRatio').val();
            var firstPay=$('#firstPay').val();
            var stag=$('#stag').val();
            var cityId=$('#cityId').val();
            var dealerid=$('#dealerid').val();
            var demand=$('#demand').val();
            that.verify();
            if(that.verify() == false){
                $el.tip('请完善标*的信息',3);
                return false
            };
            that.PersonValue(IDcard);
            if(that.PersonValue(IDcard) == false) {
                $el.tip('请输入正确的身份证号',3);
                return false
            };
            if(that.isAjaxing)return;
            that.isAjaxing=true;
            $.ajax({
		        type: 'post',
		        url: window.URL.home+'/order/submit/',
		        data: {
		        	goodsId:goodsId,
		        	color:colorId,
		        	uName:that.userName,
		        	tel:that.phoneNumber,
		        	idNumber:IDcard,
		        	point: pointId,
		        	gType:gType,
		        	formhash:formHash,
                    partsid:partsid,
		        	depositId:depositId,
                    autoId:autoId,
                    sns:that.getSns(),
                    planFetchTime:planFetchTime,
                    bankId:bankId,
                    loanRatio:loanRatio,
                    firstPay:firstPay,
                    stag:stag,
                    cityId:cityId,
                    dealerid:dealerid,
                    remark:demand



		        },
		        dataType: 'json',
		        success: function(data){
                    that.isAjaxing=false;
		        	if(data.code == 0){
                        //log.ga2(goodsId);
		        		window.location.href = window.URL.home+"pay/xianshitemai/step-2/"+data.data +"/";
		        	}else if(data.code == 400803){
                        pop.alert(data.data.join(','));
                        $(data.data).each(function(){
                            that.selectVol(this.sn,false);
                        });
                        return;

                    }else{
                        $el.tip(data.msg,3);
		        	}
		        },
		        error: function(data){
                    that.isAjaxing=false;
                    $el.tip("网络异常！",3);
		        }
		    });
            return false;
        });
        $('#username,#phoneNumber,#IDcard').blur(function(){
        	var IDcard = $('#IDcard').val();
            that.verify();
            if(that.verify() == false) return false;
            that.PersonValue(IDcard);
            if(that.PersonValue(IDcard) == false) return false;
            return false;
        });
        this.$inputs.on('keyup',function(){
            that.inputChange(this);
        });
        this.$inputs.on('change',function(){
            that.inputChange(this);
        });
        $('.vol-sure').click(function(){
            var num=that.getInputsVal();
            if(num.length<16){
                $(this).tip('请输入完整的券号',3);
                return;
            }
            $.ajax({
                url:'/order/ticket/check/',
                type:'post',
                data:{
                    consumerId:emao.consumerId,
                    goodsId:emao.goodsId,
                    sn:num
                },
                success:function(json){
                    if(json.code==0){
                        that.addVol(json.data);
                    }else{
                        pop.alert(that.getShowNum(num));
                    }
                    that.$inputs.val('');
                }
            })

        });
        $('.volume-tit').click(function(){
           $(this).parents('.order-volume').toggleClass('expand');
        });
        this.$volUl.on('click','.sn-del',function(){
            var sn=$(this).parents('li').attr('id');
            that.delVol(sn);
        });
        this.$volUl.on('click','li',function(){
            var sn=$(this).attr('id');
            that.selectVol(sn,$(this).hasClass('unchoose'));
        });
    },
    selectVol:function(sn,tag){
        var list=this.getSelectedVolModel();
        if(tag&&list.length>=this.maxVolumeNum){
            $.alert('最多使用'+this.maxVolumeNum+'张优惠券');
            return;
        }
        var data=this.volModel.getData(sn);
        if(tag&&!this.checkMixed(data,list)){
            $.alert('该批次优惠劵禁止混用');
            return;
        }
        if(tag&&!this.checkOverlap(data,list)){
            $.alert('该批次优惠劵禁止叠加');
            return;
        }
        data.selected=!!tag;
        this.updataVol();
    },
    checkAllMixed:function(data,list){
        var batchId=data.batchId;
        if(data.isMixed!=2)return true ;
        list=list||this.getSelectedVolModel();
        for(var i=0;i<list.length;i++){
            if(list[i].batchId!=batchId)return false;
        }
        return true;

    },
    checkMixed:function(data,list){
        var batchId=data.batchId;
        if(data.isMixed!=2)return true ;
        list=list||this.getSelectedVolModel();
        for(var i=0;i<list.length;i++){
            if(list[i].batchId!=batchId)return false;
        }
        return true;

    },
    checkAllOverlap:function(data,list){
        var batchId=data.batchId;
        if(data.isOverlap!=4)return true;
        list=list||this.getSelectedVolModel();
        for(var i=0;i<list.length;i++){
            if(list[i].batchId==batchId)return false;
        }
        return true;
    },
    checkOverlap:function(data,list){
        var batchId=data.batchId;
        if(data.isOverlap!=4)return true;
        list=list||this.getSelectedVolModel();
        for(var i=0;i<list.length;i++){
            if(list[i].batchId==batchId)return false;
        }
        return true;
    },
    addVol:function(data){
        if(this.volModel.indexOf(data.sn)>-1){
            $.alert('不能重复添加');
            return;
        }
        this.volModel.add(data);
        this.updataVol();
    },
    delVol:function(sn){
        this.volModel.del(sn);
        this.updataVol();
    },

    updataVol:function(){
        this.updataVolTit();
        this.updataVolList();
        this.updataVolPrice();
    },
    getSns:function(){
        var selectVols=new base.listModel(this.getSelectedVolModel(),'sn');
        return selectVols.getIdstr();
    },
    getOnlineVal:function(){
        var val=0;
        this.volModel.each(function(i,item){
            if(!item.selected)return;
            item.price=item.price-0;
            item.useScene==1&&(val+=item.price);
        });
        return val;
    },
    getOfflineVal:function(){
        var val=0;
        this.volModel.each(function(i,item){
            if(!item.selected)return;
            item.price=item.price-0;
            item.useScene==2&&(val+=item.price);
        });
        return val;
    },

    updataVolPrice:function(){
        var onVal=this.getOnlineVal();
        var offVal=this.getOfflineVal();
        $('.price-online').each(function(i,item){
            var $item=$(item);
            var price=$item.attr('price')-0;
            price=Math.max(price-onVal,0);
            if($item.hasClass('order-sum')){
                $item.find('em').html(utils.formatPrice(price,0));
                $item.find('span').html(utils.formatPrice(price,1));
            }else{
                $item.html(utils.formatPrice(price));
            }
        });
        $('.price-offline').each(function(i,item){
            var $item=$(item);
            var price=$item.attr('price')-0;
            price=Math.max(price-offVal,0);
            $item.html(utils.formatPrice(price));
        });
        $('.price-online-add').each(function(i,item){
            var $item=$(item);
            var price=$item.attr('price')-0;
            var emaoPrice=$item.attr('emaoPrice')-0;
            var tpl='';
            var uprice=Math.max(price+onVal,0);
            if(!$item.hasClass('price-allprice')){
                $item.html(utils.formatPrice(uprice));
                return ;
            }
            if(uprice>0){
                tpl+='（'+emaoPrice+'元';
                price&&(tpl+='-'+price+'元');
                onVal&&(tpl+='-'+onVal+'元');
                tpl+='）';
            }
            $item.html(tpl);
        });
        $('.price-offline-add').each(function(i,item){
            var $item=$(item);
            var price=$item.attr('price')-0;
            price=Math.max(price+offVal,0);
            $item.html(utils.formatPrice(price));
        });

    },
    updataVolTit:function(){
        var onVal=this.getOnlineVal();
        var offVal=this.getOfflineVal();
        var len=this.getSelectedVolModel().length;
        var tpl='共使用了<span class="num-used num-red">'+len+'</span>张优惠券';
        onVal&&(tpl+='，线上可优惠<span class="num-red">'+utils.formatPrice(onVal)+'</span>');
        offVal&&(tpl+='，线下可优惠<span class="num-red">'+utils.formatPrice(offVal)+'</span>');
        $('.vol-info').html(tpl);
        len>=this.maxVolumeNum?$('.vol-line').hide():$('.vol-line').show();

    },
    updataVolList:function(){
        var tpl='';
        var that=this;
        this.volModel.each(function(i,item){
            tpl+=that.liFun(item);
        });
        this.$volUl.html(tpl);
    },
    getSelectedVolModel:function(){
        var list=[];
        this.volModel.each(function(i,item){
            if(item.selected)list.push(item);
        });
        return list;
    },


    getShowNum:function(num){
        return num.match(/\w{4}/g).join('&nbsp;')
    },
    getInputsVal:function(){
        var num='';
        this.$inputs.each(function(){
            num+=$(this).val()||'';
        });
        return num;
    },
    inputChange:function(el){
        var $el=$(el);
        var val=$el.val()||'';
        var reg=/\W/g;
        val=val.replace(reg,'').toUpperCase();
        if($el.index()==0&&val.length==16){
            var numList=val.match(/\w{4}/g);
            this.$inputs.each(function(i,item){
                $(item).val(numList[i]||'');
            });
            return;
        }
        val=val.slice(0,4);
        $el.val(val);
        if(val.length==4){
            $(el).next().focus();
        }
    },
	verify: function(){
		this.phoneRule = /^13[0-9]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$|15[0-3]{1}[0-9]{8}$|15[5-9]{1}[0-9]{8}$|17[0-9]{9}$|14[57]{1}[0-9]{8}$/;
//		this.IDcard = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		this.userName = $('#username').val();
		this.phoneNumber = $('#phoneNumber').val();
//		购车人姓名验证
		if(this.userName == ''){
			$('#username').next().html('<i>* 购车人姓名不能为空</i>');
			return false;
		}
		if(this.userName.length <= 1){
			$('#username').next().html('<i>* 购车人姓名过短</i>');
			return false;
		}else{
			$('#username').next().html('');
		}
		if(this.userName.length > 30){
			$('#username').next().html('<i>* 购车人姓名不能超过30个字符</i>');
			return false;
		}else{
			$('#username').next().html('');
		}
//		手机号码验证
		if (this.phoneNumber == '') {
            $('#phoneNumber').next().html('<i>* 请填写您的手机号</i>');
            return false;
        }
		if (!this.phoneRule.test(this.phoneNumber)) {
            $('#phoneNumber').next().html('<i>* 请输入正确的手机号码</i>');
            return false;
        }else{
			$('#phoneNumber').next().html('');
		}
//      身份证号码验证
//      if (this.IDvalue == '') {
//          $('#IDcard').next().html('<i>* 请填写您的身份证号码</i>');
//          return false;
//      }
//		if (!this.IDcard.test(this.IDvalue)) {
//          $('#IDcard').next().html('<i>* 填写不正确</i>');
//          return false;
//      }else{
//			$('#IDcard').next().html('');
//		}
		
	},
	isCardNo: function(card){
		var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/; 
		if(reg.test(card) === false){ 
		   return false; 
		} 
		return true; 
	},
	checkProvince: function(card){
		var province = card.substr(0,2); 
		if(vcity[province] == undefined){ 
		   return false; 
		} 
		return true;
	},
	checkBirthday: function(card){
		  var that = this;
		  var len = card.length; 
		  if(len == '15'){  
		    var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/; 
		    var arr_data = card.match(re_fifteen); 
		    var year = arr_data[2]; 
		    var month = arr_data[3]; 
		    var day = arr_data[4]; 
		    var birthday = new Date('19'+year+'/'+month+'/'+day); 
		    return that.verifyBirthday('19'+year,month,day,birthday); 
		  } 
		  if(len == '18'){ 
		    var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/; 
		    var arr_data = card.match(re_eighteen); 
		    var year = arr_data[2]; 
		    var month = arr_data[3]; 
		    var day = arr_data[4]; 
		    var birthday = new Date(year+'/'+month+'/'+day); 
		    return that.verifyBirthday(year,month,day,birthday); 
		  } 
		  return false; 
	},
	verifyBirthday: function(year,month,day,birthday){
		  var now = new Date(); 
  		  var now_year = now.getFullYear(); 
		  if(birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day){ 
		  	var time = now_year - year; 
		    if(time >= 3 && time <= 100) 
		    { 
		        return true; 
		    } 
		    return false; 
		  } 
		  return false; 
	},
	checkParity: function(card){
		  var that = this;
		  card = that.changeFivteenToEighteen(card); 
		  var len = card.length; 
		  if(len == '18'){ 
		    var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
		    var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
		    var cardTemp = 0, i, valnum; 
		    for(i = 0; i < 17; i ++){ 
		        cardTemp += card.substr(i, 1) * arrInt[i]; 
		    } 
		    valnum = arrCh[cardTemp % 11]; 
		    if (valnum == card.substr(17, 1)){ 
		        return true; 
		    } 
		    return false; 
		  } 
		  return false; 
	},
	changeFivteenToEighteen: function(card){
		if(card.length == '15'){ 
		    var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
		    var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
		    var cardTemp = 0, i;   
		    card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6); 
		    for(i = 0; i < 17; i ++){ 
		        cardTemp += card.substr(i, 1) * arrInt[i]; 
		    } 
		    card += arrCh[cardTemp % 11]; 
		    return card; 
		  } 
	 	return card;
	},
	PersonValue: function(number){
          return true;
		  var that=this;
		  if(number==""){ 
		    $('#IDcard').next().html('<i>* 请填写您的身份证号码</i>'); 
		    return false; 
		  } 
		 //校验长度，类型   
		  else if(that.isCardNo(number) === false){ 
		    $('#IDcard').next().html('<i>* 填写不正确，如有尾字母请大写</i>');
		    return false; 
		  } 
		 //检查省份 
		  else if(that.checkProvince(number) === false) 
		  { 
		    $('#IDcard').next().html('<i>* 填写不正确，如有尾字母请大写</i>');
		    return false; 
		  } 
		 //校验生日 
		  else if(that.checkBirthday(number) === false) 
		  { 
		    $('#IDcard').next().html('<i>* 填写不正确，如有尾字母请大写</i>');
		    return false; 
		  } 
		 //检验位的检测 
		  else if(that.checkParity(number) === false) 
		  { 
		    $('#IDcard').next().html('<i>* 填写不正确，如有尾字母请大写</i>');
		    return false; 
		  }else{ 
		    $('#IDcard').next().html(''); 
		    return true; 
		  }
	}
};
return order;