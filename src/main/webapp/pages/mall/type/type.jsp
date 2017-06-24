<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
    <link rel="stylesheet" href="${path}/script/zTree/zTreeStyle.css">
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>

    <style>
        .am-popup {
            width: auto;
            height: auto;
        }
        .am-ucheck-icons{
            top:3px;
        }
        .am-form-horizontal .am-radio-inline{
            padding-top: 0;
        }
    </style>

</head>
<body>

<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">类目</strong> /
            <small>GoodsType</small>
        </div>
    </div>
    <hr>
    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <button type="button" data-am-modal="{target: '#type-window'}" class="am-btn am-btn-default"><span
                            class="am-icon-plus"></span> 添加类目
                    </button>
                    <button type="button" onclick="typeJS.deleteType()" class="am-btn am-text-danger">
                        <span class="am-icon-remove"></span> 删除类目
                    </button>
                </div>
            </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" data-am-modal="{target: '#attr-window'}" class="am-btn am-btn-default"><span
                        class="am-icon-plus"></span> 添加属性
                </button>
            </div>
        </div>
    </div>

    <div class="am-u-sm-2">
        <ul id="type-tree" class="ztree"></ul>
    </div>
    <div class="am-u-sm-10">
        <table class="am-table">
            <thead>
            <tr>
                <th>属性名称</th>
                <th>属性值</th>
                <th>是否必填</th>
                <th>填写类型</th>
            </tr>
            </thead>
            <tbody id="attr-list">
            </tbody>
        </table>
    </div>
</div>

<div class="am-popup" id="type-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">添加类目</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="am-form am-form-horizontal" style="width: 400px">
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">类目名称</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="type-name" placeholder="类目名称">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">上级类目</label>
                    <div class="am-u-sm-9">
                        <select id="parent-type">
                            <option value="0">无</option>
                        </select>
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-u-sm-8 am-u-sm-push-4">
                        <button type="button" onclick="typeJS.saveOrUpdateType()" class="am-btn am-btn-primary">保  存</button>
                        <button type="button" data-am-modal-close class="am-btn am-btn-default">取  消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="am-popup" id="attr-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">类目属性</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="am-form am-form-horizontal" style="width: 400px">
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">属性名称</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="goodsTypeAttrName"/>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">属性值</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="goodsTypeAttrValue">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">是否必填</label>
                    <div class="am-u-sm-9" style="margin-top: 5px">
                        <label class="am-radio-inline">
                            <input name="goodsTypeAttrConst" type="radio" value="1" data-am-ucheck> 是
                        </label>
                        <label class="am-radio-inline">
                            <input name="goodsTypeAttrConst" type="radio" value="0" data-am-ucheck> 否
                        </label>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">填写类型</label>
                    <div class="am-u-sm-9">
                        <select id="goodsTypeAttrInputType">
                            <option value="in_t_1">选择</option>
                            <option value="in_t_0">填写</option>
                            <option value="in_t_2">填写选择</option>
                        </select>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">所属类目</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="goodsTypeName" readonly>
                        <hidden id="goodsTypeId"/>
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-u-sm-8 am-u-sm-push-4">
                        <button type="button" onclick="typeJS.saveOrUpdateAttr()" class="am-btn am-btn-primary">保  存</button>
                        <button type="button" data-am-modal-close class="am-btn am-btn-default">取  消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">
    var path = "${path}";
    var basePath = "${basePath}";
</script>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/zTree/jquery.ztree.all.js"></script>

<script type="text/javascript" src="${path}/pages/mall/type/type.js"></script>
<script type="text/javascript">
    typeJS.initTree();
</script>

</html>

