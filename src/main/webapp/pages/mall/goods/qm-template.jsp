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

    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" href="qm-template.css"/>
</head>

<body>
<div class="bodybox opacity-box">
    <div class="goodslist-list-titlebox">
        <div class="goodslist-title-text">运费模板</div>
    </div>
    <div class="">
        <table class="tablebox" id="freight">
            <tr class="firsttr">
                <th>运输方式</th>
                <th>限重/吨</th>
                <th>起步范围/公里</th>
                <th>起步价/元</th>
                <th>每增加距离/公里</th>
                <th>增加费用/元</th>
                <th>
                    <span class="addtemplate" onclick="AddTr()">增加模板</span>
                </th>
            </tr>
            <%--<tr>--%>
                <%--<td><input/></td>--%>
                <%--<td><input/></td>--%>
                <%--<td><input/></td>--%>
                <%--<td><input/></td>--%>
                <%--<td><input/></td>--%>
                <%--<td><input/></td>--%>
                <%--<td>--%>
                    <%--<a onclick="Conserve(this)">保存</a>--%>
                    <%--<a onclick="Deltr(this)">删除</a>--%>
                <%--</td>--%>
            <%--</tr>--%>
        </table>
    </div>
    <div class="paging" >

        <div class="pagingright" onclick="freightNextPage(this)">
            下一页
        </div>
        <div class="pagingmodle">
            <span id="branchpageleft">1</span>/<span id="branchpageright">1</span>
        </div>

        <div class="pagingright" onclick="freightNextPage(this)">
            上一页
        </div>
        <div class="paging-num-box" id="branchshownum">
            显示条数:<span class="paging-num " onclick="freightShowNum(this)">30</span>
            <span class="paging-num " onclick="freightShowNum(this)">20</span>
            <span class="paging-num paging-checked" onclick="freightShowNum(this)">10</span>
        </div>
    </div>
</div>
</body>
<script src="../../../script/jquery/jquery-3.0.0.min.js"></script>
<script src="../../../script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="../../../pages/index/regularandpop.js"></script>
<script type="text/javascript" src="qm-template.js"></script>

</html>