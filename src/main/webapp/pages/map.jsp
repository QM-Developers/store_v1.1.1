<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>

<html>
<head>
    <link rel="stylesheet" href="${path}/pages/common/drag-map.css"/>

    <script type="text/javascript">
        var path = "${path}";
        var basePath = "${basePath}";
    </script>
    <meta charset="utf-8">
    <%--<meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">--%>
    <title>拖拽选址</title>
</head>

<body>
<div id="container" class="map" tabindex="0"></div>
<div id="tip">
    <input type="text" id="keyword" name="keyword" value="请输入关键字：(选定后搜索)" onfocus='this.value=""'/>
</div>
<div id='right'>
    <%--<div>--%>
        <%--<div class='title'>选择模式</div>--%>
        <%--<input type='radio' name='mode' value='dragMap' checked>拖拽地图模式</input>--%>
        <%--</br>--%>
        <%--<input type='radio' name='mode' value='dragMarker'>拖拽Marker模式</input>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--<button id='start'>开始选点</button>--%>
        <%--<button id='stop'>关闭选点</button>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--<div class='title'>选址结果</div>--%>
        <%--<div class='c'>经纬度:</div>--%>
        <%--<div id='lnglat'></div>--%>
        <%--<div class='c'>地址:</div>--%>
        <%--<div id='address'></div>--%>
        <%--<div class='c'>最近的路口:</div>--%>
        <%--<div id='nearestJunction'></div>--%>
        <%--<div class='c'>最近的路:</div>--%>
        <%--<div id='nearestRoad'></div>--%>
        <%--<div class='c'>最近的POI:</div>--%>
        <%--<div id='nearestPOI'></div>--%>
    <%--</div>--%>
</div>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=b1a08879807aa89903aa4aae1fca4bbf&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.ToolBar"></script>
<!-- UI组件库 1.0 -->
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<script type="text/javascript" src="${basePath}/pages/common/dragMap.js"></script>
<script type="text/javascript">
    var success = function (rep)
    {
        console.log(rep);
//        console.log(rep.regeocode.formattedAddress);
    };
    var fail = function (rep)
    {
        console.log(rep);
    };
    dragMap.init("container", "keyword", success, fail);
</script>
</body>

</html>