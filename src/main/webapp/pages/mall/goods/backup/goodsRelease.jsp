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
    <script type="text/javascript">
        var typeId = document.URL.split("?")[1];
    </script>

    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${path}/script/webuploader-0.1.5/webuploader.css">
    <link rel="stylesheet" href="${path}/pages/mall/goods/backup/goodsRelease.css"/>

</head>
<body>
<div class="admin-content">
    <div style="min-width: 1200px" class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加商品</strong></div>
        </div>
        <hr/>
        <div class="am-g am-margin-top">
            <div class="am-u-md-2 am-text-right">类　　目</div>
            <div class="am-u-md-10">
                <span id="type-text"></span>
                <a href="typeSelect.jsp" class="am-btn am-btn-default am-text-secondary am-btn-xs">切换类目</a>
            </div>
        </div>
        <div class="am-g am-margin-top">
            <div class="am-u-md-2 am-text-right">商品标题</div>
            <div class="am-u-md-6">
                <input type="text" id="goodsName" class="am-form-field am-input-sm">
            </div>
            <div class="am-u-md-4"></div>
        </div>
        <div class="am-g am-margin-top">
            <div class="am-u-md-2 am-text-right">单　　价</div>
            <div class="am-u-md-2">
                <input type="number" id="goodsPrice" class="am-form-field am-input-sm">
            </div>
            <div class="am-u-md-8"></div>
        </div>
        <div class="am-g am-margin-top">
            <div class="am-u-md-2 am-text-right">库　　存</div>
            <div class="am-u-md-2">
                <input type="number" id="goodsCount" class="am-form-field am-input-sm">
            </div>
            <div class="am-u-md-8"></div>
        </div>
        <div class="am-g am-margin-top">
            <div class="am-u-md-2 am-text-right">运　　费</div>
            <div class="am-u-md-10">
                <select onchange="gdReleaseJS.findFreight();" style="width: 200px" id="freight-temps"></select>
                <a href="freightTemps.jsp" class="am-btn am-btn-default am-btn-xs am-text-secondary">添加 / 管理运费模板</a>
                <span></span>
            </div>
        </div>
        <div class="am-g am-margin-top">
            <div class="am-u-md-2 am-text-right">商品规格</div>
            <div class="attr-list-body am-panel am-panel-default am-u-md-6 am-u-end">
                <div class="am-panel-bd">
                    <table style="border: none" class="am-table">
                        <thead>
                        <tr>
                            <th>规格名称</th>
                            <th>价格</th>
                            <th>库存</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="standard-list">
                        <tr>
                            <td><input oninput="gdReleaseJS.appendRow(this);"></td>
                            <td><input oninput="gdReleaseJS.appendRow(this);" type="number"></td>
                            <td><input oninput="gdReleaseJS.appendRow(this);" type="number"></td>
                            <td>
                                <button onclick="gdReleaseJS.deleteRow(this);" class="am-btn am-btn-default am-text-danger am-btn-xs">删除</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="am-g am-margin-top">
            <div class="am-u-md-2 am-text-right">商品属性</div>
            <div class="attr-list-body am-panel am-panel-default am-u-md-6 am-u-end">
                <div class="am-panel-bd">
                    <table id="attr-list1" class="am-u-md-6"
                           style="border:0;margin-top: 0px;margin-bottom: 10px"></table>
                    <table id="attr-list2" class="am-u-md-6"
                           style="border: 0;margin-top: 0px;margin-bottom: 10px"></table>
                </div>
            </div>
        </div>
        <div class="am-g am-margin-top">
            <div class="am-u-md-2 am-text-right">商品图片</div>
            <div class="am-u-md-10 am-u-end">
                <div class="add-picul">
                    <ul id="img-list" class="add-picture" style=" zoom:1;">
                        <li class="lileft" onmouseenter="gdReleaseJS.leftandrigthmove(this)">
                            <span class="add-off am-icon-remove"></span>
                            <div class="add-one">
                                <a href="###" onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <img/>
                                <div class="b-shade">
                                    <i class="left" onclick="gdReleaseJS.moveToLeft(this);">左</i>
                                    <span>700x700</span>
                                    <i class="right" onclick="gdReleaseJS.moveToRight(this);">右</i>
                                </div>
                            </div>
                        </li>
                        <li class="lileft" onmouseenter="gdReleaseJS.leftandrigthmove(this)">
                            <span class="add-off am-icon-remove"></span>
                            <div class="add-one">
                                <a href="###" onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <img src=""/>
                                <div class="b-shade">
                                    <i class="left" onclick="gdReleaseJS.moveToLeft(this);">左</i>
                                    <span>700x700</span>
                                    <i class="right" onclick="gdReleaseJS.moveToRight(this);">右</i>
                                </div>
                            </div>
                        </li>
                        <li class="lileft" onmouseenter="gdReleaseJS.leftandrigthmove(this)">
                            <span class="add-off am-icon-remove"></span>
                            <div class="add-one">
                                <a href="###" onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <img src=""/>
                                <div class="b-shade">
                                    <i class="left" onclick="gdReleaseJS.moveToLeft(this);">左</i>
                                    <span>700x700</span>
                                    <i class="right" onclick="gdReleaseJS.moveToRight(this);">右</i>
                                </div>
                            </div>
                        </li>
                        <li class="lileft" onmouseenter="gdReleaseJS.leftandrigthmove(this)">
                            <span class="add-off am-icon-remove"></span>
                            <div class="add-one">
                                <a href="###" onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <img src=""/>
                                <div class="b-shade">
                                    <i class="left" onclick="gdReleaseJS.moveToLeft(this);">左</i>
                                    <span>700x700</span>
                                    <i class="right" onclick="gdReleaseJS.moveToRight(this);">右</i>
                                </div>
                            </div>
                        </li>
                        <li class="lileft" onmouseenter="gdReleaseJS.leftandrigthmove(this)">
                            <span class="add-off am-icon-remove"></span>
                            <div class="add-one">
                                <a href="###" onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <img src=""/>
                                <div class="b-shade">
                                    <i class="left" onclick="gdReleaseJS.moveToLeft(this);">左</i>
                                    <span>700x700</span>
                                    <i class="right" onclick="gdReleaseJS.moveToRight(this);">右</i>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <div class="am-g am-margin-top">
            <div class="am-u-md-2 am-text-right">商品详情</div>
            <div class="am-u-md-10 am-u-end">

                <div class="img-box">
                    <div class="imgmiddle">
                        <div class="imgmiddletop">
                            <ul id="middleimg">

                            </ul>
                        </div>
                        <div id="imgmiddlebotton" class="imgmiddlebotton">
                            <div class="clear">
                                <div class="container demo">
                                    <div class="before">
                                        <i class="am-icon-plus"></i>&nbsp;添加
                                    </div>
                                    <div class="after add-after">
                                        <div style="cursor: pointer" class="add-but" id="addbut"
                                             onclick="gdReleaseJS.AppendImg()">
                                            <i class="am-icon-image"></i>&nbsp;图片
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="am-g am-margin-top">
            <div class="am-u-md-4 am-text-right"></div>
            <div class="am-u-md-7">
                <button class="am-btn am-btn-primary" onclick="gdReleaseJS.releaseGoods();">发　　布</button>
                <button class="am-btn am-btn-default">保存草稿</button>
            </div>
        </div>
        <footer class="admin-content-footer" style="height: 60px;line-height: 60px">
            <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
        </footer>
    </div>
