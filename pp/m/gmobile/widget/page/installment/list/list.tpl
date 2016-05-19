<div class="pageCls-item page-list" >
    {%widget name='gmobile:widget/head/head.tpl' tit='选择分期方案' isBack=1%}
    {%if count($tplData.bank)>0%}
    <div class="bank-list">
    {%foreach $tplData.bank as $i=>$item%}
        {%widget name='gmobile:widget/page/installment/list/item.tpl' item=$item%}
    {%/foreach%}
    </div>
    {%else%}
    <div class="nobank">您选择的城市不支持分期付款！<br/>
      <a href="javascript:history.back();">选择其他城市</a>
    </div>
    {%/if%}
</div>
{%script%}
require.async(['./listView.js'],function(View){
    var view=new View();
    view.init();
});
{%/script%}