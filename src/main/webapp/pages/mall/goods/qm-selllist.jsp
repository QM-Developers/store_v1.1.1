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
    <link rel="stylesheet" type="text/css" href="${path}/pages/mall/goods/qm-selllist.css"/>

</head>

<body>
<div class="bodybox opacity-box">
    <div class="goodslist">
        <header class="goodslist-header">
            <button class="goodslist-but" data-am-modal="{target: '#popup2'}">添加销售点</button>
        </header>
        <section class="goodslist-list">
            <div class="goodslist-list-titlebox">
                <div class="goodslist-list-title">
                    <div class="goodslist-title-text">销售点列表</div>
                </div>
            </div>
            <div class="goodslist-list-table">
                <ul id="poslist">
                    <li class="goodslist-list-tr">
                        <div>名称</div>
                        <div>所属部门</div>
                        <div>负责人</div>
                        <div>联系电话</div>
                        <div class="item4">操作</div>

                    </li>
                    <%--<li class="goodslist-list-tr">--%>
                        <%--<div>江门销售点</div>--%>
                        <%--<div>韦善耀</div>--%>
                        <%--<div>15224637863</div>--%>
                        <%--<div class="item4">--%>
                            <%--<a href="">编辑</a>--%>
                            <%--<a href="">分配商品</a>--%>
                            <%--<a href="qm-goodslist.html">查看商品</a>--%>
                            <%--<a href="javascript:void(0)" onclick="DellLi(this)">删除</a>--%>
                        <%--</div>--%>
                    <%--</li>--%>

                </ul>
            </div>
        </section>

        <div class="paging" id="pagingbox">

            <div class="pagingright" onclick="qm_selllist.pagenext(this)">
                下一页
            </div>
            <div class="pagingmodle">
                <span id="pagenumleft">1</span>/<span id="pagenumright">1</span>
            </div>

            <div class="pagingright" onclick="qm_selllist.pagenext(this)">
                上一页
            </div>
            <div class="paging-num-box" id="shownum">
                显示条数:<span class="paging-num " onclick="qm_selllist.shownum(this)">30</span>
                <span class="paging-num " onclick="qm_selllist.shownum(this)">20</span>
                <span class="paging-num paging-checked" onclick="qm_selllist.shownum(this)">10</span>
            </div>
        </div>
    </div>
    <!--弹窗-->
    <div class="am-popup change-popup" id="popup2">
        <div class="am-popup-inner">
            <div class="am-popup-hd" style="background: #02b4fe;">
                <h4 class="am-popup-title" style="color: #FFFFFF;" id="popup-title-text">添加销售点</h4>
                <span data-am-modal-close class="am-close" style="color: #FFFFFF;opacity: 1;">&times;</span>
            </div>
            <div class="am-popup-bd change-bd">
                <div class="popthree">
                    <ul class="poptwo-c-ul">
                        <li class="poptwo-c-li">
                            <div class="am-u-sm-3 pop-div1">销售点名称 :</div>
                            <div class="am-u-sm-9 pop-div2"><input id="branch-name"/></div>
                        </li>
                        <li class="poptwo-c-li">
                            <div class="am-u-sm-3 pop-div1">所属部门 :</div>
                            <div class="am-u-sm-9 pop-div2">
                                <select onchange="qm_selllist.findMemberList(this.value)" id="department-list"></select>
                            </div>
                        </li>
                        <li class="poptwo-c-li">
                            <div class="am-u-sm-3 pop-div1">负责人 :</div>
                            <div class="am-u-sm-9 pop-div2">
                                <select id="member-list" onchange="qm_selllist.findMemberPhone(this.value)"></select>
                            </div>
                        </li>
                        <li class="poptwo-c-li">
                            <div class="am-u-sm-3 pop-div1">联系电话 :</div>
                            <div class="am-u-sm-9 pop-div2"><input id="member-phone" disabled="disabled"/></div>
                        </li>
                        <li class="poptwo-c-li">
                            <div class="am-u-sm-3 pop-div1">区域地址 :</div>
                            <hidden id="branch-lat-lng"/>
                            <div class="am-u-sm-9 pop-div2"><input disabled="disabled" id="branch-area"/></div>
                        </li>

                        <li class="site-map-li">
                            <div class="site-map" id="map">
                            </div>
                            <div class="sitemapseo">
                                <span>所在区域定位</span>
                                <input id="tip" type="text"/>
                                <%--<i class="sitemapseo-i"></i>--%>
                            </div>
                        </li>
                        <li class="poptwo-c-li">
                            <button data-am-modal-close class="poptwo-but">取消</button>
                            <button class="poptwo-but" id="submit" onclick="qm_selllist.addBranch();">提交</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=b1a08879807aa89903aa4aae1fca4bbf&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.ToolBar"></script>
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<%--<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=b1a08879807aa89903aa4aae1fca4bbf"></script>--%>
<%--<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>--%>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/UrlUtil.js"></script>
<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>
<script type="text/javascript" src="${path}/pages/common/dragMap.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/mall/goods/qm-selllist.js"></script>
<script type="text/javascript">
    qm_selllist.init();
</script>
</html>