</div>

<div class="am-popup" id="my-popup" style="height: auto;">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">上传图片</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd " style="min-height: 450px;">
            <div class="am-tabs" data-am-tabs="{noSwipe: 1}" id="doc-tab-demo-1">
                <ul class="am-tabs-nav am-nav am-nav-tabs">
                    <li class="am-active">
                        <a href="javascript: void(0)">上传图片</a>
                    </li>
                    <li>
                        <a href="javascript: void(0)">从图库选择</a>
                    </li>
                    <li>
                        <a href="javascript: void(0)"></a>
                    </li>
                </ul>
                <div class="am-tabs-bd am-tabs-bd-ofv">
                    <!--上传框-->
                    <div class="am-tab-panel am-active " id="tab-4-1" style="padding: 10px;">
                        <div class="add-imgbox" id="upload-list" style="width: 100%;height:280px; overflow: auto;"></div>
                        <div style="width: 100%;float: left;">
                            <div style="width:100%;height: 45px;line-height: 20px;text-align: center;">
                                <div style="margin-top: 35px;width: 100px;margin: auto;" id="filePicker">添加图片</div>
                                <div onclick="gdReleaseJS.insertImg();" style="float: right;width: 100px; height: 45px;margin-top: -42px;line-height: 45px;">确认插入
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="am-tab-panel ">
                        <div id="images-space" class="add-imgbox" style="width: 100%;height:280px; overflow: auto;"></div>
                        <div style="width: 100%;float: left;">
                            <div style="width:100%;height: 45px;line-height: 20px;text-align: center;">
                                <div style="margin-top: 35px;width: 100px;margin: auto;" ></div>
                                <div onclick="gdReleaseJS.insertImg();" style="float: right;width: 100px; height: 45px;margin-top: -2px;line-height: 45px;">确认插入
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="am-tab-panel" id="tab-4-3">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>

<script type="text/javascript" src="${path}/script/js/inputSel.js"></script>
<script type="text/javascript" src="${path}/pages/mall/goods/backup/goodsRelease.js"></script>

<script type="text/javascript">
    gdReleaseJS.init();
</script>

</html>
