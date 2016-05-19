{%foreach $tplData.autoParam as $param%}
    {%foreach $param.sub as $i=>$item%}
        <section class="car-basic">
            <h4>{%$item.title|default:$param.title%}</h4>
            <div class="model-row">
                {%foreach $item.data as $k=>$data%}
                <p><span>{%$data.name%}</span><em>{%$data.value|cat:$data.remark%}</em></p>
                {%/foreach%}
            </div>
        </section>
    {%/foreach%}
{%/foreach%}