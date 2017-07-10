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
    <style type="text/css">
        .qm-header-right {
            padding: 5px 0;
        }

        .qm-header-put {
            display: inline-block;
            float: left;
            width: 259px;
            height: 34px;
            border: none;
        }

        .qm-header-span {
            display: inline-block;
            width: 40px;
            height: 35px;
            cursor: pointer;
            background: url(../images/seo.jpg) no-repeat;
        }

        .qm-header-right select {
            width: 200px;
            height: 34px;
            margin-right: 10px;
        }

        /*弹窗1*/

    </style>
</head>
<body>
<div class=" am-fr qm-header-right">
    <div class="am-fr qm-put-box">
        <input class="qm-header-put" id="search-keyword" placeholder="输入关键字符"/><span onclick="header.findMemberByNameOrPhone()" id="seobut" class=" qm-header-span"></span>
    </div>
    <div class=" am-fr ">
        <select id="search-department">
        </select>
    </div>
</div>

<!--弹窗1-->

<!---->

</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>
<script type="text/javascript">
    $(function ()
    {
        $("#seobut").click(function ()
        {

            $(".companylist").css("display", "block")
        });

//			$(".qm-team input").attr("disabled", "true"); //禁用input

    });

    Creationshow = function ()
    {
        $("#popone").css("display", "block")

    }
    Creationhide = function ()
    {
        $("#popone").css("display", "none")

    }
</script>

<script type="text/javascript" src="${path}/pages/group/header.js"></script>
<script type="text/javascript">
    header.findDepartmentList();
</script>
</html>