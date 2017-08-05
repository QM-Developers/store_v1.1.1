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
    </script>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/mall/goods/qm-goodslist.css"/>
</head>
<body>

<div class="goodslist bodybox">
    <header class="goodslist-header">
        <a class="goodslist-but" href="qm-typeSelect.jsp?option=add">添加商品</a>
    </header>
    <section class="goodslist-list">
        <div class="goodslist-list-titlebox">
            <div class="goodslist-list-title">
                <div class="goodslist-title-text">商品列表</div>
                <!--<div class="goodslist-title-text goodslist-title-text1">(江门销售点)</div>-->
            </div>
            <div class=" am-fr header-right">
                <div class="am-fr put-box">
                    <input class="header-put" id="keyword" placeholder="输入关键字符"/><span onclick="qm_goodslist.findGoodsListByKeyword();" class="header-span"></span>
                </div>
            </div>
        </div>
        <div class="goodslist-list-table">
            <ul id="goods-list">
                <li class="goodslist-list-tr">
                    <div class="item1">序号</div>
                    <div class="item2">商品名称</div>
                    <div class="item4">分类</div>
                    <div class="item3">
                        <div class="item3-box">
                            <div class="item3-2">规格</div>
                            <div class="item3-3">单价(元)</div>
                            <div class="item3-4">库存</div>
                        </div>
                    </div>
                    <div class="item4">发布时间</div>
                    <div class="item4">操作区</div>
                </li>
            </ul>
        </div>
    </section>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/script/js/UrlUtil.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>
<script type="text/javascript" src="${path}/pages/mall/goods/qm-url-params.js"></script>

<script type="text/javascript" src="${path}/pages/mall/goods/qm-goodslist.js"></script>
<script type="text/javascript">
    qm_goodslist.init();
</script>
</html>