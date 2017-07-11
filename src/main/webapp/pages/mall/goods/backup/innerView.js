var innerJS = {
    init: function ()
    {
        var item = "";
        for (var i = 0; i < images.length; i++)
            item += '<li><img src="' + images[i] + '" alt="" title=""/></li>';
        $("#img-list").append(item);
    }
};