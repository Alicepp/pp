var Pop=require('common:widget/pop/pop.js');
var base=require('common:widget/ui/base/base.js');
var log=base.log;
var utils=base.utils;
var volumepop={
    cls:'pop-volume',
    alert:function(num){
        var tpl=[
            '<span class="msg-tit"><span class="cardnum num-red">'+num+'</span>券号无效</span><br/> ',
            '<span class="msg-tip">请检验您输入是否正确或致电一猫客服进行查询<br/>',
                '客服电话：400-890-3881</span>'].join('');
        var pop=new Pop({msg:tpl,cls:this.cls});
        pop.show();
        return pop
    }
};
return volumepop;
