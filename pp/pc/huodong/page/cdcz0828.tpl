{%extends file="huodong/page/layout.tpl"%}
{%block name="block_assign" append%}
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
<script  type="text/javascript">
    var  _mvq  =  _mvq  ||  [];
    _mvq.push(['$setAccount',  'm-114937-0']);

    _mvq.push(['$logConversion']);
    (function()  {
        var  mvl  =  document.createElement('script');
        mvl.type  =  'text/javascript';  mvl.async  =  true;
        mvl.src  =  ('https:'  ==  document.location.protocol  ?  'https://static-ssl.mediav.com/mvl.js'  :  'http://static.mediav.com/mvl.js');
        var  s  =  document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(mvl,  s);
    })();
</script>