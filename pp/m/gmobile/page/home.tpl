{%extends file="common/page/layout.tpl"%}
{%block name="block_assign"%}
{%$bodyCls='body-bg'%}
{%$hasDownBar=1%}
{%$noHeadBorder=1%}
{%$pageId='home'%}
{%$groupLink=('/city/'|cat:$tplData.curCity.pinyin|cat:'/juhuigou/list-0-1.html')%}
{%$navData=[]%}

{%if count($tplData.goodsEmao.data)>3%}
    {%$k=array_push($navData,[
        'isLevel'=>1,
        'id'=>'zxcar',
        'tit'=>'特卖车',
        'tpl'=>'hotcar',
        'color'=>'#ed3f36',
        'goods'=>$tplData.goodsEmao.data,
        'len'=>count($tplData.goodsEmao.data),
        'searchurl'=>{%get_searchurl carFrom=1%}
    ])%}
{%/if%}

{%if count($tplData.goodsCon.recommend)>3%}
    {%$k=array_push($navData,[
        'isLevel'=>1,
        'id'=>'recomcar',
        'tit'=>'一猫推荐',
        'tpl'=>'recomcar',
        'color'=>'#cd9a32',
        'goods'=>$tplData.goodsCon.recommend,
        'len'=>count($tplData.goodsCon.recommend),
        'searchurl'=>{%get_searchurl%}
    ])%}
{%/if%}
{%if count($tplData.goodsCon.suv)>3%}
    {%$k=array_push($navData,[
        'isLevel'=>1,
        'id'=>'suvcar',
        'tit'=>'SUV',
        'tpl'=>'suvcar',
        'color'=>'#cd9a32',
        'goods'=>$tplData.goodsCon.suv,
        'len'=>count($tplData.goodsCon.suv),
        'searchurl'=>{%get_searchurl%}
    ])%}
{%/if%}
{%if count($tplData.goodsCon.jiaoche)>3%}
    {%$k=array_push($navData,[
        'isLevel'=>1,
        'id'=>'jiaochecar',
        'tit'=>'轿车',
        'tpl'=>'jiaochecar',
        'color'=>'#cd9a32',
        'goods'=>$tplData.goodsCon.jiaoche,
        'len'=>count($tplData.goodsCon.jiaoche),
        'searchurl'=>{%get_searchurl%}
    ])%}
{%/if%}
{%if count($tplData.goodsCon.hot)>3%}
    {%$k=array_push($navData,[
        'isLevel'=>1,
        'id'=>'hotcar',
        'tit'=>'店铺热销',
        'tpl'=>'hotcar',
        'color'=>'#ff3733',
        'goods'=>$tplData.goodsCon.hot,
        'len'=>count($tplData.goodsCon.hot),
        'searchurl'=>{%get_searchurl%}
    ])%}
{%/if%}
{%if count($tplData.goodsGroup.data)>1%}
    {%$k=array_push($navData,[
        'isLevel'=>1,
        'id'=>'zxcar',
        'tit'=>'巨惠购',
        'tpl'=>'tuancar',
        'color'=>'#ed3f36',
        'goods'=>$tplData.goodsGroup.data,
        'len'=>count($tplData.goodsGroup.data),
        'searchurl'=>$groupLink
    ])%}
{%/if%}
{%if count($tplData.customAd)>0%}
    {%$k=array_push($navData,[
        'isLevel'=>1,
        'id'=>'dingcar',
        'color'=>'#cd9a32',
        'tit'=>'定制车',
        'tpl'=>'dingcar',
        'goods'=>array_slice($tplData.customAd,0,4),
        'len'=>count(array_slice($tplData.customAd,0,4)),
        'searchurl'=>{%get_searchurl sellType=3%}
    ])%}
{%/if%}
{%if $tplData.bannerAd1%}
     {%$k=array_push($navData,[
        'isBannerAd1'=>1,
        'id'=>'bannerAd1',
        'ad'=>$tplData.bannerAd1
     ])%}
{%/if%}

{%/block%}
{%block name="block_body"%}
{%widget name="gmobile:widget/page/home/home.tpl"%}
{%/block%}
{%block name="block_foot_js"%}{%/block%}