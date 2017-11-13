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
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-customerlist.css"/>
</head>
<body>
<div class="bodybox opacity-box">
    <div class="customerheader">
        <%--<a class="add-user"  href="qm-addcustomer.jsp">客户建档</a>--%>
        <div class="am-fr seo-box">
            <input id="inputSeo" class="seo-put"  placeholder="输入电话号码或姓名"/>
            <span id="seobut" onclick="qm_customerlist.inputSeo()" class="seo-span"></span>
        </div>
        <select name="" class="user-state" id="secondSeo" >
            <option value="">全部状态</option>
            <option value="0">未建账</option>
            <option value="1">已建账</option>
            <option value="2">已冻结</option>

        </select>
        <select name="" class="user-state"  id="fristSeo" >
            <option value="">全部用户</option>
            <option value="personal">个体户</option>
            <option value="dealer">经销商</option>
            <option value="cooperation">合作农户</option>
            <option value="cooperative">合作社</option>
        </select>
    </div>
    <div class="tabledata">
        <div class="table-title" id="Clientid">
            <a hidden></a>
            <div class="qm-list">客户列表</div>
        </div>
        <div class="table">
            <table class="am-table " id="customerlist">
                <tbody>
                <tr>
                    <th>客户名称</th>
                    <th>性别</th>
                    <th>联系电话</th>
                    <th>客户分类</th>
                    <th>建账状态</th>
                    <th>操作区</th>
                </tr>
                <%--<tr>--%>
                <%--<td>忘忧果</td>--%>
                <%--<td>男</td>--%>
                <%--<td>10086010110</td>--%>
                <%--<td>个体</td>--%>
                <%--<td>未建账</td>--%>
                <%--<td>--%>
                <%--<a class="personnel-details" href="">详细信息</a>--%>
                <%--</td>--%>
                <%--</tr>--%>
                </tbody>
            </table>

        </div>
        <div class="paging">
            <div class="pagingright" onclick="qm_customerlist.NextPage(this)">
                下一页
            </div>
            <div class="pagingmodle">
                <span id="pageleft">1</span>/<span id="pageright">1</span>
            </div>
            <div class="pagingleft" onclick="qm_customerlist.NextPage(this)">
                上一页
            </div>

            <div class="paging-num-box" id="pagebox">
                列表显示:<span class="paging-num" onclick="qm_customerlist.pageShowNum(this)">30</span>
                <span class="paging-num" onclick="qm_customerlist.pageShowNum(this)">20</span>
                <span class="paging-num paging-checked" onclick="qm_customerlist.pageShowNum(this)">10</span>
            </div>
        </div>
    </div>
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
                <%--<input type="text" id="followDate" class="am-form-field addcolor addborder" placeholder="日历组件"--%>
                       <%--data-am-datepicker="{theme: 'success'}" readonly/>--%>
                    <input id="followDate" type="text" onClick="WdatePicker()"/>
            </div>

        </div>
        <div class="goods-box1">
            <div class="goods-box1-1">事宜标题 :</div>
            <div class="goods-box1-2">
                <input type="text" id="recordTitle" >
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
                <button class="del-but" onclick="qm_customerlist.recordHidden()">取消</button>
            </div>

            <div>
                <button class="del-but" onclick="qm_customerlist.recordBut()">保存</button>
            </div>

        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-customerlist.js"></script>

<script type="text/javascript">
    qm_customerlist.inint();
</script>

</html>