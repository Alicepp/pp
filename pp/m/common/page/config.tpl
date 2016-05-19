{%* 全局通用配置 *%}
{%$url=$tplData["__http"]%}
{%$url["home"]=($url["temai_m"]|cat:'/')%}
{%$url["pcHome"]=($url["temai"]|cat:'/')%}
{%$url["user"]=($url["i_m"]|cat:'/homecp/shangcheng/')%}