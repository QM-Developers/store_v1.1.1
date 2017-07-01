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
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-enterpriselistt.css"/>
</head>

<body>
<div class=" department-header">
    <!--头部容器-->
    <div class=" department-header-left">
        <button class="department-but1"><a href="add-departments.jsp">添加部门</a></button>
        <button class="department-but1"><a href="qm-member.jsp">添加成员</a></button>

    </div>
</div>
<div class="emptydata">
    <div class="Corporationlist">
        <div class="am-g qm-team1">
            <div class="groupdata-title">
                <div class="qm-list">公司列表</div>
                <div class="qm-compile"><span class="qm-compile-but">编辑部门</span><i class="compile-icon"></i></div>
                <div class="qm-compile-seek"><input type="" name="" id="" value=""/><span></span></div>
            </div>

            <div class="am-u-sm-12 qm-team1-box">

                <table class="am-table ">

                    <tbody>
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>联系电话</th>
                        <th>部门</th>
                        <th>职位</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                        <td>忘忧果</td>
                        <td>男</td>
                        <td>10086010110</td>
                        <td>财务部</td>
                        <td>负责人</td>

                        <td>
                            <a class="personnel-details" href="">编辑</a>
                        </td>
                    </tr>

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
<!--<div class="am-g">

    <div class="del-but-box">
        <button class="del-but">返回</button>
    </div>

</div>-->

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>

</html>