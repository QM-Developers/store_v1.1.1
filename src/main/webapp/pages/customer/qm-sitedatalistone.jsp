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
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-sitedatalistone.css"/>
</head>

<body>
<div class="bodybox">
    <div class="sitelistbox">
        <div class="site-header" id="removeheader">
            <a class="site-header-but" id="addsite" ><i class="site-header-i"></i>添加场地</a>
        </div>
        <div class="site-title">
            <div>场地列表</div>
        </div>
        <div class="site-table-box">
            <table class="am-table " id="table">
                <tbody>
                <tr>
                    <th>场地位置</th>
                    <th>场地性质</th>
                    <th>工人数量</th>
                    <th>操作区</th>
                </tr>
                <tr>
                    <td>广东省江门市鹤山市沙坪街道文华路381号</td>
                    <td>无限定</td>
                    <td>10</td>
                    <td>
                        <a class="personnel-details" href="../group/qm-group.html">详细信息</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="paging">
            <div class="pagingleft goback" onclick="qm_sitedatalistone.gobock()">
                返回
            </div>

            <div class="pagingleft" onclick="qm_sitedatalistone.NextPage(this)">
                下一页
            </div>
            <div class="pagingmodle">
                <span id="pageleft">1</span>/<span id="pageright">4</span>
            </div>
            <div class="pagingleft" onclick="qm_sitedatalistone.NextPage(this)">
                上一页
            </div>

            <div class="paging-num-box" id="pagebox">
                列表显示:<span class="paging-num" onclick="qm_sitedatalistone.pageShowNum(this)">30</span>
                <span class="paging-num" onclick="qm_sitedatalistone.pageShowNum(this)">20</span>
                <span class="paging-num paging-checked" onclick="qm_sitedatalistone.pageShowNum(this)">10</span>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-sitedatalistone.js"></script>
<script>
    qm_sitedatalistone.inint()
</script>
</html>