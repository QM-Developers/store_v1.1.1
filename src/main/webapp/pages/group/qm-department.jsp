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
    <link rel="stylesheet" type="text/css" href="${path}/pages/group/qm-department.css"/>

    <script type="text/javascript">
        var departmentId = document.URL.split("?")[1];
    </script>
</head>

<body>
<div class="bodybox">
    <div class=" qm-header">
        <!--头部容器-->
    </div>
    <div class="qm-team Department">
        <div class="groupdata-title">
            <h4 class="qm-c-p">部门资料</h4>
        </div>
        <div class=" qm-team-txt">
            <div class="qm-team-input">
                <span class="span-text">公司名称 :</span><span class="span-cont" id="team-name"></span>
            </div>
            <div class=" qm-team-input">
                <span class="span-text">部门名称 :</span><span class="span-cont" id="department-name"></span>
            </div>
            <div class=" qm-team-input">
                <span class="span-text">成立时间 :</span><span class="span-cont" id="create-date"></span>
            </div>
            <div class=" qm-team-input">
                <span class="span-text">部门人数 :</span><span class="span-cont" id="member-count"></span>
            </div>
        </div>
    </div>
    <div class="Corporationlist">
        <div class="am-g qm-team1">
            <div class="groupdata-title">
                <h4 class="qm-c-p">成员列表</h4>
            </div>
            <div class=" qm-team1-tab">
                <table class="am-table ">
                    <thead>
                    <tr>
                        <th class="list-th1">名称</th>
                        <th>性别</th>
                        <th>联系电话</th>
                        <th>部门</th>
                        <th>职位</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class=" qm-team1-box">
                <table class="am-table " style="margin: 0;">
                    <tbody id="member-list"></tbody>
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
    <div class="am-g">

        <div class="del-but-box">
            <button class="del-but" onclick="javascript :history.back(-1);">返回</button>
        </div>

    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>

<script type="text/javascript" src="${path}/pages/group/qm-department.js"></script>
<script type="text/javascript">
    qm_department.init();
</script>

</html>