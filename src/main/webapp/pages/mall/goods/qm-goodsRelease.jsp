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
    <link rel="stylesheet" type="text/css" href="${path}/script/webuploader-0.1.5/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/mall/goods/qm-goodsRelease.css"/>

    <script type="text/javascript">
        console.log(document.URL);
        var urlParams = document.URL.split("?")[1];
    </script>
</head>

<body>
<div class="bodybox opacity-box">
    <div style="border: 1px solid #ccc;margin-top: 10px;border-radius: 2px;">
        <div class=" goods-title">
            <div class=""><span class="am-text-lg ">添加商品</span></div>
        </div>
        <div class="admin-content-body goods-cont">
            <div class="goods-box1">
                <div class="goods-box1-1">类　　目 :</div>
                <div class="goods-box1-2">
                    <span id="type-text"></span>
                    <a  onclick="gdReleaseJS.toTypeSelect();" class="goods-box1-a" id="qiehuan">切换类目</a>
                </div>
            </div>
            <div class="goods-box1">
                <div class=" goods-box1-1">商品编号 :</div>
                <div class="goods-box1-2">
                    <input type="text" id="goods-code"  maxlength="20" placeholder="编号长度不可以超过20个字符" class="am-form-field am-input-sm">
                </div>
                <div class=""></div>
            </div>
            <div class="goods-box1">
                <div class=" goods-box1-1">商品名称 :</div>
                <div class="goods-box1-2">
                    <input type="text" id="goods-name" maxlength="60" placeholder="名称长度不可以超过60个字符" class="am-form-field am-input-sm">
                </div>
                <div class=""></div>
            </div>
            <div class="goods-box1">
                <div class="goods-box1-1">商品品牌 :</div>
                <div class="goods-box1-2">
                    <input type="text" id="goods-attr" maxlength="50" placeholder="商品长度不可以超过20个字符" class="am-form-field am-input-sm">
                </div>
                <div class=""></div>
            </div>

            <div class="am-g">
                <div class="goods-box1-1">商品规格 :</div>
                <div class="attr-list-body  am-panel-default ">
                    <div class=" goodssize">
                        <table>
                            <thead>
                            <tr class="frist-tr">
                                <th>规格名称</th>
                                <th>商品重量</th>
                                <th>单价(元)</th>
                                <%--<th>库存</th>--%>
                                <th class="tab4">
                                    <span class="tab4-span" id="addguige" onclick="gdReleaseJS.addStandard()">增加规格</span>
                                </th>
                            </tr>
                            </thead>
                            <tbody id="standard-list">
                            <tr>
                                <td><input/></td>
                                <td><input/></td>
                                <td><input/></td>
                                <%--<td><input/></td>--%>
                                <td class="tab4">
                                    <a class="tab4-a " onclick="gdReleaseJS.Delall(this)">删除</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="am-g" style="margin-top: 10px;">
                <div class="goods-box1-1">商品图片 :</div>
                <div class="add-picul">
                    <div class="add-picul-text">图片尺寸为800*800,JPG格式,小于300K,大于38K,不多于5张</div>
                    <ul id="img-list" class="add-picture" style=" zoom:1;">
                        <li class="lileft">
                            <div class="add-one">
                                <div class="a-shade">
                                    商品主图
                                </div>
                                <a  onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <span class="add-off am-icon-remove"></span>
                                <img/>
                                <div class="b-shade">
                                    <i class="left" onclick="gdReleaseJS.moveToLeft(this);">左</i>
                                    <span>700x700</span>
                                    <i class="right" onclick="gdReleaseJS.moveToRight(this);">右</i>
                                </div>
                            </div>
                        </li>
                        <li class="lileft">
                            <div class="add-one">
                                <a  onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <span class="add-off am-icon-remove"></span>
                                <img src=""/>
                                <div class="b-shade">
                                    <i class="left" onclick="gdReleaseJS.moveToLeft(this);">左</i>
                                    <span>700x700</span>
                                    <i class="right" onclick="gdReleaseJS.moveToRight(this);">右</i>
                                </div>
                            </div>
                        </li>
                        <li class="lileft">
                            <div class="add-one">
                                <a  onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <span class="add-off am-icon-remove"></span>
                                <img src=""/>
                                <div class="b-shade">
                                    <i class="left" onclick="gdReleaseJS.moveToLeft(this);">左</i>
                                    <span>700x700</span>
                                    <i class="right" onclick="gdReleaseJS.moveToRight(this);">右</i>
                                </div>
                            </div>
                        </li>
                        <li class="lileft">
                            <div class="add-one">
                                <a  onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <span class="add-off am-icon-remove"></span>
                                <img src=""/>
                                <div class="b-shade">
                                    <i class="left" onclick="gdReleaseJS.moveToLeft(this);">左</i>
                                    <span>700x700</span>
                                    <i class="right" onclick="gdReleaseJS.moveToRight(this);">右</i>
                                </div>
                            </div>
                        </li>
                        <li class="lileft">
                            <div class="add-one">
                                <a  onclick="gdReleaseJS.test();">
                                    <i class="am-icon-plus am-icon-fw add-i"></i>
                                </a>
                            </div>
                            <div class="add-two">
                                <span class="add-off am-icon-remove"></span>
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
            <div class="am-g" style="margin-top: 10px;">
                <div class="goods-box1-1">商品详情 :</div>
                <div class="goods-phone">
                    <div class="add-picul-text">图片尺寸为宽480*620,高要不大于920,JPG格式,小于300K,大于38K,不多于20张</div>
                    <div class="img-box">
                        <div class="imgmiddle">
                            <div class="imgmiddletop">
                                <ul id="middleimg" class="middleimg"></ul>
                            </div>
                            <div id="imgmiddlebotton" class="imgmiddlebotton">
                                <div class="clear">
                                    <div class="container demo">
                                        <!---->
                                        <div class="before" id="before">
                                            <i class="am-icon-plus"></i>&nbsp;添加
                                        </div>
                                        <div class="after add-after">
                                            <div style="cursor: pointer" class="add-but" id="addbut" onclick="gdReleaseJS.AppendImg()">
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
            <div class="am-g  data-del-off " >
                <div>
                    <button class="del-but" onclick="javascript:history.go(-1);">返回</button>
                </div>
                <div>
                    <button class="del-but" onclick="gdReleaseJS.deleteGoodsBut();">删除</button>
                </div>

                <div>
                    <button class="del-but" id="addbox" onclick="gdReleaseJS.saveOrUpdateGoods();">保存</button>
                </div>
                <div>
                    <button class="del-but modification"  id="xqbox" onclick="gdReleaseJS.modification();">编辑</button>
                </div>
            </div>

        </div>
        <!--弹窗-->
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
                                        <div style="margin-top: 35px;width: 100px;margin: auto;" id="filePicker">添加图片
                                        </div>
                                        <div onclick="gdReleaseJS.insertImg()" style="float: right;width: 100px; height: 45px;margin-top: -42px;line-height: 45px;" id="insert-img">
                                            确认插入
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--从图库选择-->
                            <div class="am-tab-panel ">
                                <div id="images-space" class="add-imgbox" style="width: 100%;height:280px; overflow: auto;"></div>
                                <div style="width: 100%;float: left;">
                                    <div style="width:100%;height: 45px;line-height: 20px;text-align: center;">
                                        <div style="margin-top: 35px;width: 100px;margin: auto;"></div>
                                        <div onclick="gdReleaseJS.insertImg();" style="float: right;width: 100px; height: 45px;margin-top: -2px;line-height: 45px;">
                                            确认插入
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="am-tab-panel" id="tab-4-3">
                            </div>
                        </div>
                    </div>
                    <div id="marked" style="width: 100%;height:35px ;line-height: 35px;text-align: center;color: red;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div class="prompt-box Del-all">--%>
    <%--<div class="pop-one pop-one1">--%>
        <%--<div class="prompt-title">提示</div>--%>
        <%--<div class="prompt-frame1">是否要删除这个规格</div>--%>
        <%--<div class="prompt-frame2">--%>
            <%--<div class="prompt-frame-box">--%>

                <%--<div class="prompt-frame-left" onclick="_deleteoff()">--%>
                    <%--是--%>
                <%--</div>--%>
                <%--<div class="prompt-frame-right" onclick="DelOff(this)">--%>
                    <%--否--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
</body>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/UrlUtil.js"></script>
<script type="text/javascript" src="${path}/script/js/inputSel.js"></script>

<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>
<script type="text/javascript" src="${path}/pages/mall/goods/qm-url-params.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>

<script type="text/javascript" src="${path}/pages/mall/goods/qm-goodsRelease.js"></script>
<script type="text/javascript">
    gdReleaseJS.init();
</script>


</html>