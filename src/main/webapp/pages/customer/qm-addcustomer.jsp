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
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-addcustomer.css"/>

</head>
<body>
<div class="bodybox opacity-box">
    <div class="data-module">
        <div class="customerdata qm-team">
            <div class="customerdata-box">
                <div class="customerdata-title">
                    <h4 class="qm-c-p am-u-sm-8">客户资料</h4>
                </div>
                <div class="customerdata-cont">
                    <ul>
                        <li class="customerdata-li"><span class="am-u-sm-2">客户名称:</span>
                            <input id="userName" class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="customerdata-li"><span class="am-u-sm-2">客户性别:</span>

                            <div class="am-u-sm-8 am-u-end pop-div2 sex" style="padding-top: 3px;" id="userSex">
                                <a  name="male" onclick="qm_addcutomer.PopInput(this)"
                                   class="sex-unchecked sex-checked man">男</a>
                                <a  onclick="qm_addcutomer.PopInput(this)" name="woman" class="sex-unchecked woman">女</a>
                            </div>
                        </li>
                        <li class="customerdata-li"><span class="am-u-sm-2">联系电话:</span>
                            <input id="userPhone" maxlength="11" placeholder="请输入正确的手机号码"  class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="customerdata-li"><span class="am-u-sm-2">出生年月:</span>
                            <div style="height: 40px;padding: 0;float: left;" class="am-u-sm-8 am-u-end">
                                <div class="poptime ">
                                        <input id="userBirthday" type="text" onClick="WdatePicker()"/>
                                </div>
                            </div>
                        </li>
                        <li class="customerdata-li"><span class="am-u-sm-2">客户评级:</span>
                            <select name="" class="customerdata-sel am-u-sm-8 am-u-end" id="creditRating">
                                <option value="0">无级别</option>
                                <option value="1">技术型</option>
                                <option value="2">资本型</option>
                                <option value="3">资源型</option>
                                <option value="4">实干型</option>
                            </select>
                        </li>
                        <li class="customerdata-li"><span class="am-u-sm-2">客户住址:</span>
                            <input id="userAddress" maxlength="50" class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="customerdata-li"><span class="am-u-sm-2">客户分类:</span>
                            <select name="" class="customerdata-sel am-u-sm-8 am-u-end" id="customerType">
                                <option value="personal">个体农户</option>
                                <option value="dealer">经销商</option>
                                <option value="cooperation">合作农户</option>
                                <option value="cooperative">合作社</option>
                            </select>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--删除-->
        <div class="am-g  data-del-off ">
            <div>
                <button class="del-but" onclick="qm_addcutomer.adddata()">保存</button>
            </div>

        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/My97DatePicker/WdatePicker.js"></script>
<%--<script type="text/javascript" src="${path}/pages/common/control.js"></script>--%>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-addcustomer.js"></script>

</html>