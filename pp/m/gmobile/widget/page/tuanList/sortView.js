var base=require('common:widget/ui/base/base.js');
var View=base.Class(function($el){
    this.$el=$el;
},base.event).extend({
    bindModel:function(model){
        model.addEventListeners({
            "change.priceSort" : function(e){
                var sort=model.get('priceSort');
                this.$el.removeClass('priceSort-1');
                this.$el.removeClass('priceSort-2');
                sort&&this.$el.addClass('priceSort-'+sort);
            }
        }, this);
    },
    bindCtr:function(ctr){
        var that=this;
        this.$el.find('.list-icon').click(function(e){
            ctr.sortBtnClick(e);
        })
        this.$el.find('.filter-btn').click(function(e){
            ctr.openSideBar(e);
        })

    }
});
return View;