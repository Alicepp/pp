{%$list=[]%}
{%foreach $tplData.image as $i=>$img%}
{%$url=($tplData.__imgDom|cat:$img)%}
        {%$arr=array()%}
        {%$arr['smallUrl']=($url|cat:'/42')%}
        {%$arr['bigUrl']=($url|cat:'/89')%}
{%$num=array_push($list,$arr)%}
{%/foreach%}

<div class="detail-slide">
    <div class="detail-img">
        <div class="imgItem bigImg-main"></div>
        <div class="imgItem bigImg-sub"></div>
    </div>
    <div class="detail-subnum">
        <ul class="detail-list">
        </ul>
    </div>
</div>
{%script%}
    require.async('./slide.async.js',function(slide){
       var list={%$list|json_encode|escape:none%}
       slide.init(list);
    });
{%/script%}