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
    <link rel="stylesheet" type="text/css" href="${path}/pages/team/qm-personal.css"/>
</head>

<body>
<div class="qm-team newdata" id="Personal">
    <div class="groupdata-title">
        <h4 class="qm-c-p">新增人员</h4>
    </div>
    <div class="am-g ">
        <div class="am-u-sm-10 ">
            <div class=" qm-team-input">
                <span class=" am-u-sm-1">姓　　名 :</span><input class=" am-u-sm-4 am-u-end"/>
                <span class=" am-u-sm-1">性　　别 :</span>
                <!--poptwo-c-lia1-->
                <div class="pop-div2 sex">
                    <a href="###" name="male" onclick="PopInput(this)" class="poptwo-c-lia  man">男</a>
                    <a href="###" onclick="PopInput(this)" name="woman" class="poptwo-c-lia woman">女</a>
                </div>
            </div>
            <div class=" qm-team-input">
                <span class=" am-u-sm-1">生　　日 :</span>
                <div class="am-u-sm-4 ">
                    <div class="poptime ">
                        <input class="bor-no pop-input" type="" name="" value=""/>
                        <button onclick="QmTime(this)" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                    </div>
                </div>
                <span class=" am-u-sm-1">身份证号 :</span><input class=" am-u-sm-4 am-u-end"/>
            </div>
            <div class=" qm-team-input">
                <span class=" am-u-sm-1">联系电话 :</span><input class=" am-u-sm-4 am-u-end"/>

                <span class=" am-u-sm-1">常住地址 :</span><input class=" am-u-sm-4 am-u-end"/>
            </div>
            <div class=" qm-team-input">
                <span class=" am-u-sm-1">所属公司 :</span><input class=" am-u-sm-4 am-u-end disabled-border" disabled="disabled" value="少时诵诗书所"/>
                <span class=" am-u-sm-1">所属部门 :</span><input class=" am-u-sm-4 am-u-end disabled-border" disabled="disabled" value="少时诵诗书所"/>
            </div>
            <div class=" qm-team-input">
                <span class=" am-u-sm-1">工作职位 :</span>
                <div class=" am-u-sm-4 am-u-end">
                    <select name="">
                        <option value="">负责人</option>
                        <option value="">人员</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</div>
<!--上传身份证-->
<div class="qm-team newdata">
    <div class="groupdata-title">
        <h4 class="qm-c-p">身份证照片 :</h4>
    </div>
    <div class="am-g ">
        <div class="am-u-sm-10 ">
            <div class="newdata-picture">
                <i class="newdata-picture-i">添加照片</i>
            </div>
            <div class="newdata-picture">
                <i class="newdata-picture-i">添加照片</i>
            </div>
        </div>
    </div>
</div>
<div class="am-g">

    <div class="del-but-box">
        <button class="del-but">提交</button>
        <button class="del-but">取消</button>
    </div>

</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/team/control.js"></script>
<script type="text/javascript" src="${path}/pages/team/qm-personal.js"></script>

<script type="text/javascript">

</script>

</html>