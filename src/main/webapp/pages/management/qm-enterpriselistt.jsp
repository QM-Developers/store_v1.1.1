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
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-enterpriselistt.css"/>

    <script type="text/javascript">
        var departmentId = document.URL.split("?")[1];
    </script>
</head>

<body>
<div class=" department-header">
    <!--头部容器-->
    <div class=" department-header-left">
        <button class="department-but1"><a href="qm-departments.jsp">添加部门</a></button>
        <button class="department-but1"><a href="qm-member.jsp">添加成员</a></button>
        <div class="qm-compile-seek"><input id="search-keyword"/><span onclick="qm_memberList.searchMember();"></span></div>
    </div>
</div>
<div class="emptydata">
    <div class="Corporationlist">
        <div class="am-g qm-team1">
            <div class="groupdata-title">
                <div class="qm-list">成员列表</div>
                <div class="qm-compile" id="btn-update-department" onclick="qm_memberList.toDepartmentInfo();">
                    <span  class="qm-compile-but">编辑部门</span><i class="compile-icon"></i>
                </div>

            </div>

            <div class="am-u-sm-12 qm-team1-box">

                <table class="am-table ">
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>联系电话</th>
                        <th>部门</th>
                        <th>职位</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="member-list"></tbody>
                </table>
                <div class="paging">

                    <div class="paginglight" onclick="qm_memberList.NextPage(this)">
                        下一页
                    </div>
                    <div class="pagingmodle">
                        <span id="pageleft">1</span>/<span id="pageright">1</span>
                    </div>
                    <div class="pagingleft" onclick="qm_memberList.NextPage(this)">
                        上一页
                    </div>

                    <div class="paging-num-box" id="pagebox">
                        人数显示:<span class="paging-num" onclick="qm_memberList.pageShowNum(this)">30</span>
                        <span class="paging-num" onclick="qm_memberList.pageShowNum(this)">20</span>
                        <span class="paging-num paging-checked" onclick="qm_memberList.pageShowNum(this)">10</span>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>
<!--<div class="am-g">

    <div class="del-but-box">
        <button class="del-but">返回</button>
    </div>

</div>-->

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<%--<script type="text/javascript" src="${path}/pages/common/control.js"></script>--%>
<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>
<script type="text/javascript" src="${path}/pages/management/qm-enterpriselistt.js"></script>

<script type="text/javascript">
    qm_memberList.init();
</script>

</html>