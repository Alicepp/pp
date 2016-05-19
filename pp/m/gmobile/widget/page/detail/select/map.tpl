<article class="popview page-showMap wrapper" >
    <header class="pop-headbar">
        <div class="btn-return"></div>
    </header>
    <section class="select-bd map-box" id="hideMap">

    </section>
</article>
{%script%}
require.async('./mapView.js',function(View){
var view=new View({pageCls:'page-showMap'});
view.init('points');
});
{%/script%}