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
</head>
<body>
<div class="admin-content">
    <div style="height: 90%" class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">我的团队</strong></div>
        </div>
        <hr/>
        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button data-am-modal="{target: '#group-window'}" type="button" class="am-btn am-btn-default">
                            <span class="am-icon-plus"></span> 新增分组
                        </button>
                        <button ng-click="customerWindow()" type="button"
                                class="am-btn am-btn-default"><span class="am-icon-save"></span> 客户建档
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
            <button type="button" onclick="informationJS.backLast();" class="am-btn am-btn-default">返回上一级</button>
            <ul class="am-list  am-list-striped">
                <li ng-repeat="x in groups" ng-click="findCustomerByGroup(x.customerGroupId)"><a
                        style="margin-left: 10px" href="###"><span ng-bind="x.customerGroupName"></span></a></li>
            </ul>
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
                <tbody>
                <tr ng-repeat="x in customers">
                    <td><input type="checkbox"></td>
                    <td><img class="am-radius" ng-src="{{'${path}/'+x.userImg}}" width="30" height="30"/></td>
                    <td>{{x.userName}}</td>
                    <td>{{x.userPhone}}</td>
                    <td>{{x.userArea}}</td>
                    <td>
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button ng-click="findCustomerInfo(x.userPhone)"
                                        class="am-btn am-btn-default am-btn-xs am-text-secondary"><span
                                        class="am-icon-pencil-square-o"></span> 编辑 / 查看
                                </button>
                                </button>
                                <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span
                                        class="am-icon-trash-o"></span> 删除
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <footer class="admin-content-footer">
        <hr>
        <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>

</html>
