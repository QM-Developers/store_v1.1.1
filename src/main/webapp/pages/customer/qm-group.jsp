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
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-group.css"/>
</head>

<body>
<div class=" data-header">
    <div class=" qm-header-left">
        <a class="qm-but1" href="qm-groupdata.jsp">客户建档</a>
    </div>
    <div class=" am-fr qm-header-right">
        <div class="am-fr qm-put-box">
            <input class="qm-header-put" placeholder="输入关键字符"/><span id="seobut" class=" qm-header-span"></span>
        </div>
    </div>
</div>
<!--列表-->

<div class="data-module">
    <div class="groupdata qm-team">
        <div class="groupdata-box">

            <div class="groupdata-title">
                <h4 class="qm-c-p am-u-sm-8">客户资料</h4>
                <div class="am-u-sm-2" onclick="Groupdata_select(this)">
                    <div class="groupdata_select">
                        生产场地<span class="am-icon-angle-down "></span>
                        <div class="groupdata_select-ul">
                            <div>
                                <a class="site-select-a" href="qm-sitedata.jsp">场地1</a>
                            </div>
                            <div>
                                <a class="site-select-a" href="qm-sitedata.jsp">场地2</a>
                            </div>

                            <div>添加场地</div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="groupdata-cont">
                <div class="am-u-sm-10">
                    <ul>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2">客户名称:</span><input class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">性　　别:</span>
                            <div class="am-u-sm-9 pop-div2 sex-show" style="display: block;line-height: 35px;">
                                女
                            </div>
                            <!--poptwo-c-lia1-->
                            <div class="am-u-sm-8 am-u-end pop-div2 sex" style="display: none;">
                                <a href="###" name="male" onclick="PopInput(this)" class="poptwo-c-lia  man">男</a>
                                <a href="###" onclick="PopInput(this)" name="woman" class="poptwo-c-lia woman">女</a>
                            </div>
                        </li>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2">联系电话:</span><input class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">生　　日:</span>
                            <div style="height: 53px;padding: 0;float: left;" class="am-u-sm-8 am-u-end">
                                <div class="poptime ">
                                    <input class=" am-u-sm-10"/>
                                    <button onclick="QmTime(this)" style="display: none;" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                                </div>
                            </div>
                        </li>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2">产品种类:</span><input class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">信用评级:</span>
                            <div class="am-u-sm-8 am-u-end groupdata-credit groupdata-credit-rate">
                                <a class="groupdata-grade groupdata-credit-bg" onclick="Credit(this)">优秀</a>
                                <a class="groupdata-grade groupdata-credit-bg" onclick="Credit(this)">一般</a>
                                <a class="groupdata-grade groupdata-credit-bg" onclick="Credit(this)">差评</a>

                            </div>

                        </li>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2 ">所在城市:</span>
                            <div class="am-u-sm-8 am-u-end">
                                <!--style="z-index: 200;"-->
                                <input style="width: 100%;" type="" name="" onclick="Site(this);return false;" value="" placeholder="地址"/>
                                <div class="am-tabs qm-site" data-am-tabs="{noSwipe: 1}" style="border: 0;">
                                    <ul class="am-tabs-nav am-nav am-nav-tabs qm-site-ul" style="border: 0;">
                                    </ul>
                                    <div class="am-tabs-bd" style="background: #dcd2d2;border: 0;">
                                    </div>

                                </div>
                            </div>
                        </li>
                        <li class="groupdata-li">
                            <span class="am-u-sm-2">详细地址:</span><input class="am-u-sm-8 am-u-end"/>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">客户分类:</span>
                            <select name="" class="groupdata-sel am-u-sm-8 am-u-end" disabled="disabled">
                                <option value="">分类1</option>
                                <option value="">分类2</option>
                                <option value="">分类3</option>
                            </select>
                        </li>
                    </ul>
                </div>
                <div class="am-u-sm-2 am-u-end">
                    <div class="qm-c-compile1" onclick="Compile(this)">
                        编辑
                    </div>
                    <div class="qm-c-compile1 ">
                        取消
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--客户状态-->
    <div class="groupdata qm-team">
        <div class="groupdata-box">
            <div class="groupdata-title">
                <h4 class="qm-c-p">客户状态</h4>
            </div>
            <div class="groupdata-cont groupdata-cont2">
                <div class="am-u-sm-12">
                    <ul>
                        <li class="groupdata-li"><span class="am-u-sm-2">建立档案:</span><span class="groupdata-record">2017/5/21</span><span>(已通过)</span>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">建立账号:</span>
                            <div class="am-u-sm-10 am-u-end groupdata-credit">
                                <!--<span class="groupdata-checkbox ">成功建账<span>2017/5/2</span></span>-->
                                <span class="groupdata-checkbox ">未建账</span>
                                <span class="sponsor">发起建账</span>
                                <!--<span class="groupdata-checkbox "></span>-->
                            </div>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">资料更新:</span>
                            <div class="am-u-sm-10 deal-state">
                                <div class="deal-state1"><span>数次</span><span class="deal-state2">5</span></div>
                                <div class="deal-state1"><span>最近时间</span><span class="deal-state2">2017/5/21</span>
                                </div>
                            </div>
                        </li>
                        <li class="groupdata-li"><span class="am-u-sm-2">最近交易:</span>
                            <div class="am-u-sm-10  deal-state">
                                <div class="deal-state1"><span>时间</span><span class="deal-state2">2017/5/21</span></div>
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
            <button class="del-but">移交客户</button>
        </div>
        <div>
            <button class="del-but">申请协助</button>
        </div>
        <div>
            <button class="del-but">客户订单</button>
        </div>
        <div>
            <button class="del-but">客户跟进</button>
        </div>
    </div>
</div>
<!--弹窗-->
<div id="Prompt-box" class="potential-box">
    <div class="pop-one ">
        <div class="potential ">
            <div class="potential-left">待跟进客户</div>
            <div class="potential-right">X</div>
        </div>
        <div class="potential-cont">
            <div class="potential-cont-box">
                <ul class="potential-cont-ul">
                    <li class="potential-cont-li">
                        <div class="potential-cont-name">嘎嘎嘎</div>
                        <div class="potential-cont-a">
                            <div class="potential-cont-span"></div>
                        </div>
                    </li>
                    <li class="potential-cont-li">
                        <div class="potential-cont-name">嘎嘎嘎</div>
                        <div class="potential-cont-a">
                            <div class="potential-cont-span"></div>
                        </div>
                    </li>
                    <li class="potential-cont-li">
                        <div class="potential-cont-name">嘎嘎嘎</div>
                        <div class="potential-cont-a">
                            <div class="potential-cont-span"></div>
                        </div>

                    </li>
                    <li class="potential-cont-li">
                        <div class="potential-cont-name">嘎嘎嘎</div>
                        <div class="potential-cont-a">
                            <div class="potential-cont-span"></div>
                        </div>

                    </li>
                    <li class="potential-cont-li">
                        <div class="potential-cont-name">嘎嘎嘎</div>
                        <div class="potential-cont-a">
                            <div class="potential-cont-span"></div>
                        </div>

                    </li>

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

    </div>
</div>
</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-group.js"></script>

</html>