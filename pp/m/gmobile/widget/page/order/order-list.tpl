<!--
    @require "user.less"
-->
<div>111111111</div>
{%script%}
require.async('./user.js',function(user){

user.init();
});
{%/script%}
