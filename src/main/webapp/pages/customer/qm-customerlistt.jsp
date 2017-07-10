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

        var groupId = document.URL.split("?")[1];
    </script>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-customerlistt.css"/>
</head>

<body>
<div class="groupheader">

</div>

<div class="emptydata">
    <!---->
    <div class="Corporationlist">
        <div class="am-g qm-team1">
            <div class="groupdata-title">
                <div class="qm-list">客户列表</div>
                <div class="qm-compile">
                    <select name="">
                        <option value="">有/无账号</option>
                        <option value="">已建账号</option>
                        <option value=""></option>
                    </select>
                </div>

            </div>
            <div class="am-u-sm-12 qm-team1-box">
                <table class="am-table ">
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>联系电话</th>
                        <th>客户类型</th>
                        <th>建账状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="customer-list">
                    </tbody>
                </table>
                <div class="paging">
                    <div class="pagingright">
                        下一页
                    </div>
                    <div class="pagingmodle">
                        <span>1</span>/<span>4</span>
                    </div>
                    <div class="pagingleft">
                        上一页
                    </div>
                    <div class="paging-num-box">
                        人数显示:<span class="paging-num">30</span>
                        <span class="paging-num">20</span>
                        <span class="paging-num">10</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-grouplistt.js"></script>

<script type="text/javascript">
    qm_goruplist.init();
</script>

</html>