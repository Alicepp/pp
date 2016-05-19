
    <div class="detail-class">
        <div class="class-item">车型配置</div>
    </div>
    {%foreach $tplData.autoParam as $param%}
    <div class="detail-con-box ">
        {%foreach $param.sub as $i=>$item%}
        <p class="detail-subtitle">{%$item.title|default:$param.title%}</p>
        <table class="detail-table">
            {%$len=count($item.data)%}
            {%$len=$len%3%}
            {%$len=3-$len%}
            {%$len=$len%3%}

            {%foreach $item.data as $k=>$data%}
            {%if $k%3==0%}
            <tr>
                {%/if%}
                <td class="bg" style="">{%$data.name|cat:$data.remark%}</td>
                <td style="">{%$data.value%}</td>
                {%if $k%3==2||$data@last%}
                {%if $data@last%}
                {%section name=total loop=$len%}
                <td class="bg"></td>
                <td></td>
                {%/section%}
                {%/if%}
            </tr>
            {%/if%}
            {%/foreach%}
        </table>
        {%/foreach%}

    </div>
    {%/foreach%}
