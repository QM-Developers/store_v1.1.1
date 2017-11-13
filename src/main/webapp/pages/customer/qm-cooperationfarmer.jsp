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
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-cooperationfarmer.css"/>
</head>

<body>
<div class="bodybox opacity-box">
    <div class="site-header" id="siteheader">
        <a class="site-header-but"><i class="site-header-i"></i>添加场地</a>
    </div>
    <div class="site-title" id="sitetitle">
        <a hidden="hidden"></a>
        <div class="site-title-text">农户信息</div>
    </div>
    <div class="sitemessagebox">
        <ul class="am-g">
            <li class="site-li" style="position: relative;">
                <span class="am-u-sm-2 span">农户姓名 :</span>
                <input class="am-u-sm-8 am-u-end disable-sign"    id="farmerName"/>

            </li>
            <li class="site-li" style="position: relative;">
                <span class="am-u-sm-2 span">联系电话 :</span>
                <input class="am-u-sm-8 am-u-end disable-sign"   id="farmerPhone"/>

            </li>
        </ul>
        <div class="am-g compile-box" id="compilebutbox">
            <div class="site-compile site-compile-1" >
                取消
            </div>
            <div class="site-compile" id="compilebox" onclick="qm_cooperationfarmer.compile(this)">
                编辑
            </div>

        </div>
        <div class="but-box" id="butbox">
        <button class="but" onClick="javascript :history.back(-1);">取消</button>
        <button class="but" onclick="qm_cooperationfarmer.submitbut()">提交</button>
        </div>
    </div>
    <div class="sitelist-box am-g" id="sitelistbox">
        <div class="site-title">
            <div>场地资源列表</div>
        </div>
        <div class="site-table-box">
            <table class="am-table " id="table">
                <tbody>
                <tr>
                    <th>场地位置</th>
                    <th>场地类型</th>
                    <th>工人数量</th>
                    <th>操作区</th>
                </tr>
                <%--<tr>--%>
                    <%--<td>广东省江门市鹤山市沙坪街道文华路381号</td>--%>
                    <%--<td>无限定</td>--%>
                    <%--<td>10</td>--%>
                    <%--<td>--%>
                        <%--<a class="personnel-details" href="">详细信息</a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>

                </tbody>
            </table>
            <div class="paging">

                <div class="goback pagingright" id="goback" onclick="qm_cooperationfarmer.gobock()">
                   返回
                </div>
                <div class="goback pagingright" id="removedata" onclick="qm_cooperationfarmer.removeFarmerBut()">
                    删除
                </div>

                <div class="pagingright" onclick="qm_cooperationfarmer.NextPage(this)">
                    下一页
                </div>
                <div class="pagingmodle">
                    <span id="pageleft">1</span>/<span id="pageright">4</span>
                </div>
                <div class="pagingleft" onclick="qm_cooperationfarmer.NextPage(this)">
                    上一页
                </div>

                <div class="paging-num-box" id="pagebox">
                    人数显示:<span class="paging-num" onclick="qm_cooperationfarmer.pageShowNum(this)">30</span>
                    <span class="paging-num" onclick="qm_cooperationfarmer.pageShowNum(this)">20</span>
                    <span class="paging-num paging-checked" onclick="qm_cooperationfarmer.pageShowNum(this)">10</span>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script src="${path}/pages/customer/qm-cooperationfarmer.js"></script>
<script type="text/javascript">
    qm_cooperationfarmer.inint();
</script>

</html>