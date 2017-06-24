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
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/group.css">
</head>
<body>
<div class="admin-content">
    <div style="height: 90%" class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">我的客户</strong></div>
        </div>
        <hr/>
        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <%--<button data-am-modal="{target: '#group-window'}" type="button" class="am-btn am-btn-default">--%>
                            <%--<span class="am-icon-plus"></span> 新增分组--%>
                        <%--</button>--%>
                        <button onclick="groupJS.customerWindow()" type="button"
                                class="am-btn am-btn-default"><span class="am-icon-save"></span> 客户建档
                        </button>
                        <button onclick="groupJS.cooperationWindow()" type="button"
                                class="am-btn am-btn-default"><span class="am-icon-save"></span> 添加合作社
                        </button>
                    </div>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-form-group">
                    <select>
                        <option value="option1">所有类别</option>
                        <option value="option2">IT业界</option>
                        <option value="option3">数码产品</option>
                        <option value="option3">笔记本电脑</option>
                        <option value="option3">平板电脑</option>
                        <option value="option3">只能手机</option>
                        <option value="option3">超极本</option>
                    </select>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-input-group am-input-group-sm">
                    <input type="text" class="am-form-field">
                    <span class="am-input-group-btn">
                        <button class="am-btn am-btn-default" type="button">搜索</button>
                    </span>
                </div>
            </div>
        </div>

        <div class="am-u-sm-2">
            <%--<button type="button" onclick="informationJS.backLast();" class="am-btn am-btn-default">返回上一级</button>--%>
            <div class="am-btn-group-stacked" style="width: 173px;margin-top: 53px">
                <div class="am-dropdown" data-am-dropdown id="cooperation-dropdown">
                    <button class="am-btn btn-toggle am-btn-default btn-white am-dropdown-toggle"
                            data-am-dropdown-toggle>合作社
                        <span class="am-icon-caret-down"></span></button>
                    <ul class="am-dropdown-content" id="cooperation-list">
                        <li class="am-dropdown-header">还没有添加合作社</li>
                    </ul>
                </div>
            </div>
        </div>

        <div style="margin-top: 14px" class="am-u-sm-10">
            <table class="am-table">
                <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th></th>
                    <th>名称</th>
                    <th>手机号</th>
                    <th>所在城市</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="customer-list"></tbody>
            </table>
        </div>
    </div>

    <footer class="admin-content-footer">
        <hr>
        <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
</div>

<div style="left: 50%" class="am-popup" id="group-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">添加分组</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="am-form am-form-horizontal" style="width: 400px">
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">分组名称</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="customerGroupName"/>
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-u-sm-8 am-u-sm-push-4">
                        <button type="button" onclick="groupJS.saveOrUpdateGroup()" class="am-btn am-btn-primary">保 存</button>
                        <button type="button" data-am-modal-close class="am-btn am-btn-default">取 消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="width: 800px" class="am-popup" id="customer-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">客户信息</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="am-form am-form-horizontal">
                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">姓　　名:</label>
                    <div class="am-u-sm-10">
                        <input type="text" id="userName" placeholder="姓名">
                        <small></small>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">手机号码:</label>
                    <div class="am-u-sm-10">
                        <input type="text" id="userPhone" placeholder="手机号码">
                        <small></small>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">所在城市:</label>
                    <div class="am-u-sm-10">
                        <div class="info">
                            <div>
                                <select style="float: left;width: 33.33%" id="su_province"></select>
                                <select style="float: left;width: 33.33%" id="su_city"></select>
                                <select style="float: left;width: 33.34%" id="su_county"></select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">详细地址:</label>
                    <div class="am-u-sm-10">
                        <input type="text" id="userAddress" placeholder="详细地址">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">出生日期:</label>
                    <div class="am-u-sm-10" style="margin-top: 5px">
                        <input type="date" data-am-datepicker class="am-form-field am-input-sm" id="userBirthday" placeholder="出生日期">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">性　　别:</label>
                    <div style="margin-top: 10px" class="am-u-sm-10 add_feature">
                        <input type="radio" name="userSex" value="sex_1"/>男&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="userSex" value="sex_0"/>女
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">所属分组:</label>
                    <div class="am-u-sm-10" style="margin-top: 5px">
                        <select id="customerGroupId"></select>
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-u-sm-4 am-u-sm-push-8">
                        <button type="button" onclick="groupJS.saveOrUpdateCustomer()" class="am-btn am-btn-primary">保　　存
                        </button>
                        <button type="button" data-am-modal-close class="am-btn am-btn-default">取　　消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="width: 800px" class="am-popup" id="cooperation-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">合作社信息</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="am-form am-form-horizontal">
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">合作社名称:</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="myTeamName" placeholder="合作社名">
                        <small></small>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">所在城市:</label>
                    <div class="am-u-sm-9">
                        <div class="info">
                            <div>
                                <select style="float: left;width: 33.33%" id="sc_province"></select>
                                <select style="float: left;width: 33.33%" id="sc_city"></select>
                                <select style="float: left;width: 33.34%" id="sc_county"></select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">详细地址:</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="myTeamAddress" placeholder="详细地址">
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-u-sm-4 am-u-sm-push-8">
                        <button type="button" onclick="groupJS.saveOrUpdateCooperation()" class="am-btn am-btn-primary">
                            保　　存
                        </button>
                        <button type="button" data-am-modal-close class="am-btn am-btn-default">取　　消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/script/js/area.js"></script>
<script type="text/javascript">
//    _init_area();
</script>

<script type="text/javascript" src="${path}/pages/customer/group.js"></script>
<script type="text/javascript">
    groupJS.findGroups();
</script>
</html>
