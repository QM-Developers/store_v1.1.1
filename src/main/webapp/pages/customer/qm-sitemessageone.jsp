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
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-sitemessageone.css"/>
</head>

<body>
<div class="bodybox opacity-box">
    <div class="site-header" id="siteheader">
        <a class="site-header-but"><i class="site-header-i"></i>添加养殖</a>
    </div>
    <div class="site-title" id="sitetitle">
        <a class="sitetitle-a"></a>
        <div class="site-title-text">场地信息</div>
    </div>
    <div class="sitemessagebox" id="sitemessagebox">

        <ul class="am-u-sm-10">
            <li class="site-li" style="position: relative;">
                <span class="am-u-sm-2 span">场地位置 :</span>
                <input class="am-u-sm-8 am-u-end disable-sign"  onclick="qm_sitemessageone.inputmap(this)"
                       id="userPlaceArea"/>
                <div class=" mapstyle" id="map">
                    <div class="sitemapseo" id="sitemapseo">
                        <span>区域定位</span>
                        <input id="tip" type="text"/>

                    </div>
                    <i class="sitemapseo-i" onclick="qm_sitemessageone.mapHidden()">关闭</i>
                </div>
            </li>
            <li class="site-li">
                <span class="am-u-sm-2 span">场地类型 :</span>
                <div class="am-u-sm-8 am-u-end selbox">
                    <select id="userPlaceType" class="disable-sign">
                        <option value="no">无限定</option>
                        <option value="allow">可养区</option>
                        <option value="forbid">限养区</option>
                        <option value="restrict">禁养区</option>
                    </select>
                    <div class="shade-sel"></div>
                </div>

            </li>
            <li class="site-li">
                <span class="am-u-sm-2 span">工人数量 :</span>
                <%--<input id="userEmployeeNum" class="am-u-sm-8 am-u-end disable-sign"/>--%>
                <input id="userEmployeeNum" class="am-u-sm-8 am-u-end disable-sign" onkeyup="indenxlogin.inputVal(this)" contentEditable="indenxlogin.inputVal(this)" onblur="indenxlogin.inputVal(this)">
            </li>
        </ul>
        <div class="but-box" id="compilebox">
            <div class="site-compile " id="cancelCompile" style="display: none;" onclick="qm_sitemessageone.cancelCompile()">
                取消
            </div>
            <div class="site-compile" id="changeCompile" onclick="qm_sitemessageone.changeCompile()">
                编辑
            </div>

        </div>
        <div class="but-box" id="butbox" >
            <button class="but" onClick="javascript :history.back(-1);">返回</button>
            <button class="but" onclick="qm_sitemessageone.submitMessage()">提交</button>
        </div>
    </div>
    <div class="sitelist-box am-g" id="sitelistbox">
        <div class="site-title">
            <div>养殖产品列表</div>
        </div>
        <div class="site-table-box">
            <table class="am-table " id="table">
                <tbody>
                <tr>
                    <th>养殖类目</th>
                    <th>养殖品种</th>
                    <th>养殖类型</th>
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
                <div class="goback" id="goback" onclick="qm_sitemessageone.gobock()">
                   返回
                </div>
                <div class="goback" id="removedata" onclick="qm_sitemessageone.removeSite()">
                    删除
                </div>

                <div class="pagingright" onclick="qm_sitemessageone.NextPage(this)">
                    下一页
                </div>
                <div class="pagingmodle">
                    <span id="pageleft">1</span>/<span id="pageright">1</span>
                </div>
                <div class="pagingleft" onclick="qm_sitemessageone.NextPage(this)">
                    上一页
                </div>

                <div class="paging-num-box" id="pagebox">
                    人数显示:<span class="paging-num" onclick="qm_sitemessageone.pageShowNum(this)">30</span>
                    <span class="paging-num" onclick="qm_sitemessageone.pageShowNum(this)">20</span>
                    <span class="paging-num paging-checked" onclick="qm_sitemessageone.pageShowNum(this)">10</span>
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
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script src="${path}/pages/customer/qm-sitemessageone.js"></script>
<%--<script type="text/javascript" src='//webapi.amap.com/maps?v=1.3&key=b1a08879807aa89903aa4aae1fca4bbf'></script>--%>
<!-- UI组件库 1.0 -->

<script type="text/javascript">
    qm_sitemessageone.inint();
</script>

</html>