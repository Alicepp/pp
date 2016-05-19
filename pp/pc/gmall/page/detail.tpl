{%extends file="gmall/page/layout.tpl"%}
{%block name="block_assign"%}
    {%$bodyCls="body-bg"%}
    {%$mobileUrl=($url.mHome|cat:'car/'|cat:$tplData.goods.id|cat:'.html')%}
    {%$carInfo=$tplData['goods']%}
    {%$goodsInfo=$tplData['goodsAuto']%}
    {%$goodInfo=$goodsInfo[0][0]%}
    {%$carTit=$carInfo['goodsName']%}
    {%$points=$tplData.autoPoint%}
    {%$dealers=array_values($points.dealer)%}
    {%$point=$dealers[0][0]%}
    {%if count($tplData.autoDeposit)==1%}
        {%$tplData.autoDeposit[0]["isDef"]=1%}
    {%/if%}
    {%foreach $tplData.autoDeposit as $i=>$item%}
        {%if $item["isDef"]%}
            {%$deposit=$item%}
            {%break%}
        {%/if%}
    {%/foreach%}
    {%if $carInfo.defemaoPrice<=0%}
    {%$carInfo.defemaoPrice=$carInfo.minPrice%}
    {%/if%}
    {%if $carInfo.defPrice<=0%}
    {%$carInfo.defPrice=$carInfo.price%}
    {%/if%}
    {%$tplData.amount=($goodsInfo[0]|default:$tplData.amount)%}
    {%$colors=[]%}
    {%$k=0%}
    {%foreach $tplData.amount as $i=>$item%}
    {%$colors[$i]=[]%}
    {%$colors[$i]["colorName"]=$item["colorName"]%}
    {%$colors[$i]["color"]=$item["color"]%}
    {%$colors[$i]["number"]=$item["number"]%}
    {%$colors[$i]["emaoPrice"]=$item["price"]%}
    {%$colors[$i]["price"]=$item["price"]%}
    {%$colors[$i]["price0"]=($item["price"]|format_price:0)%}
    {%$colors[$i]["price1"]=($item["price"]|format_price:1)%}
    {%$colors[$i]["default"]=$item["default"]%}
    {%$colors[$i]["guidePrice"]=$item["guidePrice"]%}
    {%if $item["default"]==1%}
    {%$color=$colors[$i]%}
    {%/if%}
    {%if $item["number"]>0&&$k==0%}
    {%$k=$i%}
    {%/if%}
    {%/foreach%}
    {%$color=($color|default:$colors[$k])%}
    {%$tplData.parts.matrix=($tplData.parts.resource|default:$tplData.parts.matrix)%}
    {%foreach $tplData.parts.matrix as $i=>$item%}
        {%if $item@first%}
         {%$matrixKey=$i%}
        {%/if%}
        {%if $item["num"]>0%}
        {%$matrixKey=$i%}
        {%break%}
        {%/if%}
    {%/foreach%}
    {%$matrixItem=$tplData.parts.matrix[$matrixKey]%}
{%/block%}
{%block name="block_header"%}

{%widget name="common:widget/header2/header.tpl"%}

{%/block%}
{%block name="block_content"%}
     {%widget name="gmall:widget/page/detail/detail.tpl"%}
     {%widget name="common:widget/gotop/gotop.tpl"%}
{%/block%}
{%block name="block_foot_js"%}{%/block%}