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
    <title>业务订单</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/indent/qm-salesOrderList.css"/>
</head>

<body>
<div class="bodybox list">
    <div class="header-sel-box">
        <%--<div class="selbox">--%>

            <div class="selseo" id="selseo-ul-1" onclick="qm_salesOrderList.SelectShow(this,event)"
                 onmouseleave="qm_salesOrderList.SelectHidden()">
                <span id="firstSeo">全部</span>

            </div>
            <div class="selseo" onclick="qm_salesOrderList.SelectShow(this,event)"
                 onmouseleave="qm_salesOrderList.SelectHidden()">
                <span id="stateSeo">全部</span>
                <ul class="selseo-ul">
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="">
                        <a class="selseo-a">全部</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="90">
                        <a class="selseo-a">待财务审核</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="92">
                        <a class="selseo-a">待跟单审核</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="101">
                        <a class="selseo-a">待发货</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="102">
                        <a class="selseo-a">已发货</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="105">
                        <a class="selseo-a">财务已拒绝</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="107">
                        <a class="selseo-a">退货成功</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="108">
                        <a class="selseo-a">交易成功</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="120">
                        <a class="selseo-a">退货待审批</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="122">
                        <a class="selseo-a">退货待收货</a>
                    </li>
                    <li class="selseo-li" onClick="qm_salesOrderList.onstateSelect(this,event);" name="123">
                        <a class="selseo-a">待退款</a>
                    </li>
                </ul>
            </div>
        <%--</div>--%>
        <div class="time-box">
            <input type="text" class="Wdate" id="txtBeginDay" name="beginday"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd' ,maxDate:'#F{$dp.$D(\'txtEndDay\')}'});"/>
            <input class="middle-sign" disabled="disabled" value="~"/>
            <input type="text" class="Wdate" id="txtEndDay" name="endday"
                   onclick="WdatePicker({onpicked:function(){qm_salesOrderList.timeSeo();;},dateFmt:'yyyy-MM-dd' ,minDate:'#F{$dp.$D(\'txtBeginDay\')}'});"/>
        </div>
        <div class="list-seek"><input id="keyWord" placeholder="请输入完整订单号"/><span class="selseo-i" onclick="qm_salesOrderList.keyWordBut()"></span></div>
        <div class="list-replacement" onclick="qm_salesOrderList.resetBut()">重置</div>
    </div>
    <div class="am-g qm-team1">
        <div class="list-title">
            <div class="list-headline">订单列表</div>
        </div>
        <div class="am-u-sm-12 qm-team1-box">
            <table class="am-table " id="table">
                <tbody>
                <tr>
                    <th>订单号</th>
                    <th>下单人</th>
                    <th>下单时间</th>
                    <th id="text-th4">关联业务员</th>
                    <th>付款状态</th>
                    <th>订单状态</th>
                    <th>操作区</th>
                </tr>
                <%--<tr>--%>
                    <%--<td>88888888 88--%>
                    <%--</td>--%>
                    <%--<td>赵子龙</td>--%>
                    <%--<td>2017-6-28</td>--%>
                    <%--<td></td>--%>
                    <%--<td></td>--%>
                    <%--<td><span>未确认<span class="color-red">(新订单)</span></span>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<a href="">订单详情</a>--%>
                    <%--</td>--%>
                <%--</tr>--%>

                </tbody>
            </table>
            <div class="paging">
                <div class="pagingleft" onclick="qm_salesOrderList.NextPage(this)">
                    下一页
                </div>
                <div class="pagingmodle">
                    <span id="pageleft">1</span>/<span id="pageright">1</span>
                </div>
                <div class="pagingleft" onclick="qm_salesOrderList.NextPage(this)">
                    上一页
                </div>

                <div class="paging-num-box" id="pagebox">
                    列表显示:<span class="paging-num" onclick="qm_salesOrderList.pageShowNum(this)">30</span>
                    <span class="paging-num" onclick="qm_salesOrderList.pageShowNum(this)">20</span>
                    <span class="paging-num paging-checked" onclick="qm_salesOrderList.pageShowNum(this)">10</span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/My97DatePicker/WdatePicker.js"></script>
<script src="${path}/pages/indent/qm-salesOrderList.js"></script>
<script>
    qm_salesOrderList.inint();
</script>

</html>