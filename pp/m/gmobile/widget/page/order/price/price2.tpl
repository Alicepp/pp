{%extends file="gmobile/widget/page/order/price/price.tpl"%}

{%block name="price_offline"%}
{%if $tplData.discount>0%}
<dl class="order-price">
    <dt>到店抵扣：</dt>
    <dd>
        <p class="price-num volPrice" key="offline" addprice="{%$tplData.discount%}">{%$tplData.discount%}元</p>
        <p><strong>{%$tplData.discount%}元</strong>(抵扣劵价值)
                    <span class="vol">
                       + <strong class="volPrice" key="offline">0元</strong>（优惠券）
                    </span>
        </p>
    </dd>
</dl>
{%/if%}
{%/block%}