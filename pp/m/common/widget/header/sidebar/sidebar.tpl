<div class="sidebar se-sidebar">
    <div class="side-box">
        <div class="side-nav">
            <ul class="box">
                <li class="selected flex1">品牌</li>
                <li class="flex1">价格</li>
                <li class="flex1">级别</li>
            </ul>
        </div>
        <div class="side-list">
            <ul class="selected">
                <li>
                    <a href="{%get_searchurl brandId=0%}">
                        全部品牌
                    </a>
                </li>
                {%foreach $tplData.brandListGroup as $k=>$alphaList%}
                <li class=" brand-li">
                    <div class="item-k">
                        {%$k%}
                    </div>
                    {%foreach $alphaList as $lista%}
                        {%foreach $lista as $list%}
                        <a class="brand-item" href="{%get_searchurl brandId=$list.id%}">
                            {%$list.brandName%}
                        </a>
                        {%/foreach%}
                    {%/foreach%}
                </li>
                {%/foreach%}
            </ul>
            <ul>
                <li>
                    <a href="{%get_searchurl price=0%}">
                        全部价格
                    </a>
                </li>
                {%foreach $tplData.priceList as $k=>$priceList%}
                <li>
                    <a href="{%get_searchurl price=$k%}" >{%$priceList%}</a>
                </li>
                {%/foreach%}
            </ul>
            <ul>
                <li>
                    <a href="{%get_searchurl carriageId=0%}">
                        全部级别
                    </a>
                </li>
                {%foreach $tplData.carriageList as $k=>$list%}
                <li>
                    <a href="{%get_searchurl carriageId=$k%}" >{%$list%}</a>
                </li>
                {%/foreach%}
            </ul>
        </div>
    </div>
</div>