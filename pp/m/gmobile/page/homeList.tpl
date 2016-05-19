{%extends file="common/page/layout.tpl"%}
{%block name="block_assign"%}
{%$bodyCls='body-bg'%}
{%$hasDownBar='1'%}
{%$pcUrl=($url.pcHome|cat:'city/'|cat:$tplData.curCity.pinyin|cat:'/car-0-0-0-0-0-0-0-1.html')%}
{%$brandList=[]%}
{%foreach $tplData.allBrandList as $list%}
    {%foreach $list as $item%}
        {%$obj=[
            'id'=>$item.id,
            'name'=>$item.brandName
        ]%}
        {%$i=array_push($brandList,$obj)%}
    {%/foreach%}
{%/foreach%}
{%$sellList=[
    '0'=>[
    'id'=>'1',
    'name'=>'特价车'
    ],
    '1'=>[
    'id'=>'2',
    'name'=>'抵扣券'
    ],
    '2'=>[
    'id'=>'3',
    'name'=>'定制车'
    ]
]%}
{%$carriageList=[]%}
{%foreach $tplData.carriageList as $i=>$item%}
    {%$j=array_push($carriageList,['id'=>$i,'name'=>$item])%}
{%/foreach%}
{%$priceList=[]%}
{%foreach $tplData.priceList as $i=>$item%}
    {%$j=array_push($priceList,['id'=>$i,'name'=>$item])%}
{%/foreach%}
{%$sourceList=[
    '0'=>[
        'id'=>'1',
        'name'=>'一猫自营'
    ],
    '1'=>[
        'id'=>'2',
        'name'=>'商户自营'
    ]
]%}
{%$huodongList=[
    '0'=>[
        'id'=>'1',
        'name'=>'1212'
    ]
]%}
{%$FDATA=[
    '0'=>[
        'keyName'=>'商品类型',
        'keyId'=>'sellType',
        'list'=>$sellList
    ],
    '1'=>[
        'keyName'=>'品牌',
        'keyId'=>'brandId',
        'list'=>$brandList
    ],
    '2'=>[
        'keyName'=>'价格',
        'keyId'=>'price',
        'list'=>$priceList
        ],
    '3'=>[
        'keyName'=>'级别',
        'keyId'=>'carriageId',
        'list'=>$carriageList
    ],
    '4'=>[
        'keyName'=>'来源',
        'keyId'=>'carFrom',
        'list'=>$sourceList
    ]
]%}

        {%*,
        '5'=>[
        'keyName'=>'活动',
        'keyId'=>'isActivity',
        'list'=>$huodongList
        ]*%}

{%/block%}
{%block name="block_body"%}
{%widget name="gmobile:widget/page/homeList/homeList.tpl"%}
{%/block%}
{%block name="block_foot_js"%}{%/block%}