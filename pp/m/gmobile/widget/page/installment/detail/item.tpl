<div class="pageCls-item detail-item page-detail-{%$item.bankId%} " bankId="{%$item.bankId%}" >
    {%widget name='gmobile:widget/head/head.tpl' tit=$item.showName toPageCls="page-list"%}
    {%if $item.waploanFlow%}
    <div class="box-item box-loanFlow">
        <div class="box-loanFlow-img">
            <img  src="http://img.emao.net/{%$item%}" alt=""/>
        </div>
    </div>
    {%/if%}
    {%widget name='gmobile:widget/page/installment/list/item.tpl' item=$item  isDetail=1%}
    <div class="box-item">
        <div class="box-block">
            <div class="block-line">
                <ul class="ul-loan">
                    <li class="line-item line-bg line-loan"></li>
                    <li class="line-item line-firstPay firstpercent" style="width: 0%">
                        <div listKey="firstPay" class="btn-item btn-firstPay">
                        </div>
                    </li>
                    <li class="line-item line-lastPay hasLastPay lastpercent" style="width: 0%">
                        <div listKey="longRatio" class="btn-item btn-longRatio">

                        </div>
                    </li>
                </ul>
                <div class="first-txt ">
                    首付金额<br/>
                    <em class="firstpay"></em>
                </div>
                <div class="center-txt hasLastPay">
                    贷款金额<br/>
                    <em class="loanpay"></em>
                </div>
                <div class="last-txt hasLastPay">
                    尾款金额<br/>
                    <em class="lastpay"></em>
                </div>
                <div class="last-txt noLastPay">
                    贷款金额<br/>
                    <em class="loanpay"></em>
                </div>

            </div>
            <div class="block-line">
                <ul>
                    <li class="line-item line-bg"></li>
                    <li class="line-item line-Nper stagEnumpercent" style="width: <%(this.stagEnum/60)*100%>%">
                        <div listKey="stagEnum" class="btn-item btn-stagEnum">
                            <span><em class="stagEnum"></em>期</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="detail-info">
    </div>
    <form class="detail-form " method="post" action="/pay/xianshitemai/step-1/" id="bank-{%$item.bankId%}" bankid="{%$item.bankId%}" >
        <input type="hidden" name="gId" value="{%$tplData.goodsId%}"/>
        <input type="hidden" name="pId" value="{%$tplData.pointId%}"/>
        <input type="hidden" name="color" value="{%$tplData.colorId%}"/>
        <input type="hidden" name="depositId" value="{%$tplData.depositId%}"/>
        <input type="hidden" name="autoId" value="{%$tplData.autoId%}"/>
        <input type="hidden" name="partsid" value="{%$tplData.partsId%}"/>
        <input type="hidden" name="loanRatio" value=""/>
        <input type="hidden" name="bankId" value="{%$item.bankId%}"/>
        <input type="hidden" name="firstPay" value=""/>
        <input type="hidden" name="stag" value=""/>
        <div class="fixed-bottom">
            <div class="btn-submit">确认选择</div>
        </div>

    </form>

</div>

{%$firstPay=[]%}
{%foreach $item.firstPayPro as $i=>$pay%}
{%$stagEnum=[]%}
{%foreach $pay as $val%}
{%$k=array_push($stagEnum,[
'sign'=>$val,
'val'=>$tplData.stagEnum[$val],
'free'=>$item[$tplData.stagFreeEnum[$val]],
'rate'=>$item[$tplData.rateEnum[$val]],
'endtime'=>$item[$tplData.rateEndTimeEnum[$val]]
])%}
{%/foreach%}
{%$data=[
'sign'=>$i,
'val'=>$tplData.firstPayMult[$i],
'longRatio'=>$item.loanRatio[$i],
'stagEnum'=>$stagEnum
]%}
{%$k=array_push($firstPay,$data)%}
{%/foreach%}

{%$bank=[
    'firstPay'=>$firstPay,
    'carPrice'=>$tplData.good.actualPrice,
    'rateEndTime'=>$item.rateEndTime,
    'procedureType'=>$item.procedureType,
    'procedureVal'=>$item.procedureVal,
    'showName'=>$item.showName,
    'goodInfo'=>[
        'gId'=>$tplData.goodsId,
        'pId'=>$tplData.pointId,
        'color'=>$tplData.colorId,
        'depositId'=>$tplData.depositId,
        'autoId'=>$tplData.autoId,
        'partsid'=>$tplData.partsId
    ]
]%}
{%script%}
require.async(['./detailView.js','./model.js'],function(View,Model){
    var view=new View('page-detail-{%$item.bankId%}');
    var model=new Model();
    view.init({"model":model});
    model.init({%$bank|json_encode|escape:none%});
});
{%/script%}