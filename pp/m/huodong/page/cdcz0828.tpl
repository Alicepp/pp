{%extends file="common/page/layout.tpl"%}
{%block name="block_assign"%}
{%$endTimeFormat="2015/09/02,00:00:00"%}
{%$endTime=($endTimeFormat|strtotime)%}
{%$remainTime=($endTime-$smarty.now)%}
{%if $smarty.get.debug%}
{%$remainTime=0%}
{%/if%}
{%/block%}
{%block name="block_content"%}
{%widget name="huodong:widget/page/cdcz0828/page.tpl"%}
{%/block%}
{%block name="block_footer"%}{%/block%}