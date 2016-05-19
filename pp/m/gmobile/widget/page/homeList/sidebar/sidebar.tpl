
<div class="sidebar filter-sidebar">
    <div class="side-box">
        <div class="filter-tit">
            <ul class="box">
                <li class="flex1 btn-cancel">取消</li>
                <li class="tit">筛选</li>
                <li class="flex1 btn-sure">确定</li>
            </ul>
        </div>
        <div class="filter-list side-list">
            <ul class="filterUl-home selected" tit="筛选" >
                {%foreach $FDATA as $i=>$item%}
                    <li class="center-v home-item" keyId="{%$item.keyId%}">
                        <div class="fh-key">{%$item.keyName%}</div>
                        <div class="fh-val flex1">全部</div>
                    </li>
                {%/foreach%}
                <li class="center li-clearbtn">
                    <span class="clearbtn">清除选项</span>
                </li>
            </ul>
            {%foreach $FDATA as $i=>$list%}
                <ul class="filterUl-item " keyId="{%$list.keyId%}" tit="{%$list.keyName%}">
                    <li class="selected" data-id="0">
                        <span>全部{%$list.keyName%}</span>
                    </li>
                    {%foreach $list.list as $item%}
                    <li class="selected" data-id="{%$item.id%}">
                        <span>{%$item.name%}</span>
                    </li>
                    {%/foreach%}
                </ul>
            {%/foreach%}


        </div>
    </div>
</div>
