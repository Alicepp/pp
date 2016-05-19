<div class="nav-bar">
    <div class="nav-list page-center">
        <a class="nav-item {%if $selectIndex==1%}nav-select{%/if%}" href="/">
            <span class="nav-txt">商城首页</span>
        </a>
        <a class="nav-item {%if $selectIndex==2%}nav-select{%/if%}" href="{%get_searchurl sellType=0%}">
            <span class="nav-txt">热销车</span>
        </a>
        <a class="nav-item {%if $selectIndex==3%}nav-select{%/if%}" href="/city/{%$tplData.curCity.pinyin%}/juhuigou/list-0-1.html">
            <span class="nav-txt">巨惠购</span>
        </a>
    </div>
<!--    {%if $hasAllLine%}
    <div class="nav-bottom">
        <div class="line-all">
        </div>
    </div>
    {%/if%}
    {%if $hasIndexLine%}
    <div class="nav-bottom nav-bottom-index">
        <div class="line-all">
        </div>
    </div>
    {%/if%}-->
</div>
