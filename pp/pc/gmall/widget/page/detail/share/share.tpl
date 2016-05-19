{%$list=[]%}
    {%foreach $tplData.image as $i=>$img%}
    {%$url=($tplData.__imgDom|cat:$img)%}
    {%$arr=array()%}
    {%$arr['smallUrl']=$url%}
    {%$arr['bigUrl']=$url%}
    {%$num=array_push($list,$arr)%}
{%/foreach%}
<div class="share-item ">
    {%if $tplData.hasattention%}
    <div class="attentioned sbtn">已关注</div>
    {%else%}
    <div class="attention sbtn">关注</div>
    {%/if%}
    <div class="share bdsharebuttonbox" ><a href="javascript:void(0)" onclick="return false" class="bds_more sbtn" data-cmd="more">分享</a></div>
</div>

{%script%}
require.async('./share.async.js',function(share){
        var list={%$list|json_encode|escape:none%};
  share.init(list);
});
{%/script%}