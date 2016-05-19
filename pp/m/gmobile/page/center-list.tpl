{%extends file="common/page/layout.tpl"%}
{%block name="block_assign"%}
{%if $smarty.get.ot==3%}
    {%$pcUrl="http://i.emao.com/homecp/shangcheng/groupbuy/"%}
{%else%}
    {%$pcUrl="http://i.emao.com/homecp/shangcheng/order/"%}
{%/if%}
{%/block%}
{%block name="block_content"%}
{%widget name="gmobile:widget/page/user/center-list.tpl"%}
{%/block%}