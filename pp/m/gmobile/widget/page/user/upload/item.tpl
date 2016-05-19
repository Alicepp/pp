<form action="{%$url.user%}?c=order&a=invoice" method="post" enctype="multipart/form-data" class="form-piao">
    <input type="hidden" name="orderId" value="{%$tplData.orderInfo.orderId%}"/>
    <div class="upload-box">
        <div class="upload-lit">上传发票</div>
        <div class="upload-dl box">
            <div class="upload-dt">
                成交价格：
            </div>
            <input name="price" type="text" value=""/>
            <div class="upload-unit">元</div>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">车架号码：</div>
            <input type="text" name="VIN" value=""/>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">姓名：</div>
            <input type="text" name="name" value="{%$tplData.orderInfo.userName%}"/>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">手机号：</div>
            <input type="text" name="phone" value="{%$tplData.orderInfo.phone%}"/>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">油卡寄送地址：</div>

            <input type="text" name="addr" value=""/>
        </div>
        <div class="upload-dl box">
            <div class="upload-dt">备注：</div>
            <textarea  name="remark"  value="{%$tplData.invoice.remark%}"/>
            {%$tplData.invoice.remark%}
            </textarea>
        </div>
        <p class="info-p">注：请将您获得的油卡兑换码写入到备注栏中，符合要求并通过审核之后一猫汽车将兑换加油卡与购车加油卡一并返送给您</p>
        <div class="upload-dl box">
            <div class="upload-dt">状态：</div>
            <div class="dai-chuan">待上传发票</div>
        </div>
        <div class="upload-request"><em>*</em>上传图片要求：仅支持JPG.JPEG.PNG格式的图片文件，图片不能大于
            4MB</div>

        <div class="upload-piao">
            <img class="upload-img"  alt=""/>
            <input class="upload-file" name="file"  type="file" accept="image/*" />
            <i></i>

        </div>
        <div class="upload-liter">上传购车发票</div>
        <div class="upload-but">提交</div>
    </div>
</form>
