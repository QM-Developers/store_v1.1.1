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
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-customerrecord.css"/>
</head>

<body>
<div class="bodybox opacity-box">
    <div class="site-header" id="addRecord">
        <a class="site-header-but" id="siteheader">
            <i class="site-header-i"></i>创建拜访
        </a>
    </div>
    <div class="listbox">
        <div class="header-title">
            <div class="qm-list">客户拜访记录</div>
        </div>
        <div>
            <table class="am-table" id="table">
                <tr>
                    <th>事宜标题</th>
                    <th>客户名称</th>
                    <th>拜访人员</th>
                    <th>拜访时间</th>
                    <th>操作区</th>
                </tr>
            </table>
        </div>
        <div class="paging">
            <div class="goback pagingleft" style="margin-left: 20px" id="goback" onclick="javascript:history.back(-1)">
                返回
            </div>
            <div class="pagingleft" onclick="qm_customerrecord.NextPage(this)">
                下一页
            </div>
            <div class="pagingmodle">
                <span id="pageleft">1</span>/<span id="pageright">1</span>
            </div>
            <div class="pagingleft" onclick="qm_customerrecord.NextPage(this)">
                上一页
            </div>
            <div class="paging-num-box" id="pagebox">
                列表显示:<span class="paging-num" onclick="qm_customerrecord.pageShowNum(this)">30</span>
                <span class="paging-num" onclick="qm_customerrecord.pageShowNum(this)">20</span>
                <span class="paging-num paging-checked" onclick="qm_customerrecord.pageShowNum(this)">10</span>
            </div>
        </div>
    </div>
</div>
<!--弹窗-->
<div class="recordbox" id="recordBox">
    <div class="goods-box1 goods-bg-cololr">
        <div class="goods-title">事件信息</div>
    </div>
    <div class="goods-box1">
        <div class="goods-box1-1">客户名称 :</div>
        <div class="goods-box1-2">
            <input id="customerName" type="text" disabled="disabled" class=" addcolor">
        </div>
    </div>
    <div class="goods-box1">
        <div class="goods-box1-1">拜访人员 :</div>
        <div class="goods-box1-2">
            <input id="userName" type="text" disabled="disabled" class=" addcolor">
        </div>
    </div>
    <div class="goods-box1">
        <div class="goods-box1-1">拜访时间 :</div>
        <div class="goods-box1-2 ">
            <input id="followDate" type="text" onClick="WdatePicker()"/>
        </div>
    </div>
    <div class="goods-box1">
        <div class="goods-box1-1">事宜标题 :</div>
        <div class="goods-box1-2">
            <input type="text" id="recordTitle">
        </div>
    </div>
    <div class=" goods-box2">
        <div class="goods-box1-1">交谈内容 :</div>
        <textarea id="followContent" class="goods-box2-2"></textarea>
    </div>
    <div class="am-g goods-box2 ">
        <div class="goods-box1-1">拜访结果 :</div>
        <textarea id="followResult" class="goods-box2-2"></textarea>
    </div>
    <div class="  data-del-off ">
        <div>
            <button class="del-but" id="cancel" onclick="qm_customerrecord.recordHidden()">取消</button>
        </div>
        <div>
            <button class="del-but" id="save" onclick="qm_customerrecord.recordBut()">保存</button>
        </div>
    </div>
</div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-customerrecord.js"></script>
<script>
    qm_customerrecord.inint();
</script>

</html>