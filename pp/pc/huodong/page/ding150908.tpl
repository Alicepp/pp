{%extends file="common/page/layout.tpl"%}
{%block name="block_assign" append%}
{%$title=$tplData['title']%}
{%$endTimeFormat="2015/10/15,17:00:00"%}
{%$endTime=($endTimeFormat|strtotime)%}
{%$startTimeFormat="2015/9/16,10:00:00"%}
{%$startTime=($startTimeFormat|strtotime)%}
{%$nowHour=($smarty.now|date_format:'%H')%}
{%/block%}

{%block name="block_body"%}
{%widget name="huodong:widget/page/ding150908/ding150908.tpl"%}
{%/block%}
