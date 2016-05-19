<div class="remind-liter"><span class="remind-btn btn-cancel" data-id="{%$item.gid%}">取消关注</span>
{%if $item.times>$smarty.now%}
    <a class="qiang-gou" href="{%$url.home%}car/{%$item.gid%}.html">立即抢购</a>
{%/if%}
</div>
