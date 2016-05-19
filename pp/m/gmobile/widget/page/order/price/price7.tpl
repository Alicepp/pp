{%extends file="gmobile/widget/page/order/price/price.tpl"%}
{%block name="price_offline"%}
{%if $tplData.offlinePrice>0%}
<dl class="order-price">
    <dt>到店应付：</dt>
    <dd>
        <p class="price-num volPrice" key="offline" price="{%$tplData.offlinePrice%}">{%$tplData.offlinePrice%}元</p>
        <p><strong>{%$tplData.groupPrice|format_price%}</strong>（巨惠价）
            -<strong>{%$tplData.orderPrice%}元</strong>（意向金）
                    <span class="vol">
                       - <strong class="volPrice" key="offline">0元</strong>（优惠券）
                    </span>
        </p>
    </dd>
</dl>
{%/if%}
{%/block%}