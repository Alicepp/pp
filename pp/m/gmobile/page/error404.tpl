{%extends file="common/page/layout.tpl"%}
{%block name="block_assign"%}
{%$title=$tplData['title']%}
{%$hasDownBar=1%}
{%/block%}
{%block name="block_content"%}
{%widget name="gmobile:widget/page/error/error404.tpl"%}
{%/block%}
{%block name="block_foot_js"%}{%/block%}