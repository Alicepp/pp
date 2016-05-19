{%extends file="gmall/page/layout.tpl"%}
{%block name="block_assign"%}
{%$bodyCls="body1200"%}
{%/block%}
{%block name="block_assign" append%}
{%$endTimeFormat="2015/06/09,14:50:34"%}
{%$endTime=($endTimeFormat|strtotime)%}
{%/block%}

{%block name="block_content"%}
{%widget name="gmall:widget/page/wish/wish4.tpl"%}
{%/block%}
{%block name="block_foot_js"%}{%/block%}