var myjs = {
    hour: 24,
    minute: 60,
    second: 60,
    millisecond: 1000,

    /**
     * 判断数据是否为空
     * @param data 数据
     * @returns {boolean}
     */
    isNull: function (data)
    {
        return data == "" || data == undefined || data == null || data == "undefined";
    },

    objIsNull: function (obj)
    {
        for (var data in obj)
            if (myjs.isNull(obj[data]))
                return true;
        return false;
    },

    /**
     * 用 FancyBox 弹窗
     * @param href 窗口id
     * @param type 弹窗类型
     */
    openFcWindow: function (href, type)
    {
        $.fancybox.open({
            href: href,
            type: type,
        });
    },

    /**
     * 关闭 FancyBox 弹窗，并清空 input
     * @param item 弹窗id
     */
    closeFcWindow: function (item)
    {
        $(item).find("input").val("");
        $.fancybox.close();
    },

    /**
     * 清空 EasyUI 的树形控件
     * @param Item 树形控件
     */
    clearTree: function (Item)
    {
        var root = $(Item).tree("getRoots");
        for (var i = 0; i < root.length; i++)
        {
            root = $(Item).tree("getRoots");
            var n = $(Item).tree("find", root[i].id);
            $(Item).tree("remove", n.target);
        }
        if (root.length > 0)
            myjs.clearTree(Item);
    },

    /**
     * @param url 请求地址
     * @param data 传入的数据
     * @param func 回调函数
     */
    ajax_post: function (url, data, func)
    {
        $.ajax(
            {
                traditional: true,
                type: 'post',
                url: url,
                data: data,
                dataType: 'json',
                success: func,
            });
    },

    /**
     * @param url 请求地址
     * @param data 传入的数据
     * @param func 回调函数
     */
    ajax_get: function (url, data, func)
    {
        $.ajax(
            {
                type: 'get',
                url: url,
                data: data,
                dataType: 'json',
                success: func
            });
    },

    /**
     * 获取鼠标点击的 x 坐标
     * @param e
     * @returns {Number|*}
     */
    getX: function (e)
    {
        e = e || window.event;

        return e.pageX || e.clientX + document.body.scroolLeft;
    },

    /**
     * 获取鼠标点击的 y 坐标
     * @param e
     * @returns {Number|*}
     */
    getY: function (e)
    {
        e = e || window.event;
        return e.pageY || e.clientY + document.boyd.scrollTop;
    },

    /**
     * 用空字符串替换 null
     * @param data
     */
    replaceNull: function (data)
    {
        if (myjs.isNull(data.length))
        {
            for (var d in data)
                if (data[d] == null)
                    data[d] = "";
        }
        else
        {
            for (var i = 0; i < data.length; i++)
                for (var d in data[i])
                    if (data[i][d] == null)
                        data[i][d] = "";
        }
        return data;
    },

    getDay: function (timestamp)
    {
        return timestamp / (myjs.millisecond * myjs.second * myjs.minute * myjs.hour);
    }
};
