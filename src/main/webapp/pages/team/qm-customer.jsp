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
        var did = document.URL.split("?")[1];
        var roleId = "${sessionScope.loginInfo.roleId}";
        var myTeamId = "${sessionScope.loginInfo.myTeamId}";
        var departmentType = "${sessionScope.loginInfo.departmentType}";
    </script>

    <meta charset="UTF-8">
    <title></title>

    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/team/qm-customer.css"/>
</head>

<body>
<!--header-->
<div class=" qm-header">
    <div class=" qm-header-left">
        <button id="creation" hidden="hidden" class="qm-but1">创建</button>
    </div>
    <div id="search-input-div" class=" am-fr qm-header-right">
        <div class="am-fr qm-put-box">
            <input class="qm-header-put" id="keyword" placeholder="输入关键字符"/><span onclick="qm_customerJS.search();" class=" qm-header-span"></span>
        </div>
    </div>
</div>
<!--SEO-->
<%--<div class="qm-search">--%>
    <%--<ul class="qm-search-u">--%>
        <%--<li class="qm-search-li  am-u-sm-2">--%>
            <%--<input placeholder="公司名称"/>--%>
        <%--</li>--%>
        <%--<li class="qm-search-li  am-u-sm-1">--%>
            <%--<input placeholder="负责人"/>--%>
        <%--</li>--%>
        <%--<li class="qm-search-li  am-u-sm-2" id="qm-search-time">--%>
            <%--<input id="my-startDate" class="qm-search-li3" placeholder="起始时间"> &#47;--%>
            <%--<input id="my-endDate" class="qm-search-li3" placeholder="结束时间">--%>
            <%--<div id="my-alert" style="display: none;position: absolute;top: -28px;left: 0;background: red;">--%>
                <%--开始日期应小于结束日期！--%>
            <%--</div>--%>
        <%--</li>--%>
        <%--<li class="qm-search-li  am-u-sm-1">--%>
            <%--<input placeholder="电话"/>--%>
        <%--</li>--%>
        <%--<li class="qm-search-li  am-u-sm-3">--%>
            <%--<input onclick="Site(this)" id="area" placeholder="地址"/>--%>
            <%--<div class="am-tabs qm-site" data-am-tabs="{noSwipe: 1}" id="doc-tab-demo-1">--%>
                <%--<ul class="am-tabs-nav am-nav am-nav-tabs qm-site-ul"></ul>--%>
                <%--<div class="am-tabs-bd" style="background: #dcd2d2;"></div>--%>
            <%--</div>--%>
        <%--</li>--%>
        <%--<!---->--%>
        <%--<li class="qm-search-li  am-u-sm-1 ">--%>
            <%--<div class="qm-but-li8" id="seobut">筛选</div>--%>
        <%--</li>--%>
    <%--</ul>--%>
<%--</div>--%>
<!--list-->
<div class="qm-c-list" id="search-div">
    <div class="qm-c-company ">
        <h4 class="qm-c-p">搜索结果列表</h4>
        <ul class="qm-c-ul" id="search-list"></ul>
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

