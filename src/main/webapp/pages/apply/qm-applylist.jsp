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
    <title></title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/apply/qm-applylist.css"/>

</head>

<body>
<div class="bodybox">
    <div class="header">
        <a class="header-but" id="buildMonad" href="../apply/qm-application.jsp?addApply=1" ><i class="header-i"></i>发起申请</a>
    </div>
    <div class="am-g qm-team1">
        <div class="header-title">
            <div class="header-text">通用申请记录</div>
        </div>
        <div class="table-box">
            <table class="am-table " id="table">
                <tbody>
                <tr class="tr-bgcolor">
                    <th>标题</th>
                    <th>申请时间</th>
                    <th>审批进度</th>
                    <th>操作区</th>
                </tr>
                </tbody>
            </table>
            <div class="paging">

                <div class="pagingleft" onclick="qm_applylist.NextPage(this)">
                    下一页
                </div>
                <div class="pagingmodle">
                    <span id="pageleft">1</span>/<span id="pageright">1</span>
                </div>
                <div class="pagingleft" onclick="qm_applylist.NextPage(this)">
                    上一页
                </div>

                <div class="paging-num-box" id="pagebox">
                    列表显示:<span class="paging-num" onclick="qm_applylist.pageShowNum(this)">30</span>
                    <span class="paging-num" onclick="qm_applylist.pageShowNum(this)">20</span>
                    <span class="paging-num paging-checked" onclick="qm_applylist.pageShowNum(this)">10</span>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<%--<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>--%>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/apply/qm-applylist.js"></script>
<script>
    qm_applylist.inint();
</script>

</html>