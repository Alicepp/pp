var base=require('common:widget/ui/base/base.js');
var utils=base.utils;
var sidebar=require('common:widget/header/sidebar/sidebar.js');
var header={
    init:function(){
        sidebar.init();
        $('.page-header').swipeLeft(sidebar.sideLeft.bind(sidebar));
        $('.se-link').click(sidebar.sideLeft.bind(sidebar));
        this.setCityCookie();
    },
    setCityCookie:function(){
        if(!window.emao['mall_cityId'])return;
        $.cookie('mall_cityId', window.emao['mall_cityId'], { expires: 1, path: '/' ,domain: 'emao.com'});
    }
};
return header;

