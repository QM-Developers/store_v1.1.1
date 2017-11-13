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
    <title>申请建账</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-applyid.css"/>
</head>

<body>
<div class="bodybox opacity-box">
    <div class="contbox">
        <div class="div-box">
            <div class="title-text">申请建账</div>
        </div>
        <div class="div-box">
            <div class="div-box-1">申请标题:</div>
            <div class="div-box-2">申请建账</div>
        </div>
        <div class="div-box">
            <div class="div-box-1">申请人员:</div>
            <div class="div-box-2" id="applyPerson"></div>
        </div>
        <div class="div-box">
            <div class="div-box-1">建账客户:</div>
            <div class="div-box-2" id="userName"></div>
            <div class="div-box-2 div-box-view"  id="div-box-view">
                <a id="viewDetails">查看详情</a>
            </div>
        </div>
        <div class="am-g approver">
            <!--以类名标记添加-->
            <div class="div-box">
                <div class="div-box-1">审批人员:</div>
                <div class="div-box-2" id="accountBox">
                    <select name="" id="accountChecker" onchange="qm_applyid.approveMember(this.value)">
                        <%--<option value="">部门选择</option>--%>
                    </select>
                </div>
                <div class="div-box-2" id="approveBox">
                    <select name="" id="approveMember">
                        <%--<option value="">成员选择</option>--%>
                    </select>
                </div>

            </div>
            <div class="div-box">
                <div class="div-box-1">跟单人员:</div>
                <div class="div-box-2" id="branchBox">
                    <select id="branchMerchandiser" onchange="qm_applyid.getdocumentary(this.value)">

                    </select>
                </div>
                <div class="div-box-2" id="merchandiserBox">
                    <select id="Merchandiser">

                    </select>
                </div>
            </div>
        </div>
        <div class="am-g goods-box2">
            <div class="div-box-1 textarea-span">申请事由:</div>
            <textarea id="requestReason" class="goods-box2-2"></textarea>
        </div>
        <div class="div-box" id="dispose" style="display: none">
            <div class="title-text">处理方案</div>
        </div>
        <div class="am-g  data-del-off ">
            <div>
                <a class="del-but" onClick="qm_applyid.goBack()">返回</a>
            </div>
            <div class="del-but" id="submitBut" onclick="qm_applyid.submitBut()">
                提交
            </div>
            <div class="del-but" id="disagree" onclick="qm_applyid.disagreeApplyBut()">
                拒绝
            </div>
            <div class="del-but" id="consent" onclick="qm_applyid.consentApplyBut()">
                通过
            </div>

        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>

<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-applyid.js"></script>
<script>
    qm_applyid.inint();
</script>
</html>