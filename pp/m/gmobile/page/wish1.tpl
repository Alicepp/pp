{%extends file="common/page/layout.tpl"%}
{%block name="block_assign"%}
    {%$bodyCls="body-wish1"%}
    {%$hasDownBar=1%}
    {%$brand=[]%}
    {%foreach $tplData.brand.data as $k=>$list%}
    {%foreach $list as $data%}
    {%$i=array_push($brand,$data)%}
    {%/foreach%}
    {%/foreach%}
{%/block%}
{%block name="block_content"%}
{%widget name="gmobile:widget/page/wish/wish.tpl"%}
{%/block%}