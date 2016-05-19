var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var key='noRedirect';
var footer={
    init:function(){
      $('.btn-pc').on('touchstart',function(){
          $.cookie(key,'1',{path: '/','domain':'emao.com'});
      });
    }
};
return footer;/**
 * Created by xiaochao on 2015/6/17.
 */
