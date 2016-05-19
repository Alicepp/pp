{%widget name='gmobile:widget/page/installment/detail/detail.tpl'%}
{%widget name='gmobile:widget/page/installment/bankInfo/bankInfo.tpl'%}
{%widget name='gmobile:widget/page/installment/list/list.tpl'%}
{%script%}
    require.async(['./app.js','list/listView.js'],function(app){
       app.init({'pageCls':'page-list'});
    });
{%/script%}