<form action="{%$url.user%}?c=order&a=invoice" method="post" enctype="multipart/form-data" class="form-piao">
    <input type="hidden" name="orderId" value="{%$tplData.orderInfo.orderId%}"/>
    <div class="upload-box">
        <div class="upload-lit">上传发票</div>
        <div class="upload-dl box">
            <div class="upload-dt">
                成交价格：
            </div>
            <input name="price" type="text" disabled="disabled" value="{%$tplData.invoice.price%}"/>
            <div class="upload-unit">元</div>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">车架号码：</div>
            <input type="text" disabled="disabled" name="VIN" value="{%$tplData.invoice.VIN%}"/>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">姓名：</div>
            <input type="text" disabled="disabled" name="name" value="{%$tplData.invoice.name%}"/>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">手机号：</div>
            <input type="text" disabled="disabled" name="phone" value="{%$tplData.invoice.phone%}"/>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">油卡寄送地址：</div>

            <input type="text" disabled="disabled" name="addr" value="{%$tplData.invoice.addr%}"/>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">备注：</div>
            <textarea  name="remark"  disabled="disabled" value="{%$tplData.invoice.remark%}"/>
            {%$tplData.invoice.remark%}
            </textarea>
        </div>
        <p class="info-p">注：请将您获得的油卡兑换码写入到备注栏中，符合要求并通过审核之后一猫汽车将兑换加油卡与购车加油卡一并返送给您</p>

        <div class="upload-dl box">
            <div class="upload-dt">状态：</div>
            <div class="dai-chuan">{%$stateList[$tplData.invoice.state]%}</div>
        </div>
        {%if $tplData.invoiceWuliu.wuliu%}
        <div class="upload-dl box">
            <div class="upload-dt">物流公司：</div>
            <div class="dai-chuan">{%$tplData.invoiceWuliu.wuliu.wuliu.content%}</div>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">快递单号：</div>
            <div class="dai-chuan">{%$tplData.invoiceWuliu.wuliu.trackNum%}</div>
        </div>
        {%/if%}
        <div class="upload-request"><em>*</em>上传图片要求：仅支持JPG.JPEG.PNG格式的图片文件，图片不能大于
            4MB</div>

        <div class="upload-piao">
            <img class="upload-img hasLoadimg" data-src="{%$tplData.invoice.photo%}" alt=""/>
        </div>

    </div>
</form>
