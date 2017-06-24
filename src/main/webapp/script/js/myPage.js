function initMyPage(mainUL, params, countUrl, backFn)
{
    var pageCount = 0;

    /**
     * 获取总页数
     */
    ajax_post(countUrl, params, function (data)
    {
        pageCount = parseInt(data);
        addItem();
    });

    /**
     * 添加按钮
     */
    function addItem()
    {
        $(mainUL).empty();
        var prev = '<li idx="0" id="prevPage"><a>上一页</a></li>';
        var page = '';
        var next = '<li idx="2" id="nextPage"><a>下一页</a></li>';

        for (var i = 0; i < pageCount; i++)
        {
            page += '<li role="pageNum" pageNum="' + i + '" idx="' + i + '"><a>' + (i + 1) + '</a></li>';
        }
        $(mainUL).append(prev);
        $(mainUL).append(page);
        $(mainUL).append(next);
        setActive(0);
        bindClick();
    }

    /**
     * 绑定按钮点击事件
     */
    function bindClick()
    {
        $("[role='pageNum']").click(function ()
        {
            setActive(parseInt($(this).attr("idx")));
        });

        $("#prevPage").click(function ()
        {
            setActive(parseInt($(this).attr("idx")));
        });

        $("#nextPage").click(function ()
        {
            setActive(parseInt($(this).attr("idx")));
        });
    }

    /**
     * 设置当前页的属性
     * @param num 当前页码
     */
    function setActive(num)
    {
        $("[role='pageNum']").removeClass("active");
        $("[pageNum=" + num + "]").addClass("active");

        $("#prevPage").attr("idx", num - 1);
        $("#nextPage").attr("idx", num + 1);

        if (parseInt($("#prevPage").attr("idx")) < 0)
            $("#prevPage").addClass("hidden");
        else
            $("#prevPage").removeClass("hidden");

        if ($("#nextPage").attr("idx") > pageCount - 1)
            $("#nextPage").addClass("hidden");
        else
            $("#nextPage").removeClass("hidden");

        backFn(num);
    }

}

function testMyPage(mainUL)
{
    var pageCount = 3;


        $(mainUL).empty();
        var prev = '<li idx="0" id="prevPage"><a>上一页</a></li>';
        var page = '';
        var next = '<li idx="2" id="nextPage"><a>下一页</a></li>';

        for (var i = 0; i < pageCount; i++)
        {
            page += '<li role="pageNum" pageNum="' + i + '" idx="' + i + '"><a>' + (i + 1) + '</a></li>';
        }
        $(mainUL).append(prev);
        $(mainUL).append(page);
        $(mainUL).append(next);

        var num = 0;
        $("[role='pageNum']").removeClass("active");
        $("[pageNum=" + num + "]").addClass("active");

        $("#prevPage").attr("idx", num - 1);
        $("#nextPage").attr("idx", num + 1);

        if (parseInt($("#prevPage").attr("idx")) < 0)
            $("#prevPage").addClass("hidden");
        else
            $("#prevPage").removeClass("hidden");

        if ($("#nextPage").attr("idx") > pageCount - 1)
            $("#nextPage").addClass("hidden");
        else
            $("#nextPage").removeClass("hidden");

}
