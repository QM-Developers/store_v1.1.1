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

    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-applytransfer.css"/>

</head>

<body>
<div class="bodybox opacity-box">
    <div class="boxstyle">
        <div class="goods-title">客户移交</div>
    </div>
    <div class="incidentbox">

        <div class="boxstyle">
            <div class="boxstyle-1">客户名称 :</div>
            <div class="boxstyle-2" id="customerName">

            </div>
        </div>

        <div class="am-g approver">
            <div class="boxstyle">
                <div class="boxstyle-1">交接对象 :</div>
                <div class="boxstyle-2">
                    <select name="" id="promoterBranch" onchange="qm_applytransfer.getObjChlid(this.value)">
                        <!--<option value="">部门选择</option>-->
                    </select>
                </div>
                <div class="boxstyle-2">
                    <select name="" id="promoter">
                        <!--<option value="">成员选择</option>-->
                    </select>
                </div>
            </div>
        </div>
        <%--<div class="am-g goods-box2">--%>
            <%--<div class="boxstyle-1 textarea-span">添加备注 :</div>--%>
            <%--<textarea class="goods-box2-2"></textarea>--%>
        <%--</div>--%>
        <div class="am-g  data-del-off ">
            <div>
                <a class="del-but" onClick="javascript :history.back(-1);">返回</a>
            </div>
            <div class="del-but" onclick="qm_applytransfer.submitBut()">
                移交
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-applytransfer.js"></script>
<script>
    qm_applytransfer.inint()
</script>

</html>