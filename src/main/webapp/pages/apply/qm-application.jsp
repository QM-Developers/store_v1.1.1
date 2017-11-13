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
    <meta charset="UTF-8">
    <title>发起申请</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${path}/script/webuploader-0.1.5/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/apply/qm-application.css"/>

</head>

<body>
<div class="bodybox opacity-box">

    <%--<div class="allcontbox">--%>
        <div class="goods-box1">
            <div class="goods-title">申请单</div>
        </div>
        <div class="goods-box">

            <div class="goods-box1">
                <div class="goods-box1-1">申请标题:</div>
                <div class="goods-box1-2">
                    <input type="text" id="applyTitle"/>
                </div>

            </div>
            <div class="goods-box1">
                <div class="goods-box1-1">申请时间:</div>
                <div class="goods-box1-2 time">
                    <input type="text" class="Wdate" id="beginDate" name="beginday"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd' ,maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
                    <span class="middle-sign">至</span>
                    <input type="text" class="Wdate" id="endDate" name="endday"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
                </div>
                <span id="my-alert" class="my-alert" style="display: none;">开始日期应小于结束日期！</span>
            </div>
            <%--<div class="goods-box1">--%>
            <%--<div class="goods-box1-1">申请人:</div>--%>
            <%--<div class="goods-box1-2">--%>
            <%--啊啊啊--%>
            <%--</div>--%>

            <%--</div>--%>
            <%--<div class="goods-box1">--%>
            <%--<div class="goods-box1-1">关联人:</div>--%>
            <%--<div class="goods-box1-2">--%>
            <%--<input type="" name="" id="" value=""/>--%>
            <%--</div>--%>

            <%--</div>--%>
            <div class="am-g approver" id="approver">
                <!--以类名标记添加-->

                <div class="goods-box1 branchbox">
                    <div class="goods-box1-1">审批人员:</div>
                    <div class="goods-box1-2 ">
                        <select name="" class="branch" id="branch1" onchange="qm_application.onChangeVal(this)">

                        </select>
                    </div>

                    <div class="goods-box1-2 ">
                        <select name="" class="branchoption" id="branchoption1">

                        </select>
                    </div>
                    <div class="append" onclick="qm_application.addApprove(this)">
                        添加审批人
                    </div>
                </div>

                <!--<div class="goods-box1">
                    <div class="goods-box1-1">审批人:</div>
                    <div class="goods-box1-2">
                        <select name="">
                            <option value="">部门选择</option>
                        </select>
                    </div>

                    <div class="goods-box1-2">
                        <select name="">
                            <option value="">成员选择</option>
                        </select>
                    </div>
                    <div class="removethis" onclick="">
                        X
                    </div>
                </div>-->
            </div>
            <div class="am-g goods-box2">
                <div class="goods-box1-1">申请事由:</div>
                <textarea class="goods-box2-2" id="reason"></textarea>
            </div>

        </div>
        <div class="container">

            <span class='containertitle'>相关照片:(选填)</span>
            <ul class="thumbnails" id="gallery">
                <li class="span3">
                    <div class="imgbox  filePicker" id="front">
                        <%--<a class="img-a">--%>
                        <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                        <%--<img src="../images/ceshi5.jpg">--%>
                        <%--</a>--%>
                        <%--<div class="am-progress add-progress am-progress-striped">--%>
                        <%--<div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>--%>
                        <%--</div>--%>
                        <%--<div class="plan-bar"><span>上传图片-</span><span>90%</span></div>--%>
                    </div>
                </li>
                <li class="span3">
                    <div class="imgbox  filePicker" id="reverse">

                    </div>
                </li>
                <li class="span3">
                    <div class="imgbox  filePicker" id="idcard">

                    </div>
                </li>
            </ul>
        </div>
        <div id="dispose" style="display: none">
            <div class="goods-box1">
                <div class="goods-title">处理方案</div>
            </div>

        </div>
        <div class="am-g  data-del-off ">
            <div>
                <button class="del-but" onclick="javascript:history.back(-1)">返回</button>
            </div>
            <div>
                <button class="del-but" id="sbumitBut" onclick="qm_application.submitBut()">提交</button>
            </div>
            <div>
                <button class="del-but" id="disagree"  onclick="qm_application.disagreeApplyBut()">拒绝</button>
            </div>
            <div>
                <button class="del-but" id="consent"  onclick="qm_application.consentApplyBut()">通过</button>
            </div>
        </div>
    <%--</div>--%>
</div>

</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${path}/pages/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script src="${path}/pages/apply/qm-application.js"></script>
<script>
    qm_application.inint();
</script>


</html>