<div class="page-pg">
    <div class="img-bg">
        <img src="img/mpei_02.jpg" alt=""/>
        <img src="img/mpei_05.jpg" alt=""/>
    </div>
    <div class="pg-box borderbox">
        <div class="box-form ">
            <form action="">
                <ul>
                    <li class="line-li">
                           <span class="line-left">
                               姓名
                           </span>
                           <span class="line-right">
                               <input type="text" name="name" maxlength="10"/>
                           </span>

                    </li>
                    <li class="line-li">
                           <span class="line-left">
                               手机
                           </span>
                           <span class="line-right">
                               <input type="text" name="phone" maxlength="11"/>
                           </span>

                    </li>
                    <li class="line-li line-sex">
                           <span class="line-left">
                               性别
                           </span>
                           <span class="line-right">
                               <label for="">
                                   <input type="radio" name="sex" value="男" checked="checked"/>
                                   先生
                               </label>
                               <label for="">
                                   <input type="radio" name="sex" value="女"/>
                                   女士
                               </label>
                           </span>

                    </li>
                    <li class="line-li">
                           <span class="line-left">
                               意向车型
                           </span>
                           <span class="line-right">
                               <input type="text" name="carModel" maxlength="20"/>
                           </span>

                    </li>
                    <li class="line-li">
                           <span class="line-left">
                               购车要求
                           </span>
                           <span class="line-right">
                               <textarea name="ask"  cols="30" rows="10" maxlength="200"></textarea>
                           <p class="want-p clearfix">
                               <span class="fl">
                               例：我想在本月内全款购买宝马X5
                               </span>
                               <span class="fr txt-num">
                                   0/200
                               </span>
                           </p>
                           </span>
                    </li>
                    <li class="line-li">
                            <span class="line-right">
                                <div class="btn-submit">提交</div>
                            </span>
                    </li>
                </ul>
            </form>
        </div>
    </div>
    <div class="img-bg">
        <a href="{%$url.home%}" target="_blank"></a>
        <img src="img/mpei_08.jpg" alt=""/>
        <img src="img/mpei_09.png" alt=""/>
    </div>
</div>
{%script%}
    require.async('./app.js',function(app){
        app.init();
    });
{%/script%}