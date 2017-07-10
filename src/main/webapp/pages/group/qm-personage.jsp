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
    <link rel="stylesheet" type="text/css" href="${path}/pages/group/qm-personage.css"/>

    <script type="text/javascript">
        var memberId = document.URL.split("?")[1];
    </script>
</head>

<body>
<div class="bodybox">
    <div class=" qm-header">
        <!--头部容器-->
    </div>
    <!--个人-->
    <div class="personage">
        <div class="qm-team" id="Personal">
            <div class="groupdata-title">
                <h4 class="qm-c-p">成员人资料</h4>
            </div>
            <div class="am-g ">
                <div class="am-u-sm-2" style="text-align: center;margin-top: 30px;">
                    <img class=" am-img-thumbnail" id="user-img" src="../images/ceshi4.jpg" width="120" height="120"/>
                </div>
                <div class="am-u-sm-8 am-u-end">
                    <div class=" qm-team-input">
                        <span class=" am-u-sm-1">姓　　名:</span><input id="user-name" class=" am-u-sm-4 am-u-end"/>
                        <span class=" am-u-sm-1">性　　别:</span><input id="user-sex" class=" am-u-sm-4 am-u-end"/>
                    </div>
                    <div class=" qm-team-input">
                        <span class=" am-u-sm-1">联系电话:</span><input id="user-phone" class=" am-u-sm-4 am-u-end"/>
                        <span class=" am-u-sm-1">身份证号:</span><input id="user-identity" class=" am-u-sm-4 am-u-end"/>
                    </div>
                    <div class=" qm-team-input">
                        <span class=" am-u-sm-1">所属公司:</span><input id="team-name" class=" am-u-sm-4 am-u-end"/>
                        <span class=" am-u-sm-1">所属部门:</span><input id="department-name" class=" am-u-sm-4 am-u-end"/>
                    </div>
                    <div class=" qm-team-input">
                        <span class=" am-u-sm-1">工作职位:</span><input id="position-name" class=" am-u-sm-4 am-u-end"/>
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

<script type="text/javascript" src="${path}/pages/group/qm-personage.js"></script>
<script type="text/javascript">
    qm_personage.init();
</script>
</html>