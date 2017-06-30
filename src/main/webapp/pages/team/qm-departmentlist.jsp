<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>所有部门列表</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/team/qm-departmentlist.css"/>
</head>

<body>
<div class=" qm-header">
    <!--头部容器-->

</div>

<div class="qm-c-list companylist" id="companylist">
    <div class="qm-c-company ">
        <h4 class="qm-c-p">搜索结果列表</h4>

        <ul class="qm-c-ul">
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
        </ul>
    </div>
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
    </div>
</div>
<div class="emptydata">

    <!---->
    <div class="Corporationlist">
        <div class="am-g qm-team1">
            <div class="groupdata-title">
                <h4 class="qm-c-p">部门列表</h4>

            </div>
            <div class="am-u-sm-10 qm-team1-tab">
                <table class="am-table ">
                    <thead>
                    <tr>
                        <th>部门名称</th>
                        <th>负责人</th>
                        <th>联系电话</th>
                        <th>人数</th>

                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="am-u-sm-10 qm-team1-box">

                <table class="am-table ">

                    <tbody>
                    <tr>
                        <td>财务部</td>
                        <td>李四</td>
                        <td>10086010110</td>
                        <td>2</td>
                        <td><a class="personnel-details" href="">详细信息</a></td>
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
                </div>
            </div>

        </div>

    </div>

</div>
<div class="am-g">

    <div class="del-but-box">
        <button class="del-but">返回</button>
    </div>

</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>

</html>