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
    <title>总部仓库</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/repertory/qm-warehouse.css"/>
</head>

<body>

<div class=" bodybox">
    <div class="header">

        <a class="header-but" id="buildMonad" ><i class="header-i"></i>新建进仓单</a>
        <a class="header-but" id="checkMonad"  ><i class="header-i"></i>新建盘点单</a>
        <div class="selbox">

            <div class="selseo" id="selseo-ul-1" onclick="qm_warehouse.SelectShow(this,event)" onmouseleave="qm_warehouse.SelectHidden()">
                <span></span>
                <i class="icion-i"></i>
            </div>
            <div class="selseo" onclick="qm_warehouse.SelectShow(this,event)" onmouseleave="qm_warehouse.SelectHidden()">
                <span></span>
                <i class="icion-i"></i>
            </div>
            <div class="selseo" onclick="qm_warehouse.SelectShow(this,event)" onmouseleave="qm_warehouse.SelectHidden()">
                <span></span>
                <i class="icion-i"></i>
            </div>
        </div>
        <div class="am-fr reset-but" onclick="qm_warehouse.resetBut()">重置</div>
        <div class="am-fr seo-box">
            <input class="seo-put" id="keyword" placeholder="输入商品名称或编号"/>
            <span id="seobut" class="seo-span" onclick="qm_warehouse.goodsSeo()"></span>
        </div>

    </div>

    <div class="header-box" id="header-box">
        <div class="header-title">商品列表</div>
    </div>
    <div class="">
        <ul id="ul-table">
            <li class="list-li">
                <div class="item1">编号</div>
                <div class="item2">商品名称</div>
                <div class="item3">分类</div>
                <div class="item4-frist">
                    <div class="item4-frist-box">
                        <div class="item4-1">规格</div>
                        <div class="item4-3">剩余库存</div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="paging">
        <div class="gobockbut" id="gobockbut" onclick="javascript:history.back(-1)">
            返回
        </div>
        <div class="pagingright" onclick="qm_warehouse.NextPage(this)">
            下一页
        </div>
        <div class="pagingmodle">
            <span id="pageleft">1</span>/<span id="pageright">1</span>
        </div>
        <div class="pagingleft" onclick="qm_warehouse.NextPage(this)">
            上一页
        </div>

        <div class="paging-num-box" id="pagebox">
            列表显示:<span class="paging-num" onclick="qm_warehouse.pageShowNum(this)">30</span>
            <span class="paging-num" onclick="qm_warehouse.pageShowNum(this)">20</span>
            <span class="paging-num paging-checked" onclick="qm_warehouse.pageShowNum(this)">10</span>
        </div>
    </div>
</div>

</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script src="${path}/pages/repertory/qm-warehouse.js"></script>
<script>
    qm_warehouse.inint()
</script>
<script>

    $(window).resize(function ()
    {
        $('.item4').each(function ()
        {
            var item4Box = $(this).find('.item4-box').length;
            if (item4Box < 2)
            {
                $(this).find('.item4-box').css('height', $(this).height()).find('div').css({
                    'height': $(this).height(),
                    'line-height': $(this).height() + 'px'
                })
            }
        })
    });

</script>
</html>