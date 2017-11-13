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
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-manageunitlist.css"/>
</head>

<body>
<div class="bodybox opacity-box">
    <div class="site-header" id="addmanageunit">
        <a class="site-header-but" ><i class="site-header-i"></i>添加单位</a>
    </div>
    <div class="sitelistbox">
        <div class="site-title">
            <div>经营单位列表</div>
        </div>
        <div class="site-table-box">
            <table class="am-table " id="table">
                <tbody>
                <tr>
                    <th>单位名称</th>
                    <th>经营面积(平方)</th>
                    <th>地理位置</th>
                    <th>操作区</th>
                </tr>

                </tbody>
            </table>
            <div class="paging">

                <div class="goback" onclick="qm_manageunitlist.gobock();">
                    返回
                </div>

                <div class="pagingright" onclick="qm_manageunitlist.NextPage(this)">
                    下一页
                </div>
                <div class="pagingmodle">
                    <span id="pageleft">1</span>/<span id="pageright">4</span>
                </div>
                <div class="pagingleft" onclick="qm_manageunitlist.NextPage(this)">
                    上一页
                </div>
                <div class="paging-num-box" id="pagebox">
                    人数显示:<span class="paging-num" onclick="qm_manageunitlist.pageShowNum(this)">30</span>
                    <span class="paging-num" onclick="qm_manageunitlist.pageShowNum(this)">20</span>
                    <span class="paging-num paging-checked" onclick="qm_manageunitlist.pageShowNum(this)">10</span>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>

<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-manageunitlist.js"></script>
<script>
    qm_manageunitlist.inint()
</script>
</html>