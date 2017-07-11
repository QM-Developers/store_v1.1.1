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

    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
</head>
<body>
<div class="admin-content">
    <div style="height: 90%" class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">运费模板</strong></div>
        </div>
        <hr/>

        <div class="am-u-sm-12">
            <button type="button" onclick="window.history.back();" class="am-btn am-btn-default">返回上一级</button>
        </div>

        <div class="am-u-md-7 am-u-md-push-2" style="min-width: 750px">
            <div class="am-g am-margin-top">
                <div class="am-u-md-2 am-text-right">模板名称</div>
                <div class="am-u-md-6">
                    <input type="text" id="templateFreightName" class="am-form-field am-input-sm">
                </div>
                <div class="am-u-md-4"></div>
            </div>
            <div class="am-g am-margin-top">
                <div class="am-u-md-2 am-text-right">是否包邮</div>
                <div class="am-u-md-6">
                    <div class="am-form-group">
                        <label class="am-radio-inline">
                            <input type="radio" onclick="freightJS.showFreight();" checked="true" value="0"
                                   name="templateFreightIsfree"> 不包邮
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" onclick="freightJS.hideFreight();" value="1"
                                   name="templateFreightIsfree"> 包邮
                        </label>
                    </div>
                </div>
                <div class="am-u-md-4"></div>
            </div>
            <div id="define-fright" class="am-g am-margin-top">
                <div class="am-u-md-2 am-text-right">默认运费</div>
                <div class="am-u-md-10">
                    <input style="width: 11%" type="number" value="0" id="templateDefaultNum" class="am-form-field am-input-sm am-inline">
                    &nbsp;件内&nbsp;&nbsp;&nbsp;
                    <input style="width: 11%" type="number" value="0" id="templateDefaultPrice" class="am-form-field am-input-sm am-inline">
                    &nbsp;元，每增加&nbsp;&nbsp;&nbsp;
                    <input style="width: 11%" type="number" value="0" id="templateAddNum" class="am-form-field am-input-sm am-inline">
                    &nbsp;件，增加运费&nbsp;&nbsp;&nbsp;
                    <input style="width: 11%" type="number" value="0" id="templateAddPrice" class="am-form-field am-input-sm am-inline">
                    &nbsp;元
                    <table id="area-freight" style="table-layout: fixed" hidden="hidden" class="am-table">
                        <thead>
                        <tr>
                            <th>运送到</th>
                            <th>首件数(件)</th>
                            <th>首费(元)</th>
                            <th>续件数(件)</th>
                            <th>续费(元)</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
            <div>
                <div style="margin-top: 20px" class="am-u-md-push-2">
                    <button type="button" onclick="freightJS.addAreaFreight();" class="am-btn am-btn-default">为指定城市添加运费</button>
                    <button type="button" onclick="freightJS.addFreightTemp();" class="am-btn am-btn-primary">添加模板</button>
                </div>
            </div>
        </div>

        <div style="float: left;margin-top: 70px;min-width: 750px" class="am-u-md-7 am-u-md-push-2">
            <table class="am-table">
                <thead>
                <tr>
                    <th>模板名称</th>
                    <th>是否包邮</th>
                    <th>运费规则</th>
                    <th>操　作</th>
                </tr>
                </thead>
                <tbody id="fright-table">
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
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>

<script type="text/javascript" src="${path}/pages/mall/goods/backup/freightTemps.js"></script>
<script type="text/javascript">
    freightJS.init();
</script>

</html>
