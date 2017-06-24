<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="${path}/pages/dictionary/dictionary.css">

    <script type="text/javascript">
        var path = "${path}";
    </script>
</head>
<body>
<div class="admin-content">
    <div style="min-width: 1200px" class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">数据字典</strong></div>
        </div>
        <hr/>

        <div class="am-u-md-4">
            <div class="am-panel am-panel-default">
                <div class="am-panel-hd">父类字典
                    <button type="button" data-am-modal="{target: '#parDict-window'}" class="am-btn am-btn-primary am-btn-sm">添加</button>
                    <button type="button" data-am-modal="{target: '#parDict-window'}" class="am-btn am-btn-primary am-btn-sm">修改</button>
                    <button type="button" onclick="dictJS.deleteParDict()" class="am-btn am-btn-default am-btn-sm">删除</button>
                </div>
                <div class="am-panel-bd">
                    <table class="table table-bordered table-hover" id="par-dict-list">
                        <hidden id="parDictId"/>
                    </table>
                </div>
            </div>
        </div>

        <div class="am-u-md-8">
            <div class="am-panel am-panel-default">
                <div class="am-panel-hd">字典详情
                    <button type="button" onclick="dictJS.saveDict()" class="am-btn am-btn-primary am-btn-sm">保存字典</button>
                    <button type="button" onclick="dictJS.canAddRow()" class="am-btn am-btn-primary am-btn-sm">添加栏位</button>
                    <button type="button" onclick="dictJS.deleteRow()" class="am-btn am-btn-default am-btn-sm">删除栏位</button>
                </div>
                <div class="panel-body" id="dict-list">
                </div>
            </div>
        </div>
    </div>
</div>


<div style="left: 50%;" class="am-popup" id="parDict-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">新增字典</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd" style="width: 400px">
            <div class="am-form am-form-horizontal">
                <div class="am-form-group">
                    <label class="am-u-sm-4 am-form-label">字典名称</label>
                    <div class="am-u-sm-8">
                        <input type="text" id="parDictName"/>
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-u-sm-8 am-u-sm-push-4">
                        <button type="button" onclick="dictJS.saveOrUpdateParDict()" class="am-btn am-btn-primary">保 存</button>
                        <button type="button" data-am-modal-close class="am-btn am-btn-default">取 消</button>
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

<script type="text/javascript" src="${path}/pages/dictionary/dictionary.js"></script>

<script type="text/javascript">
    dictJS.findParDict();
</script>

</html>