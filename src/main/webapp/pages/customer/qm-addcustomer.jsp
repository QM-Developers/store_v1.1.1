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
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-addcustomer.css"/>


</head>

<body>
<div class="data-module">
    <div class="groupdata qm-team">
        <div class="groupdata-box">
            <div class="groupdata-title">
                <h4 class="qm-c-p am-u-sm-8">添加客户</h4>
            </div>
            <div class="groupdata-cont">
                <div class="am-u-sm-10">
                    <ul>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2">客户名称:</span><input id="customer-name" class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">性　　别:</span>
                            <div class="am-u-sm-8 am-u-end pop-div2 sex" id="customer-sex" style="padding-top: 3px;">
                                <a href="###" name="male" onclick="PopInput(this)" val="男" class="poptwo-c-lia  man">男</a>
                                <a href="###" onclick="PopInput(this)" name="woman" val="女" class="poptwo-c-lia woman">女</a>
                            </div>
                        </li>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2">联系电话:</span><input id="customer-phone" class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">生　　日:</span>
                            <div style="height: 40px;padding: 0;float: left;" class="am-u-sm-8 am-u-end">
                                <div class="poptime ">
                                    <input class=" am-u-sm-10" id="customer-birthday"/>
                                    <button onclick="QmTime(this)" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                                </div>
                            </div>
                        </li>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2">身份证号:</span><input id="customer-identity" class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">信用评级:</span>
                            <div class="am-u-sm-8 am-u-end groupdata-credit" id="credit-rating">
                                <a class="groupdata-grade groupdata-credit-bg" val="3" onclick="Credit(this)">优秀</a>
                                <a class="groupdata-grade groupdata-credit-bg" val="2" onclick="Credit(this)">一般</a>
                                <a class="groupdata-grade groupdata-credit-bg" val="1" onclick="Credit(this)">差评</a>
                            </div>
                        </li>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2 ">所在城市:</span>
                            <div class="am-u-sm-8 am-u-end">
                                <!--style="z-index: 200;"-->
                                <hidden id="lng-and-lat"></hidden>
                                <input style="width: 100%;" onclick="Site(this);return false;" id="customer-area" placeholder="地址"/>
                                <div class="am-tabs qm-site" data-am-tabs="{noSwipe: 1}" style="border: 0;">
                                    <ul class="am-tabs-nav am-nav am-nav-tabs qm-site-ul" style="border: 0;">
                                    </ul>
                                    <div class="am-tabs-bd" style="background: #dcd2d2;border: 0;"></div>
                                </div>
                            </div>
                        </li>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2">详细地址:</span><input id="customer-address" class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">客户分类:</span>
                            <select id="customer-group" class="groupdata-sel am-u-sm-8 am-u-end">
                                <option value="c_g_0">个体户</option>
                                <option value="c_g_1">经销商</option>
                                <option value="c_g_2">合作农户</option>
                                <option value="c_g_3">合作社</option>
                            </select>
                        </li>
                        <li>
                            <div id="container" style="width: 300px;height: 150px"></div>
                            <div id="tip">
                                <input type="text" id="keyword" name="keyword" value="请输入关键字：(选定后搜索)" onfocus='this.value=""'/>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--删除-->
    <div class="am-g  data-del-off ">
        <div>
            <button class="del-but">返回</button>
        </div>
        <div>
            <button class="del-but">删除资料</button>
        </div>
        <div>
            <button class="del-but" onclick="qm_groupdata.addCustomerRecord();">保存</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<%--<script type="text/javascript" src="${path}/pages/customer/"></script>--%>

<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=b1a08879807aa89903aa4aae1fca4bbf&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.ToolBar"></script>
<!-- UI组件库 1.0 -->
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<script type="text/javascript" src="${basePath}/pages/common/dragMap.js"></script>

<script type="text/javascript">
    qm_groupdata.init();
    dragMap.init("container", "keyword", qm_groupdata.dragMapSuccess, qm_groupdata.dragMapFail);
</script>

</html>