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
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-member.css"/>
</head>

<body>
<div class=" department-header">
    <!--头部容器-->
    <div class=" department-header-left">
        <button class="department-but1"><a href="qm-departments.jsp">添加部门</a></button>
        <button class="department-but1"><a href="qm-member.jsp">添加成员</a></button>

    </div>
</div>
<div class="qm-team newdata" id="Personal">
    <div class="groupdata-title">
        <div style="font-size: 18px;font-weight: 600;">添加成员</div>

    </div>
    <div class="member-title">
        <div class="member-title-left">基本信息</div>
        <div class="member-title-right" onclick="dutyshow()">个人权限</div>
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
                <span class=" am-u-sm-1">登录账号 :</span><input class=" am-u-sm-4 am-u-end"/>

                <span class=" am-u-sm-1">登录密码 :</span><input class=" am-u-sm-4 am-u-end"/>
            </div>
            <div class=" qm-team-input">
                <span class=" am-u-sm-1">联系电话 :</span><input class=" am-u-sm-4 am-u-end"/>

                <span class=" am-u-sm-1">身份证号 :</span><input class=" am-u-sm-4 am-u-end"/>
            </div>
            <div class=" qm-team-input">
                <span class=" am-u-sm-1">详细地址 :</span><input class=" am-u-sm-4 am-u-end "/>
                <span class=" am-u-sm-1">所属部门 :</span>
                <div class=" am-u-sm-4 am-u-end" style="height: 34px;">
                    <select name="" style="height: 100%;">
                        <option value="">负责人</option>
                        <option value="">人员</option>

                    </select>
                </div>
            </div>
            <div class=" qm-team-input">

                <span class=" am-u-sm-1">工作职位 :</span>
                <div class=" am-u-sm-4 am-u-end" style="height: 34px;">
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

    <div class="am-u-sm-12 newdata-picture-box">
        <div class="groupdata-title-1">
            <div>身份证照片 :</div>

        </div>
        <div class="newdata-picture">
            <i class="newdata-picture-i">添加照片</i>
        </div>
        <div class="newdata-picture">
            <i class="newdata-picture-i">添加照片</i>
        </div>

    </div>

</div>

<div class="del-but-box">
    <button class="del-but">提交</button>
    <button class="del-but">取消</button>
</div>
<!--权限-->
<div class="duty-box duty-Power">

    <div class="duty-one duty-one1 ">
        <div class="duty-title">个人权限选择</div>
        <div class="duty-frame1 duty-one2">
            <div class="duty-input">
                <span>个人名称</span>
                <input type=""/>
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
                    <tbody>
                    <tr>
                        <td class="describe-td-1">
                            <div class="describe">好友</div>
                        </td>
                        <td>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                        </td>
                        <td>
                            <span class="duty-describe">拥有管理好友的所有权利拥有管理好友的所有权利</span>
                            <span class="duty-describe">拥有管理好友的所有权利拥有管理好友的所有权利</span>

                        </td>
                    </tr>
                    <tr>
                        <td class="describe-td-1">
                            <div class="describe">好友</div>
                        </td>
                        <td>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>

                        </td>
                        <td>
                            <span class="duty-describe">拥有管理好友的所有权利拥有管理好友的所有权利</span>
                            <span class="duty-describe">拥有管理好友的所有权利拥有管理好友的所有权利</span>

                        </td>
                    </tr>
                    <tr>
                        <td class="describe-td-1">
                            <div class="describe">好友</div>
                        </td>
                        <td>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                            <div>
                                <input type="checkbox"/><span>好友管理权</span>
                            </div>
                        </td>
                        <td>
                            <span class="duty-describe">拥有管理好友的所有权利拥有管理好友的所有权利</span>
                            <span class="duty-describe">拥有管理好友的所有权利拥有管理好友的所有权利</span>

                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="duty-frame2">
            <div class="duty-frame-box">
                <div class="duty-frame-left">
                    确定
                </div>
                <div class="duty-frame-right" onclick="Dutyoff()">
                    取消
                </div>
            </div>

        </div>
    </div>
</div>

</body>
<script src="../../script/jquery/jquery-3.0.0.min.js"></script>
<script src="../../script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="../../script/js/myjs.js"></script>
<script type="text/javascript" src="../customer/control.js"></script>
<script type="text/javascript">
    dutyshow = function ()
    {
        $(".duty-Power").css("display", "block")
    }
</script>
</html>