<div id="emptydata">
    <!--部门资料-->
    <div class="qm-team Department" id="Department">
        <div class="groupdata-title">
            <h4 class="qm-c-p">部门资料</h4>
        </div>
        <div class="am-g qm-team-txt">
            <div class=" am-u-sm-10">
                <div class="qm-team-input">
                    <span class=" am-u-sm-1">公司名称:</span><input id="corporationName_text" class="am-u-sm-4 am-u-end"/>
                </div>
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">部门名称:</span><input id="departmentName_text" class="am-u-sm-4 am-u-end"/>
                    <span class=" am-u-sm-1">负责人:</span><input id="departmentPrincipalName_text" class="am-u-sm-4 am-u-end"/>
                </div>
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">部门人数:</span><input id="departmentPeopleNumber_text" class="am-u-sm-4 am-u-end"/>
                    <span class=" am-u-sm-1">成立时间:</span>
                    <div style="height: 53px;padding: 0;float: left;" class="am-u-sm-4 ">
                        <div class="poptime">
                            <input id="departmentCreateDate_text" class="bor-no pop-input"/>
                            <button onclick="QmTime(this)" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                        </div>
                    </div>
                </div>
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">联系电话:</span><input id="departmentPrincipalPhone_text" class="am-u-sm-4 am-u-end"/>
                </div>
            </div>
            <div class=" am-u-sm-2 qm-c-compile">
                <div onclick="Compile(this);" hidden="hidden" id="btn_department_edit" class="qm-c-compile1">编辑</div>
            </div>
        </div>
        <!---->
        <div class="am-g qm-team1">
            <div class="groupdata-title">
                <h4 class="qm-c-p">个人资料</h4>
            </div>
            <div class="am-u-sm-10 qm-team1-tab">
                <table class="am-table ">
                    <thead>
                    <tr>
                        <th>名称</th>
                        <th>性别</th>
                        <th>联系电话</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="am-u-sm-10 qm-team1-box">
                <table class="am-table ">
                    <tbody id="member-list"></tbody>
                </table>
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
    <div class="qm-team" id="Company">
        <div class="groupdata-title">
            <h4 class="qm-c-p">公司资料</h4>
        </div>
        <div class="am-g qm-team-txt">
            <div class=" am-u-sm-9">
                <div class="qm-team-input">
                    <span class=" am-u-sm-1">公司名称:</span><input id="companyName_text" class="am-u-sm-4 am-u-end"/>
                </div>
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">负责人:</span><input id="companyPrincipalName_text" class="am-u-sm-4 am-u-end"/>
                    <span class=" am-u-sm-1">成立时间:</span>
                    <div style="height: 53px;padding: 0;float: left;" class="am-u-sm-4 ">
                        <div class="poptime">
                            <input id="companyCreateDate_text" class="bor-no pop-input" type="" name="" value=""/>
                            <button onclick="QmTime(this)" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                        </div>
                    </div>
                </div>
                <div class=" qm-team-input">
                    <span class=" am-u-sm-1">联系电话:</span><input id="companyPrincipalPhone_text" class="am-u-sm-4 am-u-end"/>
                    <span class=" am-u-sm-1">公司地址:</span><input id="companyAddress_text" class="am-u-sm-4 am-u-end"/>
                </div>
            </div>
            <div class=" am-u-sm-3 qm-c-compile">
                <div class="qm-c-compile1" hidden="hidden" id="btn_company_edit">编辑</div>
            </div>
        </div>
        <!---->
        <div class="am-g qm-team1">
            <div class="groupdata-title">
                <h4 class="qm-c-p">职能机构</h4>
            </div>
            <div class="am-u-sm-10 qm-team1-tab">
                <table class="am-table ">
                    <thead>
                    <tr>
                        <th>部门</th>
                        <th>负责人</th>
                        <th>联系电话</th>
                        <th>成员</th>
                        <th>&nbsp;&nbsp;</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="am-u-sm-10 qm-team1-box">
                <table class="am-table ">
                    <tbody id="department-list"></tbody>
                </table>
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
</div>
<!--弹窗-->
<div id="popone" class="pop-one">
    <div class="qm-newteam">新增目标</div>
    <ul class="qm-popone-ul">
        <li id="add_type_text" class="qm-popone-li" data-am-modal="{target: '#popup1'}">
            添加公司/部门
        </li>
        <li class="qm-popone-li">
            <a class="qm-popone-li-a" href="qm-personal.jsp">添加人员</a>
        </li>
        <li class="qm-popone-li">取消</li>
    </ul>
</div>
<!--部门-->
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
                            <select id="addType" onchange="qm_customerJS.changeBelong();">
                                <option value="company">公司</option>
                                <option selected value="department">部门</option>
                            </select>
                        </div>
                    </li>
                    <li class="poptwo-c-li">
                        <div id="departmentText" class="am-u-sm-3 pop-div1">部门名称:</div>
                        <div class="am-u-sm-9 pop-div2"><input id="departmentName"/></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">成立时间:</div>
                        <div class="am-u-sm-9 pop-div2">
                            <div class="poptime poptime1">
                                <input class="pop-input" id="createDate"/>
                                <button onclick="QmTime(this)" class="am-btn am-btn-default  am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                            </div>
                        </div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="poptwo-li-but8">
                            <button onclick="qm_customerJS.addDepartmentOrCompany()">提交</button>
                            <button data-am-modal-close>取消</button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--///提示弹窗-->
<div id="Prompt-box" class="Prompt-box">
    <div id="Prompt" class="pop-one pop-one1">
        <div class="prompt-frame1">
            是否执行操作
        </div>
        <div class="prompt-frame2">
            <div class="prompt-frame-left" onclick="PromptCancel(this)">
                取消
            </div>
            <div onclick="qm_customerJS.changeOption(this)" class="prompt-frame-right">
                确定
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/customer/control.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/team/qm-customer.js"></script>
<script type="text/javascript">
    qm_customerJS.init();
    $(function ()
    {
        $("#seobut").click(function ()
        {
            $("#companylist").css("display", "block")
        });
    });
</script>

</html>