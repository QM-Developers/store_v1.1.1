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
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-departments.css"/>

    <script type="text/javascript">
        var departmentId = document.URL.split("?")[1];
    </script>
</head>

<body>
<div class=" department-header">
    <!--头部容器-->
    <div class=" department-header-left">
        <button class="department-but1"><a href="qm-departments.jsp">添加部门</a></button>
        <button class="department-but1"><a href="qm-member.jsp">添加成员</a></button>
    </div>
</div>
<div class="Corporation">
    <div class="qm-team Department">
        <div class="groupdata-title">
            <h4 class="qm-c-p">新建部门</h4>
        </div>
        <div class="qm-teambox">
            <div class="qm-team-input">
                <span class="companyprofile-span">部门名称:</span>
                <input id="department-name"/>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">成立时间:</span>
                <div class="poptime">
                    <input id="create-date" class="pop-input"/>
                    <button onclick="QmTime(this);" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="position">
        <div class="jurisdiction-box position-box">
            <div class="jurisdiction-but position-but" onclick="Addduty('')"><i></i>添加职位</div>
        </div>
        <div class="position-contbox" id="Contbox">
        </div>
    </div>
</div>
<div class="position-butbox">
    <div class="position-confirm" onclick="qm_department.addOrUpdateDepartment();">确定</div>
    <div class="position-cancel" onclick="qm_department.goBack()">返回</div>
    <div class="position-delduty" onclick="qm_department.deleteWindow()">删除</div>
</div>

<!--删除确认-->
<div id="Delall" class="prompt-box Del-all">
    <div id="Prompt" class="pop-one pop-one1">
        <div class="prompt-title">删除提示</div>
        <div class="prompt-frame1">
        </div>
        <div class="prompt-frame2">
            <div class="prompt-frame-box">
                <div class="prompt-frame-left" onclick="PromptOff(this)">
                    取消
                </div>
                <div onclick="qm_department.onPositiveClick()" class="prompt-frame-right">
                    确定
                </div>
            </div>
        </div>
    </div>
</div>

<div id="delete-info" class="prompt-box Del-all">
    <div class="pop-one pop-one1">
        <div class="prompt-title">删除提示</div>
        <div class="prompt-frame1">
        </div>
        <div class="prompt-frame2">
            <div class="prompt-frame-left prompt-one-left" onclick="PromptOff(this)">
                确定
            </div>
        </div>
    </div>
</div>
<!--职位权限-->
<div class="duty-box duty-Power">
    <div class="duty-one duty-one1 ">
        <div class="duty-title">职位权限选择</div>
        <div class="duty-frame1 duty-one2">
            <div class="duty-input">
                <span>职位名称</span>
                <span id="position-name"></span>
            </div>
            <div>
                <table class="am-table" style="border-collapse: collapse;">
                    <thead>
                    <tr style="background: #f7f7f7;">
                        <th class="duty-rights-1">办事权</th>
                        <th class="duty-rights-2">权限</th>
                        <th class="duty-rights-3">权限描述</th>
                    </tr>
                    </thead>
                    <tbody id="worker-permission"></tbody>
                </table>
            </div>
        </div>
        <div class="duty-frame2 ">
            <div class="duty-frame-box">
                <div onclick="qm_department.permissionClick()" class="duty-frame-left">确定</div>
                <div class="duty-frame-right" onclick="Dutyoff()">取消</div>
            </div>
        </div>
    </div>
</div>
<hidden id="position-id"/>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>

<script type="text/javascript">
    Addduty = function (name, positionId) {
        var count = $(".position-cont").length;
        var id = "position-id-" + count;
        var $dutynode = '<div class="position-cont">' +
            '<div class="position-input">' +
            '<input id="' + positionId + '" value="' + name + '"/>' +
            '</div>' +
            '<hidden id="' + id + '"/>' +
            '<div class="position-duty" onclick="qm_department.permissionWindow(this,\'position-id-' + count + '\')">职位权限</div>' +
            '<div class="position-del" onclick="qm_department.deletePosition(this,\'' + positionId + '\')">x</div>' +
            '</div>';
        $("#Contbox").append($dutynode);
        return id;
    }

    Delduty = function (item) {
        var $cont = $(item).parents('#Contbox').find(".position-cont").length;
        if ($cont == 1)
            return;
        $(item).parents(".position-cont").remove();
    }
    PromptOff = function (item) {
        $(item).parents(".Del-all").css("display", "none")
    }
    Delall = function (text) {
        $("#Delall .prompt-frame1").html(text);
        $("#Delall").css("display", "block");
    }
    DutyPower = function () {
        $(".duty-Power").css("display", "block")
    }
    Dutyoff = function () {

        $(".duty-Power").css("display", "none")
    }
    Power = function () {
        $(".department-power").css("display", "block")
    }
    Poweroff = function () {
        $(".department-power").css("display", "none")
    }

</script>

<script type="text/javascript" src="${path}/pages/management/qm-departments.js"></script>

<script type="text/javascript">
    qm_department.init();
</script>

</html>