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
    <link rel="stylesheet" type="text/css" href="${path}/pages/repertory/qm-transferrecord.css"/>
</head>

<body>
<div class=" bodybox">
    <div class="header">
        <div class="react-but" onclick="qm_transferRtecord.resetBut()">重置</div>
        <div class="time-box">
            <input id="d5221" class="Wdate" type="text"
                   onclick="var d5222=$dp.$('d5222');WdatePicker( { onpicked:function(){d5222.click();},maxDate:'#F{$dp.$D(\'d5222\') }'} )"/>
            <input class="middle-sign" disabled="disabled" value="~"/>
            <input id="d5222" class="Wdate" type="text"
                   onclick="WdatePicker( { onpicked:function(){qm_transferRtecord.timeSeo();},maxDate:'#F{$dp.$D(\'d5222\') }'} )"/>
        </div>
        <div class="seo-sel" >
            <select  id="stataSeo" onchange="qm_transferRtecord.stataSeo()">
                <option value="">全部</option>

            </select>
        </div>
        <div class="seo-sel" id="seoSelBox">
            <select id="seoSel" onchange="qm_transferRtecord.getBranchRecord(this.value)">
                <option value="">全部</option>
            </select>
        </div>
    </div>
    <div class="header-title" id="headerName">
        调货记录
    </div>
    <table class="am-table" id="ul-table">
        <tr class="list-tr">
            <td class="list-td">申请人</td>
            <td class="list-td">调货单号</td>
            <td class="list-td">申请时间</td>
            <td class="list-td">签收时间</td>
            <td class="list-td">调货单状态</td>
            <td class="list-td">操作区</td>

        </tr>
        <%--<tr class="list-tr">--%>
        <%--<td class="list-td">201708291234</td>--%>
        <%--<td class="list-td">李二狗</td>--%>
        <%--<td class="list-td">2017-10-6</td>--%>
        <%--<td class="list-td">总部仓库</td>--%>
        <%--<td class="list-td">--%>
        <%--<a>查看详情</a>--%>
        <%--</td>--%>
        <%--</tr>--%>



    </table>

    <div class="paging">

        <div class="pagingright" onclick="qm_transferRtecord.NextPage(this)">
            下一页
        </div>
        <div class="pagingmodle">
            <span id="pageleft">1</span>/<span id="pageright">1</span>
        </div>
        <div class="pagingleft" onclick="qm_transferRtecord.NextPage(this)">
            上一页
        </div>
        <div class="paging-num-box" id="pagebox">
            列表显示:<span class="paging-num" onclick="qm_transferRtecord.pageShowNum(this)">30</span>
            <span class="paging-num" onclick="qm_transferRtecord.pageShowNum(this)">20</span>
            <span class="paging-num paging-checked" onclick="qm_transferRtecord.pageShowNum(this)">10</span>
        </div>
    </div>
</div>

</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script src="${path}/pages/repertory/qm-transferrecord.js"></script>
<script type="text/javascript" src="${path}/pages/My97DatePicker/WdatePicker.js"></script>
<script>
    qm_transferRtecord.inint()
</script>

</html>

