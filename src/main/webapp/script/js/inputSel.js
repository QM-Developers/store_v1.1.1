var inputSelJS = {
    init: function (item)
    {
        var selItem = $(item).next();
        $(selItem).show();

        $("body").unbind("click");
        $("body").click(function (e)
        {  
        	
            inputSelJS.hideSel(e,selItem,item);
        });

    },

    hideSel : function (e, selItem,item)
    {
        var x = inputSelJS.getX(e);
        var y = inputSelJS.getY(e);
        var ax = $(selItem).offset().left;
        var ay = $(selItem).offset().top;

        if (x > (ax + $(selItem).width()) || y > (ay + $(selItem).height()))
            $(selItem).hide();
        else if (x < ax || y < (ay - $(item).height()))
            $(selItem).hide();
    },
    
    selClick: function (item)
    {
        var inputItem = $(item).parent("div:eq(0)").prev();
        
        $(inputItem).val($(item).text());
        $(item).parent("div:eq(0)").hide();
    },

    getX: function (e)
    {
        e = e || window.event;
        return e.pageX || e.clientX;
        // return e.pageX || e.clientX + document.body.scroolLeft;
    },

    getY: function (e)
    {
        e = e || window.event;
        return e.pageY || e.clientY;
        // return e.pageY || e.clientY + document.boyd.scrollTop;
    },
};