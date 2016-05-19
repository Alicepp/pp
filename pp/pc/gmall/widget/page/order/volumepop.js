var Pop=require('common:widget/pop/pop.js');

var volumepop={
    cls:'pop-volume',
    alert:function(num){
        var tpl=[
            '<div class="pop-cont">' ,
            '<div class="pop-head"></div>',
            '<div class="msg-tit">您当前所输入的<span class="cardnum num-red"> '+num+'</span>券号无效 </div>',
            '<p class="msg-tip">请检验您输入是否正确或致电一猫客服进行查询<br/>',
                '客服电话：400-890-3881</p>',
            '<div class="pop-btns">',
            '<span class="pop-btn btn-sure" status="1">确定</span>',
            '</div>',
            '</div>'].join('');
        var pop=new Pop({boxTpl:tpl,isRemove:1,cls:this.cls});
        pop.show();
        return pop
    },
    confirm:function(num,callback){
        var tpl=[
            '<div class="pop-cont">' ,
                '<div class="pop-head"></div>',
                '<div class="msg-tit">您当前所输入的<span class="cardnum num-red"> '+num+'</span>券号无效 </div>',
                '<p class="msg-tip">如需使用，请点确认，不使用请点取消</p>',
                '<div class="pop-btns">',

                '<span class="pop-btn btn-sure" status="1">使用</span>',
                '<span class="pop-btn btn-cancel" status="0">取消</span>',
                '</div>',

            '</div>'].join('');
        var pop=new Pop({boxTpl:tpl,callback:callback,isRemove:1,cls:this.cls});
        pop.show();
        return pop
    }
};
return volumepop;
