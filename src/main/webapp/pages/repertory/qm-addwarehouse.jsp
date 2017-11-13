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
    <link rel="stylesheet" type="text/css" href="${path}/pages/repertory/qm-addwarehouse.css"/>
</head>

<body>

<div class=" bodybox opacity-box">
    <div class="header" id="header">
        进仓单
    </div>
    <div class="header-data">
        <ul class="ul-box">
            <li id="frist-li">
                <span class="li-span">操作人员:</span><input id="operatorName" class="li-input" readonly type="text"/>
            </li>
            <li id="second-li">
                <span class="li-span">操作仓库:</span><input id="branchName" class="li-input" readonly type="text"/>
            </li>
            <li id="four-li">
                <span class="li-span">审批人:</span><input id="approver" class="li-input" readonly type="text"/>
            </li>
            <li id="third-li">
                <span class="li-span" id="orderNumber">进仓单号:</span><input id="recordCode" class="li-input" readonly type="text"/>
            </li>

        </ul>
        <div class="textarea-box ">
            <span class="li-span">添加备注:</span>
            <textarea id="textareaText" class="text-box"  name="" rows="" cols=""></textarea>

        </div>
    </div>
    <div class="header-box">
        <div class="header-title">商品列表</div>
    </div>

    <ul>
        <li class="list-tr list-tr-frist">
            <div class="list-td1">编号</div>
            <div class="list-td2">商品名称</div>
            <div class="list-td3">分类</div>
            <div class="list-toptd4">
                <div class="list-toptd4-box">
                    <div class="list-toptd4-1">规格</div>
                    <div class="list-toptd4-1 apply-1">库存</div>
                    <div class="list-toptd4-1 apply-2">操作数量</div>
                    <div class="list-toptd4-1 apply-3">操作区</div>
                </div>
            </div>
        </li>
        <li class="out">
            <div class="scrollbar" id="scrollbar">
                <div class="scrollbtn"></div>
            </div>
            <ul class="inner" id="ul-table" style="margin: 0;">

                <%--<li class="list-tr">--%>
                    <%--<div class="list-td1">1</div>--%>
                    <%--<div class="list-td2">米4T型4%小米牧场猪饲料</div>--%>
                    <%--<div class="list-td3">饲料原料</div>--%>
                    <%--<div class="list-td4">--%>
                        <%--<div class="list-td4-box">--%>
                            <%--<div class="list-td4-2">10kg/包</div>--%>
                            <%--<div class="list-td4-4">1500</div>--%>
                            <%--<div class="list-td4-3">--%>
                                <%--<input/>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>

            </ul>
        </li>
    </ul>

    <div class="paging">
        <div id="but1" class="paging-but" onclick="javascript :history.go(-1);">
           返回
        </div>
        <div id="but2" class="paging-but" onclick="qm_addwarehouse.cancelBut()">
            取消
        </div>
        <div id="but3" class="paging-but" onclick="qm_addwarehouse.submitBut()">
            提交
        </div>
        <div id="but4" class="paging-but" onclick="qm_addwarehouse.applyFinishBut()">
            确认签收
        </div>
        <div id="but5" class="paging-but" onclick="qm_addwarehouse.consentApplyBut()">
            同意
        </div>
    </div>
</div>

</body>

<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script src="${path}/pages/repertory/qm-addwarehouse.js"></script>
<script>
    qm_addwarehouse.inint();
</script>
<script type="text/javascript" src="${path}/script/js/scrollbar.js"></script>
<script type="text/javascript">
    $(function ()
    {
        console.log('111')
        $('.list-td4').each(function ()
        {
            var a = $(this).find('.list-td4-box').length;
            if (a < 2)
            {
                $(this).find('.list-td4-box').height($(this).height()).find('input').css('top', parseInt($(this).height() - 25) / 2 + 'px')
            }
        });

    })
</script>
</html>