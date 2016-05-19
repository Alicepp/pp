{%$loginInfo=$tplData.__loginInfo%}
<header class="page-header box">
    <a class="header-logo " href="{%$url.home%}">
        <img src="/static/img/51logo.png" alt="一猫汽车网"/>
    </a>
    <div class="header-flex flex1">
        {%if $tplData.curCity.cityName%}
        <a class="city-link "  href="/selectcity.html?ref={%$urlSuffix|default:''%}">{%$tplData.curCity.cityName%}</a>
        {%/if%}
    </div>
    <a class="user-link box-item" href="{%$url['i_m']%}" >

    </a>
    {%if $pageId=='home'%}
    <a class="se-link box-item" href="javascript:void(0)">

    </a>
    {%/if%}
</header>
    {%if $pageId=='home'%}
        {%widget name="common:widget/header/sidebar/sidebar.tpl"%}
    {%/if%}

{%script%}
    require.async('./header.js', function(header){
       header.init();
    });
{%/script%}