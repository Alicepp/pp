<section>
{%block name="price_online"%}
    <dl class="order-price">
        <dt>支付金额：</dt>
        <dd>
            <p class="price-num volPrice" key="online" price="{%$tplData.orderPrice%}">{%$tplData.orderPrice%}元</p>
            <p>
                {%if $tplData.gType==3&&$tplData.tpl!=2&&$tplData.tpl!=6&&$tplData.tpl!=8&&$tplData.tpl!=9%}
                <strong>{%$tplData.emaoPrice%}元</strong>（一猫价）{%if $tplData.discount>0%} - <strong>{%$tplData.discount%}元</strong>（全款优惠）{%/if%}
                {%else%}
                <strong>{%$tplData.orderPrice%}元</strong>（{%if $tplData.tpl==8||$tplData.tpl==9%}报名费{%else%}意向金{%/if%}）
                {%/if%}
                <span class="vol" >
                    - <strong class="volPrice" key="online">0元</strong>（优惠券）
                </span>
            </p>
        </dd>
    </dl>
{%/block%}
{%block name="price_offline"%}
    {%if $tplData.offlinePrice>0%}
    <dl class="order-price">
        <dt>到店应付：</dt>
        <dd>
            <p class="price-num volPrice" key="offline" price="{%$tplData.offlinePrice%}">{%$tplData.offlinePrice%}元</p>
            <p><strong>{%$tplData.emaoPrice|format_price%}</strong>（一猫价）
                -<strong>{%$tplData.orderPrice%}元</strong>（意向金）
                    <span class="vol">
                       - <strong class="volPrice" key="offline">0元</strong>（优惠券）
                    </span>
            </p>
        </dd>
    </dl>
    {%/if%}
{%/block%}
</section>