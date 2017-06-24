<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
    <script type="text/javascript">
        var path = "${path}";
        var basePath = "${basePath}";
    </script>
    <script type="text/javascript">
        var typeId = document.URL.split("?")[1];
    </script>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
</head>
<body>
<div id="loader"></div>
<button class="am-btn am-btn-default" onclick="findGoodsDetail();">商品详情</button>
</body>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>

<script type="text/javascript">
    var count = 0;

    var findAreaByPid = function ()
    {
        var url = path + "";
        var params = {};

        myjs.ajax_post(url,params,function (data)
        {

        });
    };

    var findGoodsDetail = function ()
    {
        var url = path + "/user_findGoodsList.action";
        var params = {};
        params["goodsTypeId"] = "2267430251874ea69ea82834c558977a";
        params["pageNum"] = "1";
        params["pageSize"] = "10";

        myjs.ajax_post(url,params,function (data)
        {
            console.log(data);
        });
    }
</script>

</html>
