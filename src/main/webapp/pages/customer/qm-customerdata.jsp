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
    <title></title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${path}/script/webuploader-0.1.5/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-customerdata.css"/>

</head>
<body>
<div class="bodybox">
        <div class="customerdata qm-team">
            <div class="customerdata-box">
                <div class="customerdata-title" >
                    <h4 class="h4">客户资料</h4>
                </div>
                <div class="customerdata-cont">
                        <div id="sitelist" class=""></div>
                        <ul class="frist-ul">
                            <li class="customerdata-li"><span class="am-u-sm-2">客户名称 :</span><input id="userName" class="am-u-sm-8 am-u-end disable-sign"  /></li>
                            <li class="customerdata-li"><span class="am-u-sm-2">客户性别 :</span>
                                <div id="userSex" class="am-u-sm-9 pop-div2 sex-show" style="display: block;line-height: 33px;    padding-left: 5px;">

                                </div>
                                <div class="am-u-sm-8 am-u-end pop-div2 sex" id="Sex" style="display: none;">
                                    <a  name="male" onclick="PopInput(this)" class="sex-unchecked  man">男</a>
                                    <a  onclick="PopInput(this)" name="woman" class="sex-unchecked woman">女</a>
                                </div>
                            </li>
                            <li class="customerdata-li"><span class="am-u-sm-2">联系电话 :</span><input id="userPhone"  class="am-u-sm-8 am-u-end disable-sign"  /></li>
                            <li class="customerdata-li"><span class="am-u-sm-2">出生年月 :</span>
                                <div style="height: 53px;padding: 0;float: left;" class="am-u-sm-8 am-u-end">
                                    <div class="poptime ">
                                        <input id="userBirthday"  class=" am-u-sm-10 disable-sign"  />
                                        <button onclick="QmTime(this)" id="databut" style="display: none;" class="am-btn am-btn-default  am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                                    </div>
                                </div>
                            </li>
                            <li class="customerdata-li"><span class="am-u-sm-2">客户评级 :</span>
                                <select name="" class="customerdata-sel am-u-sm-8 am-u-end disable-sign" id="creditRating"  >
                                    <option value="0">无级别</option>
                                    <option value="1">初级型</option>
                                    <option value="2">技术型</option>
                                    <option value="3">诚信型</option>
                                    <option value="4">赖账型</option>
                                </select>
                                <i class="li-shade"></i>

                            </li>
                            <li class="customerdata-li"><span class="am-u-sm-2">客户住址 :</span><input id="userAddress"  class="am-u-sm-8 am-u-end disable-sign" /></li>
                            <li class="customerdata-li"><span class="am-u-sm-2">客户分类 :</span>
                                <div id="customerType" class=" customerType"> </div>
                            </li>
                        </ul>

                    <div class="complie-box" id="compliebox">

                        <div class="qm-c-compile1 " style="display: none;" onclick="qm_customerdata.cancelCustomerData(this)">
                            取消
                        </div>
                        <div class="qm-c-compile1" onclick="qm_customerdata.Compile(this)">
                            编辑
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%--相片--%>
        <div class="container">
            <span class='containertitle'>身份证照片</span>
            <ul class="thumbnails" id="gallery">
                <li class="span3">
                    <div class="imgbox img-1 filePicker" id="front" >
                        <%--<a class="img-a">--%>
                            <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                            <%--<img src="../images/ceshi5.jpg">--%>
                        <%--</a>--%>
                        <div class="am-progress add-progress am-progress-striped">
                            <div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>
                        </div>
                        <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
                    </div>
                </li>
                <li class="span3">
                    <div class="imgbox img-2 filePicker" id="reverse"  >
                        <%--<a class="img-a">--%>
                            <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                            <%--<img alt="" src="../images/ceshi6.png">--%>
                        <%--</a>--%>
                        <div class="am-progress add-progress am-progress-striped">
                            <div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>
                        </div>
                        <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
                    </div>
                </li>
                <li class="span3">
                    <div class="imgbox img-3 filePicker" id="idcard" >
                        <%--<a class="img-a">--%>
                            <%--<i class="removeimage" onclick='removeImage(this)'>X</i>--%>
                            <%--<img alt="" src="../images/ceshi4.jpg">--%>
                        <%--</a>--%>
                        <div class="am-progress add-progress am-progress-striped">
                            <div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>
                        </div>
                        <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
                    </div>
                </li>
            </ul>
        </div>
        <!--客户状态-->
        <div class="customerdata qm-team">
                <div class="customerdata-title">
                    <h4 class="h4">客户状态</h4>
                </div>
                <div class="customerdata-cont customerdata-cont2">
                    <div class="frist-ul">
                        <ul>
                            <li class="customerdata-li"><span class="am-u-sm-2">建立档案:</span><span class="customerdata-record" id="userCreateDate"></span></li>

                            <li class="customerdata-li"><span class="am-u-sm-2">建立账号:</span>
                                <div class=" customerdata-credit">
                                    <span id="hadAccount" class="deal-state2"><i>未建账</i></span>

                                    <%--<a class="sponsor" id="yijianzhang">已建账</a>--%>
                                </div>
                            </li>
                            <li class="customerdata-li">
                                <span class="am-u-sm-2">更新次数:</span><span class="deal-state2" id="updateCount">5</span>
                            </li>
                            <%--<li class="customerdata-li">--%>
                                <%--<span class="am-u-sm-2">跟单人员:</span><span class="deal-state2">张三and李四</span>--%>

                            <%--</li>--%>
                            <li class="customerdata-li">
                                <span class="am-u-sm-2">更新时间:</span><span class="deal-state2" id="userUpdateTime"></span>

                            </li>
                            <%--<li class="customerdata-li">--%>
                                <%--<span class="am-u-sm-2">最近交易 :</span><span class="deal-state2">2017-6-26</span>--%>

                            <%--</li>--%>
                        </ul>
                    </div>
                    <a class="sponsor" id="sponsor">申请建账</a>
                </div>
        </div>
        <!--删除-->
        <div class=" data-del-off ">
            <div>
                <a class="del-but" onclick="qm_customerdata.goback()">返回</a>
            </div>
            <div>
                <a class="del-but" id="applytransfer" >移交客户</a>
            </div>
            <div>
                <a  class="del-but" id="record">拜访记录</a>
            </div>

        </div>

</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-customerdata.js"></script>
<script type="text/javascript">
    qm_customerdata.init()
</script>
<%--<script type="text/javascript">--%>
    <%--Mouseleave = function(item) {--%>
        <%--$(item).css("border", '0').find(".customerdata_select-ul").css('display', 'none')--%>
    <%--}--%>

<%--</script>--%>
</html>