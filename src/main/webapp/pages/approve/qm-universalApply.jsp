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
    <title>通用申请审批</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/approve/qm-universalApply.css"/>

</head>

<body>
<div class="bodybox">
    <div class="header-nav">

        <div class="am-fr seo-box">
            <%--<input class="seo-put"  placeholder="输入关键字符"/>--%>
            <%--<span id="seobut" class="seo-span"></span>--%>
                <select class="seo-put" id="selState" onchange="qm_universalApply.stateSeo()">
                    <option value="">全部</option>
                    <option value="10">待审批</option>
                    <option value="11">已通过</option>
                    <option value="12">已拒绝</option>
                </select>
        </div>
    </div>
    <div class="am-g ">
        <div class="header-title">
            <div class="header-text">通用申请审批</div>
        </div>
        <div class="table-box">
            <table class="am-table " id="table">
                <tbody>
                <tr class="tr-bgcolor">
                    <th>申请人</th>
                    <th>标题</th>
                    <th>申请时间</th>
                    <th>审批进度</th>
                    <th>操作区</th>
                </tr>
                <%--<tr>--%>
                    <%--<td>申请协助</td>--%>
                    <%--<td>2017/7/3</td>--%>
                    <%--<td>待审批</td>--%>
                    <%--<td>--%>
                        <%--<a href="">详细信息</a>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                </tbody>
            </table>
            <div class="paging">

                <div class="pagingleft" onclick="qm_universalApply.NextPage(this)">
                    下一页
                </div>
                <div class="pagingmodle">
                    <span id="pageleft">1</span>/<span id="pageright">1</span>
                </div>
                <div class="pagingleft" onclick="qm_universalApply.NextPage(this)">
                    上一页
                </div>

                <div class="paging-num-box" id="pagebox">
                    列表显示:<span class="paging-num" onclick="qm_universalApply.pageShowNum(this)">30</span>
                    <span class="paging-num" onclick="qm_universalApply.pageShowNum(this)">20</span>
                    <span class="paging-num paging-checked" onclick="qm_universalApply.pageShowNum(this)">10</span>
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
<script type="text/javascript" src="${path}/pages/approve/qm-universalApply.js"></script>
<script>
    qm_universalApply.inint();
</script>

</html>