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
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-manageunit.css" />
</head>

<body>
<div class="bodybox opacity-box">

    <div class="site-title" id="sitetitle">
        <a class="sitetitle-a"></a>
        <div class="site-title-text">单位信息</div>
    </div>
    <div class="sitemessagebox">
        <ul style="width: 100%;">
            <li class="site-li">
                <span class="span">单位名称 :</span>
                <input id="manageName"  class=" disable-sign" />
            </li>
            <li class="site-li">
                <span class="span">经营面积 :</span>
                <input id="manageAcreage" class=" disable-sign" />
            </li>
            <li class="site-li" style="position: relative;">
                <span class="span">场地位置 :</span>
                <input class="disable-sign" onclick="qm_manageunit.inputmap(this)" id="manageAddress" />
                <div class=" mapstyle" id="map">
                    <div class="sitemapseo" id="sitemapseo">
                        <span>区域定位</span>
                        <input id="tip" type="text" />

                    </div>
                    <i class="sitemapseo-i" onclick="qm_manageunit.mapHidden()">关闭</i>
                </div>
            </li>
            <li class="site-li" style="width: 100%;">
                <span class="span">工人数量 :</span>
                <div class="check-box" >
                    <%--onclick="qm_manageunit.addchecked(this)"--%>
                    <div class="checkbox"><span class="checkboxbut checkboxdata" ></span><span class="checkboxtext">猪</span></div>
                    <div class="checkbox"><span class="checkboxbut checkboxdata" ></span><span class="checkboxtext">鱼</span></div>
                    <div class="checkbox"><span class="checkboxbut checkboxdata" ></span><span class="checkboxtext">虾</span></div>

                    <div class="user-defined">
                        <div class="checkbox"><span class="checkboxbut"  id="textareabut"></span>自定义</div>
                        <textarea disabled="disabled" id="textarea" class="user-defined-cont" ></textarea>
                    </div>
                </div>
            </li>
        </ul>
        <div class="compile-box" id="compilebox">
            <div class="site-compile " id="cancelCompile"  onclick="qm_manageunit.gobock()">
                返回
            </div>
            <div class="site-compile " id="removedata" onclick="qm_manageunit.removeBut()">
                删除
            </div>
            <div class="site-compile" id="changeCompile" onclick="qm_manageunit.changeCompile()">
                编辑
            </div>
        </div>
        <div class="but-box" id="butbox">
            <button class="but" onClick="javascript :history.back(-1);">返回</button>
            <button class="but" onclick="qm_manageunit.submitMessage()">提交</button>
        </div>
    </div>
</div>
</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=b1a08879807aa89903aa4aae1fca4bbf&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.ToolBar"></script>
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<script type="text/javascript" src="${path}/pages/common/dragMap.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script src="${path}/pages/customer/qm-manageunit.js"></script>

<script type="text/javascript">
    qm_manageunit.inint();
</script>

</html>