{%$featureEnum=[
'1'=>'审批快',
'2'=>'极速放款',
'3'=>'资料简便',
'4'=>'首付低',
'5'=>'月供低',
'6'=>'利率低',
'7'=>'车到放款',
'8'=>'0首付',
'9'=>'0月供',
'10'=>'0利率',
'11'=>'可延期'
]%}
<form class="staging-box" method="post" action="{%if $item.flow==2%}/pay/xianshitemai/step-1/{%else%}/fenqi/write{%/if%}" id="bank-{%$item.bankId%}" bankid="{%$item.bankId%}" target="_blank">
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
    {%if $item.isHot==1%}
    <div class="emao-tag"><img src="../img/emao-icon.png" alt=""/></div>
    {%/if%}
    <div class="staging-lf">
        <div class="staging-img" title="查看支持城市及说明"><img src="http://img.emao.net/{%$item.logo%}" alt=""/></div>
        <div class="bank-name"><span class="span-lf">{%$item.showName%}</span><span class="span-rt">|<em> {%$item.planName%}</em></span></div>
        <ul class="list-tag">
            {%foreach $item.feature as $fea%}
            <li style="{%if $fea@last %}margin-right: 0;{%/if%}">
                <i class=" tag{%$fea%}"></i>{%$featureEnum[$fea]%}
            </li>
            {%/foreach%}
            <!--<li>-->
                <!--<i class="tag1"></i>审批快-->
            <!--</li>-->
            <!--<li>-->
                <!--<i class="tag5"></i>月供低-->
            <!--</li>-->
            <!--<li>-->
                <!--<i class="tag6"></i>利率低-->
            <!--</li>-->
            <!--<li style="margin-right: 0">-->
                <!--<i class="tag3"></i>资料少-->
            <!--</li>-->
            <!--<li style="margin-right: 0">-->
                <!--<i class="tag4"></i>首付低-->
            <!--</li>-->
        </ul>
        <div class="loan">
            <div class="speed"><span>放款速度</span><span class="star">
                    <span class="star-red{%$item.serviceRelease%}"></span>
                </span></div>
            
        </div>
        <div>

        </div>
        {%if $item.maxLoan>0%}
        <div class="tall-price">最高额度{%$item.maxLoan|string_format:"%.2f"%}万</div>
        {%/if%}
        {%if $item.maxTerm>0%}
        <div class="tall-Enum">最长期限{%$item.maxTerm|string_format:"%.0f"%}期</div>
        {%/if%}
        <!--{%if $tplData.LightEnum[$item.light]%}
        <div class="online-tag">
              <span>{%$tplData.LightEnum[$item.light]%}</span>
        </div>
        {%/if%}-->
    </div>
    <div class="staging-middle">
        <div class="discount">{%$item.discount%}</div>
        <div class="middel-img">
            {%if $item.loanFlow%}
            <img src="http://img.emao.net/{%$item.loanFlow%}" alt=""/>
            {%/if%}
        </div>
        <div class="car-html bar-carPice">

        </div>
    </div>
    <div class="staging-rt">
        <a class="credits" style="{%if !$item.bankUrl%}visibility:hidden{%/if%}" href="{%$item.bankUrl%}" target="_blank">查看信用额度</a>
        <div class="que-select que-btn">确认选择</div>
        <div class="que-apply">已有<em>{%$item.displayNum%}</em>人成功申请</div>
    </div>
    {%widget name="gmall:widget/page/installment2/bom/bom.tpl"%}
</form>


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
require.async(['./view.js','./model.js'],function(View,Model){
var model=new Model();
var view=new View({"model":model,"$el":$('#bank-{%$item.bankId%}')});
view.init();
model.init({%$bank|json_encode|escape:none%});
});
{%/script%}