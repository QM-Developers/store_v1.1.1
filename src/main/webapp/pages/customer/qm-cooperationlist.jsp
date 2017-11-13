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
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-cooperationlist.css"/>
</head>

<body>
<div class="bodybox">
    <div class="site-header" id="siteheader">
        <a class="site-header-but"><i class="site-header-i"></i>添加农户</a>
    </div>
    <div class="site-title" id="sitetitle">
        <div class="site-title-text">合作社资料</div>
    </div>
    <div class="sitemessagebox">
        <ul class="am-u-sm-9">
            <li class="site-li" style="position: relative;">
                <span class="am-u-sm-2 span">经营地址 :</span>
                <input class="am-u-sm-8 am-u-end disable-sign" disabled="disabled"  id="userPlaceArea"/>
                <%--onclick="qm_cooperationsite.inputmap(this)"--%>
                <div class=" mapstyle" id="map">
                    <div class="sitemapseo" id="sitemapseo">
                        <span>区域定位</span>
                        <input id="tip" type="text"/>

                    </div>
                    <i class="sitemapseo-i" onclick="qm_cooperationlist.mapHidden()">关闭</i>
                </div>
            </li>
            <li class="site-li">
                <span class="am-u-sm-2 span">从事岗位 :</span>
                <div class="am-u-sm-8 am-u-end sel-box">
                    <select id="userPlaceType" class="disable-sign" disabled="disabled" onchange="qm_cooperationlist.SearchChange()">
                        <option value="">经销商</option>
                        <option value="">养殖户</option>
                        <option value="userdefined">自定义</option>
                    </select>
                    <input id="userdefined" class="disable-sign" >
                    <div class="shade-sel"></div>
                </div>
            </li>
        </ul>
        <div class="am-u-sm-3" id="Rcompile">
            <div class="site-compile site-compile-1" id="cancelCompile" onclick="qm_cooperationlist.cancelCompile(this)">
                取消
            </div>
            <div class="site-compile" id="compilebox" onclick="qm_cooperationlist.compile(this)">
                编辑
            </div>

        </div>
        <%--<div class="but-box" id="butbox">--%>
            <%--<button class="but" onClick="javascript :history.back(-1);">返回</button>--%>
            <%--<button class="but" onclick="qm_cooperationsite.submitMessage()">提交</button>--%>
        <%--</div>--%>
    </div>
    <div class="sitelist-box am-g" id="sitelistbox">
        <div class="site-title">
            <div>农户资源列表</div>
        </div>
        <div class="site-table-box">
            <table class="am-table " id="table">
                <tbody>
                <tr>
                    <th>农户姓名</th>
                    <th>联系电话</th>
                    <th>场地数量</th>
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
                <div class="goback" id="goback" onclick="qm_cooperationlist.gobock()">
                    返回
                </div>

                <div class="pagingbut" onclick="qm_cooperationlist.NextPage(this)">
                    下一页
                </div>
                <div class="pagingmodle">
                    <span id="pageleft">1</span>/<span id="pageright">4</span>
                </div>
                <div class="pagingbut" onclick="qm_cooperationlist.NextPage(this)">
                    上一页
                </div>

                <div class="paging-num-box" id="pagebox">
                    人数显示:<span class="paging-num" onclick="qm_cooperationlist.pageShowNum(this)">30</span>
                    <span class="paging-num" onclick="qm_cooperationlist.pageShowNum(this)">20</span>
                    <span class="paging-num paging-checked" onclick="qm_cooperationlist.pageShowNum(this)">10</span>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript"
        src="http://webapi.amap.com/maps?v=1.3&key=b1a08879807aa89903aa4aae1fca4bbf&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.ToolBar"></script>
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<script type="text/javascript" src="${path}/pages/common/dragMap.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script src="${path}/pages/customer/qm-cooperationlist.js"></script>
<script type="text/javascript">
    qm_cooperationlist.inint();
</script>

</html>