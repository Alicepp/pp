<div class="ui-head ">
    <div class="ui-head-box ui-head-fixed borderbox">
        <div class="btn-back"
              {%if $isBack%}
              onclick="history.length?history.back():(location.href='/');"
              {%/if%}
                >
        </div>
        <div class="ui-head-txt center">
        {%$tit%}
        </div>
    </div>
</div>