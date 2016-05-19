fis.config.merge({
    namespace : 'huodong',
    roadmap:{
        domain:'http://s.emao.net/tmall/build/m'
    }
});
var pack={
    'static/tar/huodong.css' : [
        /\/static\/lib\/css\/global\.(css|less)/i
        ,/\/widget\/(?!(page\/)).*\.(css|less)/i
    ],
    'static/tar/huodong.js' : [
        /\/widget\/(?!(page\/)).*\.js/i,

    ]
};
function toPack(pageName){
    var cssKey='static/tar/'+pageName+'.css';
    var cssReg=new RegExp("/widget/page/"+pageName+"/.*\\.(css|less)","i");
    var jsKey='static/tar/'+pageName+'.js';
    var jsReg=new RegExp("/widget/page/"+pageName+"/.*\\.js","i");
    pack[cssKey]=[cssReg];
    pack[jsKey]=[jsReg];
}
var pages=['czrbl087','ding150731','pei150804','cdcz0828','ding150908'];
pages.forEach(function(item){
    toPack(item);
});
fis.config.set('pack', pack);




