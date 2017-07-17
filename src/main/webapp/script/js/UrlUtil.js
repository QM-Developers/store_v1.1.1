var urlUtil = {
    objToParams: function (obj)
    {
        var params = "";
        for (var o in obj)
            params += o + "=" + obj[o] + "&";
        return params.substring(0, params.length - 1);
    },

    paramsToObj: function (params)
    {
        var obj = {};
        var arr = params.split("&");
        for (var i = 0; i < arr.length; i++)
        {
            var val = arr[i].split("=");
            obj[val[0]] = val[1];
        }
        return obj;
    },
};