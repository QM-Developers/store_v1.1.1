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
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-cooperativesite.css"/>
</head>

<body>
<div class="bodybox opacity-box">
    <div class="site-title">
        <div>场地信息</div>
    </div>
    <div class="sitemessagebox" id="userPlaceId">
        <ul class="am-u-sm-10" >
            <li class="site-li" style="position: relative;">
                <span class="am-u-sm-2 span">场地位置 :</span>
                <input class="am-u-sm-8 am-u-end disable-sign" onclick="qm_cooperativesite.inputmap()" id="userPlaceArea"/>
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
                <select name="" class="disable-sign " id="userPlaceType">
                    <option value="no">无限定</option>
                    <option value="allow">可养区</option>
                    <option value="forbid">限养区</option>
                    <option value="restrict">禁养区</option>
                </select>
                <div class="shade-sel"></div>
                </div>
            </li>
            <li class="site-li">
                <span class="am-u-sm-2 span">占地面积 :</span><input id="userPlaceAcreage" class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
            <li class="site-li">
                <span class="am-u-sm-2 span">权属人数 :</span><input id="userOwnerNum" class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
            <li class="site-li">
                <span class="am-u-sm-2 span">在养数量 :</span><input id="userAlreadyUse" class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
        </ul>
        <div class="am-u-sm-2">
            <div class="site-compile compile-show" id="compilebox" onclick="qm_cooperativesite.compile(this)">
                编辑
            </div>
            <div class="site-compile " style="display: none;" onclick="qm_cooperativesite.cancel(this)">
                取消
            </div>
        </div>
        <div class="but-box" id="butbox">

            <button class="but" onClick="javascript :history.back(-1);">取消</button>

            <button class="but" onclick="qm_cooperativesite.submitMessage()">提交</button>
        </div>
    </div>

    <div class="container" id="siteimgbox">
        <div class='containertitle'>所属证明 :</div>
        <ul class="thumbnails" id="gallery">
            <li class="span3">
                <div class="imgbox img-1 certificate " id="certificate1" onmouseenter="qm_cooperativesite.removeshow(this)" onmouseleave="qm_cooperativesite.removehidden(this)">

                    <%--<a class="img-a">--%>
                    <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                    <%--<img alt="" src="../../images/ceshi8.jpg">--%>
                    <%--</a>--%>
                    <div class="am-progress add-progress am-progress-striped">
                        <div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>
                    </div>
                    <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
                </div>

            </li>
            <li class="span3">
                <div class="imgbox img-2 certificate" id="certificate2" onmouseenter="qm_cooperativesite.removeshow(this)" onmouseleave="qm_cooperativesite.removehidden(this)">
                    <%--<a class="img-a">--%>
                    <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                    <%--<img alt="" src="../../images/ceshi6.png">--%>

                    <%--</a>--%>
                    <div class="am-progress add-progress am-progress-striped">
                        <div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>
                    </div>
                    <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
                </div>

            </li>
            <li class="span3">
                <div class="imgbox img-3 certificate" id="certificate3" onmouseenter="qm_cooperativesite.removeshow(this)" onmouseleave="qm_cooperativesite.removehidden(this)">
                    <%--<a class="img-a">--%>
                    <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                    <%--<img alt="" src="../../images/ceshi4.jpg">--%>
                    <%--</a>--%>
                    <div class="am-progress add-progress am-progress-striped">
                        <div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>
                    </div>
                    <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
                </div>

            </li>
        </ul>
    </div>
    <div class="container">
        <div class='containertitle'>场地环境 :</div>
        <ul class="thumbnails">
            <li class="span3">
                <div class="imgbox img-1 environment" id="environment1" onmouseenter="qm_cooperativesite.removeshow(this)" onmouseleave="qm_cooperativesite.removehidden(this)">

                    <%--<a class="img-a">--%>
                    <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                    <%--<img alt="" src="../../images/ceshi8.jpg">--%>
                    <%--</a>--%>
                    <div class="am-progress add-progress am-progress-striped">
                        <div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>
                    </div>
                    <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
                </div>

            </li>
            <li class="span3">
                <div class="imgbox img-2 environment" id="environment2" onmouseenter="qm_cooperativesite.removeshow(this)" onmouseleave="qm_cooperativesite.removehidden(this)">
                    <%--<a class="img-a">--%>
                    <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                    <%--<img alt="" src="../../images/ceshi6.png">--%>

                    <%--</a>--%>
                    <div class="am-progress add-progress am-progress-striped">
                        <div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>
                    </div>
                    <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
                </div>

            </li>
            <li class="span3">
                <div class="imgbox img-3 environment" id="environment3" onmouseenter="qm_cooperativesite.removeshow(this)" onmouseleave="qm_cooperativesite.removehidden(this)">
                    <%--<a class="img-a">--%>
                    <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                    <%--<img alt="" src="../../images/ceshi4.jpg">--%>
                    <%--</a>--%>
                    <div class="am-progress add-progress am-progress-striped">
                        <div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>
                    </div>
                    <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
                </div>

            </li>

        </ul>
    </div>
    <div class="paging" id="paging">
        <div class="goback" onclick="qm_cooperativesite.gobock()">
            返回
        </div>
        <div class="goback" onclick="qm_cooperativesite.removeSiteBut()">
            删除
        </div>
    </div>
</div>

</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript"
        src="http://webapi.amap.com/maps?v=1.3&key=b1a08879807aa89903aa4aae1fca4bbf&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.ToolBar"></script>
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${path}/pages/common/dragMap.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-cooperativesite.js"></script>
<script>
    qm_cooperativesite.inint();
</script>


</html>