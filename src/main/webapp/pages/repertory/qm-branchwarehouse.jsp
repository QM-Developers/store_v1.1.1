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
        var urlParams = document.URL.split("?")[1];

    </script>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/repertory/qm-branchwarehouse.css"/>
</head>
<body>
<div class="bodybox opacity-box">

    <div class="tabledata">
        <div class="table-title" >
            <a hidden></a>
            <div class="qm-list">分销点列表</div>
        </div>
        <div class="table">
            <table class="am-table " id="list-table" >
                <tbody>
                <tr>
                    <th>名称</th>
                    <th>所属部门</th>
                    <th>负责人</th>
                    <th>联系电话</th>
                    <th>操作区</th>
                </tr>
                <%--<tr>--%>
                <%--<td>忘忧果</td>--%>
                <%--<td>男</td>--%>
                <%--<td>10086010110</td>--%>
                <%--<td>个体</td>--%>
                <%--<td>未建账</td>--%>
                <%--<td>--%>
                <%--<a class="personnel-details" href="">详细信息</a>--%>
                <%--</td>--%>
                <%--</tr>--%>
                </tbody>
            </table>

        </div>
        <div class="paging">
            <div class="pagingright" onclick="qm_branchwarehouse.NextPage(this)">
                下一页
            </div>
            <div class="pagingmodle">
                <span id="pageleft">1</span>/<span id="pageright">1</span>
            </div>
            <div class="pagingleft" onclick="qm_branchwarehouse.NextPage(this)">
                上一页
            </div>

            <div class="paging-num-box" id="pagebox">
                人数显示:<span class="paging-num" onclick="qm_branchwarehouse.pageShowNum(this)">30</span>
                <span class="paging-num" onclick="qm_branchwarehouse.pageShowNum(this)">20</span>
                <span class="paging-num paging-checked" onclick="qm_branchwarehouse.pageShowNum(this)">10</span>
            </div>
        </div>
    </div>

</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/repertory/qm-branchwarehouse.js"></script>
<script type="text/javascript">
    qm_branchwarehouse.inint();
</script>

</html>