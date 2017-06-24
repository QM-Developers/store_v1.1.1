<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人资料</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/team/qm-personage.css"/>
</head>

<body>
<div class=" qm-header">
    <!--头部容器-->

</div>
<!--seo-->
<div class="qm-c-list companylist" id="companylist">
    <div class="qm-c-company ">
        <h4 class="qm-c-p">搜索结果列表</h4>

        <ul class="qm-c-ul">
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
        </ul>
    </div>
    <div class="paging">
        <div class="pagingright">
            下一页
        </div>
        <div class="pagingmodle">
            <span>1</span>/<span>4</span>
        </div>

        <div class="pagingleft">
            上一页
        </div>
    </div>
</div>
<!--个人-->
<div class="personage">
    <div class="qm-team" id="Personal">
        <div class="groupdata-title">
            <h4 class="qm-c-p">个人资料</h4>

        </div>
        <div class="am-g ">
            <div class="am-u-sm-2" style="text-align: center;">
                <img class="am-circle am-img-thumbnail" src="../../img/ceshi3.jpg" width="120" height="120"/>
            </div>
            <div class="am-u-sm-8 ">
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">姓　　名:</span><input class=" am-u-sm-4 am-u-end"/>

                    <span class=" am-u-sm-1">性　　别:</span>
                    <div class="pop-div2 sex-show" style="display: block;">
                        女
                    </div>
                    <!--poptwo-c-lia1-->
                    <div class="pop-div2 sex" style="display: none;">
                        <a href="###" name="male" onclick="PopInput(this)" class="poptwo-c-lia  man">男</a>
                        <a href="###" onclick="PopInput(this)" name="woman" class="poptwo-c-lia woman">女</a>
                    </div>
                </div>
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">生　　日:</span>
                    <div style="padding: 0;" class="am-u-sm-4 ">
                        <div class="poptime ">
                            <input class="bor-no pop-input" type="" name="" value=""/>
                            <button onclick="QmTime(this)" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                        </div>
                    </div>
                    <span class=" am-u-sm-1">身份证号:</span><input class=" am-u-sm-4 am-u-end"/>
                </div>
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">联系电话:</span><input class=" am-u-sm-4 am-u-end"/>

                    <span class=" am-u-sm-1">常住地址:</span><input class=" am-u-sm-4 am-u-end"/>
                </div>
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">所属公司:</span><input class=" am-u-sm-4 am-u-end"/>
                    <span class=" am-u-sm-1">所属部门:</span><input class=" am-u-sm-4 am-u-end"/>

                    <!--<span class=" am-u-sm-1">入职时间:</span>
                    <div style="height: 53px;padding: 0;float: left;" class="am-u-sm-4 ">
                        <div class="poptime">
                            <input class="bor-no pop-input" type="" name="" value="" />
                            <button onclick="QmTime(this)" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                        </div>
                    </div>-->

                </div>
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">工作职位:</span><input class=" am-u-sm-4 am-u-end"/>

                </div>

            </div>
            <div class="am-u-sm-2 qm-c-compile">

                <div class="qm-c-compile1" onclick="Compile(this)">编辑</div>

            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/team/control.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>

</html>