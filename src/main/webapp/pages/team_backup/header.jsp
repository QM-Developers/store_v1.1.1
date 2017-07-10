<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<script type="text/javascript">
    var path = "${path}";
    var basePath = "${basePath}";
</script>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <style type="text/css">
        .qm-header {
            height: 62px;
            margin: 14px 0 11px 0;
            background: #1468ff;
            border-bottom: 2px solid #00ff7b;
        }

        .qm-header button {
            background: #1468ff;
            border: none;
            font-size: 18px;
            line-height: initial;
            text-align: center;
            color: #fff;
        }

        .qm-but1 {
            width: 90px;
            height: 60px;
        }

        .qm-header-left {
            float: left;
        }

        .qm-header-right {
            margin-top: 10px;
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

        .pop-one {
            display: none;
            position: fixed;
            left: 50%;
            top: 50%;
            width: 500px;
            margin: -250px 0 0 -250px;
            z-index: 25;
        }

        .qm-newteam {
            height: 50px;
            line-height: 50px;
            font-size: 20px;
            text-align: center;
            background: #1467ff;
            color: #000;
            border-top: 1px solid #96a79d;
        }

        .qm-popone-ul {
            margin: 0;
            padding: 0;
        }

        .qm-popone-li {
            height: 50px;
            line-height: 50px;
            text-align: center;
            background: #d9d9d9;
            color: #000000;
            cursor: pointer;
            font-size: 18px;
        }

        .qm-popone-li .qm-popone-li-a {
            display: block;
            width: 100%;
            height: 100%;
            color: #000000;
        }

        .qm-popone-li:hover {
            background: #00abf0;
            color: #fff;
        }

        .am-popup .popthree {
            margin: auto;
            width: 440px;
            display: block;
            background: #fff;
            box-sizing: border-box;
            letter-spacing: 2px
        }

        .poptwo-c-li {
            box-sizing: border-box;
            height: 55px;
            padding-top: 10px;
        }

        .poptwo-c-li .pop-div1 {
            height: 100%;
            text-align: right;
            padding: 3px 10px 0 0;
        }

        .poptwo-c-li .pop-div2 {
            height: 100%;
        }

        .poptwo-c-li select {
            border: 1px solid #CCCCCC;
            border-radius: 5px;
            width: 100%;
            height: 35px;
        }

        .poptwo-li-but8 {
            text-align: right;
        }

        .poptwo-li-but8 button {
            width: 100px;
            height: 40px;
            border: none;
            background: #71bcfd;
        }

        .poptime {
            width: 100%;
            height: 32px;
            border-radius: 5px;
        }

        .poptime1 {
            border: 1px solid #CCCCCC;
            height: 37px;
        }

        .poptime .pop-input {
            width: 85%;
            float: left;
            border: none;
        }

        .qm-time-but {
            border: none;
            float: right;
            width: 15%;
            height: 100%;
            padding: 0;
            background: #fff;
        }

        .poptwo-c-li input {
            height: 35px;
            width: 100%;
            border: 1px solid #CCCCCC;
            border-radius: 5px;
        }

        .am-popup {
            height: auto;
        }
    </style>
</head>

<body>

<div class=" qm-header-left">
    <button class="qm-but1" onclick="Creationshow()">创建</button>
    <button class="qm-but1">刷新</button>

</div>

<div class=" am-fr qm-header-right">

    <div class="am-fr qm-put-box">
        <input class="qm-header-put" placeholder="输入关键字符"/><span id="seobut" class=" qm-header-span"></span>
    </div>
    <div class=" am-fr ">
        <select name="">
            <option value="">所有部门</option>
            <option value=""></option>
        </select>
    </div>
    <div class=" am-fr ">
        <select name="">
            <option value="">总公司</option>

            <option value=""></option>
        </select>
    </div>

</div>

<!--弹窗1-->
<div id="popone" class="pop-one">
    <div class="qm-newteam">新增目标</div>
    <ul class="qm-popone-ul">
        <li class="qm-popone-li" data-am-modal="{target: '#popup1'}" onclick="Creationhide()">
            添加公司/部门
        </li>
        <li class="qm-popone-li">
            <a class="qm-popone-li-a" href="qm-newdata.html">添加人员</a>
        </li>

        <li class="qm-popone-li">取消</li>
    </ul>

</div>
<!---->
<div class="am-popup" id="popup1">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">新增部门</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="popthree">
                <ul class="poptwo-c-ul">
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">归属选择:</div>
                        <div class="am-u-sm-9 pop-div2">
                            <select name="">
                                <option value="公司">公司</option>
                                <option value="部门">部门</option>

                            </select>
                        </div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">部门名称:</div>
                        <div class="am-u-sm-9 pop-div2"><input type="" name="" value=""/></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">成立时间:</div>
                        <div class="am-u-sm-9 pop-div2">
                            <div class="poptime poptime1">

                                <input class="pop-input" type="" name="" id="showtimebox" value=""/>
                                <button onclick="QmTime(this)" class="am-btn am-btn-default  am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                            </div>
                        </div>
                    </li>

                    <li class="poptwo-c-li">
                        <div class="poptwo-li-but8">
                            <button>提交</button>
                            <button data-am-modal-close>取消</button>
                        </div>

                    </li>

                </ul>

            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
    $(function ()
    {
        $("#seobut").click(function ()
        {
            $(".companylist").css("display", "block")
        });

        $(".qm-team input").attr("disabled", "true"); //禁用input

    });

    Creationshow = function ()
    {
        $("#popone").css("display", "block")
    };
    Creationhide = function ()
    {
        $("#popone").css("display", "none")
    };
</script>

</html>