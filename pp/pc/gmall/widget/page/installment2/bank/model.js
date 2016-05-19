function PMT(rate,Nper,pv){
    if(!rate)return (pv/Nper);
    return (pv*(rate*Math.pow(1+rate,Nper)))/(Math.pow(1+rate,Nper)-1);
}

function interestAll(rate,Nper,loan,lastPay){//总利息(适用百禄，5050等额本息产品)
    if(!rate)return 0;
    var pv=loan-lastPay/Math.pow(1+rate,Nper);//本金
    return PMT(rate,Nper-1,pv)*(Nper-1)-loan+lastPay
}
function monthPay(rate,Nper,loan,lastPay){//月供(适用百禄，5050等额本息产品)
    var interest=interestAll(rate,Nper,loan,lastPay);
    return (interest+loan-lastPay)/(Nper-1);
}
window.PMT=PMT;
window.interestAll=interestAll;
window.monthPay=monthPay;

var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var Model=base.Model.extend({
    init:function(opts){
        opts=opts||{};
        this.list={};
        this.list.firstPay=new base.listModel(opts.firstPay,'val');
        this.carPrice=opts.carPrice-0;
        this.rateEndTime=opts.rateEndTime;
        this.procedureVal=opts.procedureVal-0;
        this.procedureType=opts.procedureType;
        this.showName=opts.showName;
        if(this.procedureType==2){
            this.procedureVal=this.carPrice*this.procedureVal;
        }
        this.goodInfo=opts.goodInfo;
        //console.log(this.goodInfo);
        this.updateList();
    },
    updateList:function(){
        var data=this.list.firstPay.curr();
        if(this.firstPayVal!==data.val){//init
            this.list.longRatio=this.getlongRatio(data);
            //console.log(this.list.longRatio);
            this.list.stagEnum=new base.listModel(data.stagEnum);
        };
        this.firstPayVal=data.val;
        this.calc();
    },
    getlongRatio:function(data){
        if(data.newLongRatio){
            return data.newLongRatio;
        }
        var longRatio=data.longRatio||[];
        data.newLongRatio=new base.listModel([]);
        if(!longRatio.length){
            return data.newLongRatio;
        }
        var maxVal=Math.max.apply(Math,longRatio);
        var minVal=Math.min.apply(Math,longRatio);

        var step=0.1;
        for(var i=minVal;i<=maxVal;i+=step){
            data.newLongRatio.push(i);
        }
        if(maxVal<i){
            data.newLongRatio.push(maxVal);
        }
        return data.newLongRatio;
    },


    calc:function(){
        //console.log(this.list.firstPay.curr());
        var firstPay=this.list.firstPay.curr().val,
            longRatio=this.list.longRatio.curr()||0,
            stagEnum=this.list.stagEnum.curr().val,
            firstPaySign=this.list.firstPay.curr().sign,
            stagEnumSign=this.list.stagEnum.curr().sign;
        var rate=this.list.stagEnum.curr().rate-0;
            rate=rate/12;
        var free=this.list.stagEnum.curr().free-0;
        var endtime=this.list.stagEnum.curr().endtime;
        var showName=this.showName;

        firstPay=firstPay-0;
        longRatio=longRatio-0;
        rate=rate*100;
         var loan=(1-firstPay).toFixed(2);
         var loanPrice=this.carPrice*loan;//贷款金额
         var lastPrice=this.carPrice*longRatio;//尾款金额
         var rateVal=rate/100;
        stagEnum=stagEnum-0;

/*        loanPrice=70000;
        rateVal=0.9/100;
        stagEnum=24;
        lastPrice=30000;*/

        //var monthpay=(loanPrice*rateVal*Math.pow((1+rateVal),stagEnum-1)-lastPrice*rateVal)/(Math.pow(1+rateVal,stagEnum-1)-1);
        //var totalInter=monthpay*(stagEnum-1)+lastPrice-loanPrice;//总利息

        var monthpay=monthPay(rateVal,stagEnum,loanPrice,lastPrice);//月供
        var totalInter=interestAll(rateVal,stagEnum,loanPrice,lastPrice);//总利息

        var totalCosts=totalInter+this.procedureVal;//总成本
        var monthCosts=totalInter/(stagEnum-1);//月利息
        //console.log(rate,free);
        //console.log(monthpay);
        var data={
            firstpay:utils.fprice(this.carPrice*firstPay,undefined,3),//首付
            loanpay:utils.fprice(loanPrice-lastPrice,undefined,3),//贷款显示值（去除了尾款）
            lastpay:utils.fprice(this.carPrice*longRatio,undefined,3),//尾款
            firstpercent:firstPay*100,//首付百分比
            lastpercent:longRatio*100,//尾款百分比
            lastsmall:longRatio,//尾款小数点
            stagEnum:stagEnum-0,//期数
            loan:loan*100,//贷款百分比
            carPrice:utils.fprice(this.carPrice),//总车价
            ratepercent:(rate*12).toFixed(2),//年利率
            procedureVal:this.procedureVal,
            procedureTxt:utils.fprice(this.procedureVal),//手续费
            endtime:endtime,                //截止时间
            firstPaySign:firstPaySign,      //首付款下标
            stagEnumSign:stagEnumSign,     //期数下标
            monthpay:monthpay.toFixed(2), //月供
            daypay:(monthpay/30).toFixed(2), //日供
            totalInter:totalInter.toFixed(2),//总利息
            totalCosts:totalCosts.toFixed(2),//总成本
            monthCosts:monthCosts.toFixed(2),//月利息
            showName:showName

        };
        this.dispatchEvent('model.change', {data: data});
    },
    prev:function(listKey){
        var listItem=this.list[listKey];
        if(!listItem)return;
        listItem.prev();
        this.updateList();
    },
    next:function(listKey){
        var listItem=this.list[listKey];
        if(!listItem)return;
        listItem.next();
        this.updateList();
    }
})
return Model;