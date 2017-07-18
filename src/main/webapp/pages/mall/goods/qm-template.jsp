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

    <link rel="stylesheet" href="../../../script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../../../reset.css"/>
    <link rel="stylesheet" href="qm-template.css"/>
</head>

<body>
<div class="bodybox">
    <div class="goodslist-list-titlebox">
        <div class="goodslist-title-text">运费模板</div>
    </div>
    <div class="">
        <table class="tablebox">
            <tr>
                <th>运输方式</th>
                <th>满载量</th>
                <th>起步范围/公里</th>
                <th>起步价/元</th>
                <th>没增加距离/公里</th>
                <th>增加费用/元</th>
                <th>
                    <span onclick="AddTr(this)">增加模板</span>
                </th>
            </tr>
            <tr>
                <td><input/></td>
                <td><input/></td>
                <td><input/></td>
                <td><input/></td>
                <td><input/></td>
                <td><input/></td>
                <td>
                    <a href="javascript:void(0);" onclick="Conserve(this)">保存</a>
                    <a href="javascript:void(0);" onclick="Deltr(this)">删除</a>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
<script src="../../../script/jquery/jquery-3.0.0.min.js"></script>
<script src="../../../script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
    Deltr = function (item)
    {
        $(item).parents("tr").remove()
    }
    //控制模板编写
    Conserve = function (item)
    {
        var $ThisInput = $(item).parents("tr").find("input");
        if ($ThisInput.attr("disabled"))
        {
            $ThisInput.removeAttr("disabled").css('border', '1px solid #ccc')
            $(item).text("保存")
        } else
        {
            $ThisInput.attr("disabled", 'disabled').css('border', '0')
            $(item).text("编辑")
        }
    }
    Addtemplate = function (item)
    {
        var $Tr = '<tr>' +
            '<td><input /></td>' +
            '<td><input /></td>' +
            '<td><input /></td>' +
            '<td><input /></td>' +
            '<td><input /></td>' +
            '<td><input /></td>' +
            '<td >' +
            '<a href="javascript:void(0);"  onclick="Conserve(this)">保存</a>' +
            '<a href="javascript:void(0);"  onclick="Deltr(this)">删除</a>' +

            '</td>' +
            '</tr>'

    }
</script>
</html>