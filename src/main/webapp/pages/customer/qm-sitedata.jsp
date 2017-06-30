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
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-sitedata.css"/>
</head>

<body>
<div class="sitedata qm-team">
    <div class="sitedata-box">

        <div class="sitedata-title">
            <h4 class="qm-c-p am-u-sm-8">场地资料</h4>

        </div>
        <div class="sitedata-cont">
            <div class="am-u-sm-10">
                <ul>
                    <li class="sitedata-li">
                        <span class="am-u-sm-3">场地名称 : </span><input class="am-u-sm-9"/>
                    </li>

                    <li class="sitedata-li"><span class="am-u-sm-3">场地类型 : </span>
                        <select name="" class="am-u-sm-9" style="margin-top: 10px;height: 35px;border-color: #CCCCCC;">
                            <option value="">可养区</option>
                            <option value="">限养区</option>
                            <option value="">禁养区</option>

                        </select>
                    </li>

                    <li class="sitedata-li">
                        <span class="am-u-sm-3">场地面积 : </span><input class="am-u-sm-9"/>
                    </li>
                    <li class="sitedata-li">
                        <span class="am-u-sm-3">人员数量 : </span><input class="am-u-sm-9"/>
                    </li>
                    <li class="sitedata-li">
                        <span class="am-u-sm-3 ">所在城市 : </span>
                        <div class="am-u-sm-9" style="z-index: 200;">
                            <input style="width: 100%;" type="" name="" onclick="Site(this)" value="" placeholder="地址"/>
                            <div class="am-tabs qm-site" data-am-tabs="{noSwipe: 1}">

                                <ul class="am-tabs-nav am-nav am-nav-tabs qm-site-ul">

                                </ul>

                                <div class="am-tabs-bd" style="background: #dcd2d2;">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="sitedata-li">
                        <span class="am-u-sm-3">详细地址 : </span><input class="am-u-sm-9"/>
                    </li>
                    <li class="sitedata-li">
                        <span class="am-u-sm-3">添加备注 : </span><textarea class="am-u-sm-9"></textarea></li>

                </ul>
            </div>

        </div>
    </div>
</div>
<!--产品信息-->
<div class="sitedata">
    <div class="sitedata-box">
        <div class="sitedata-title">
            <h4 class="qm-c-p am-u-sm-8">产品信息</h4>
            <div class="am-u-sm-4 ">
                <button class=" addproduct" data-am-modal="{target: '#popup1'}">
                    添加产品
                </button>
            </div>
        </div>
        <div class="product-list">
            <table class="am-table ">
                <thead>
                <tr>
                    <th>产品</th>
                    <th>入栏时间</th>
                    <th>日龄</th>
                    <th>数量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>高品质肉猪</td>
                    <td>20017/6/26</td>
                    <td>日龄</td>
                    <td>数量</td>
                    <td>
                        <a class="product-icon am-icon-pencil" href=""></a>
                        <a class="product-icon am-icon-close" href="###" onclick="Removetr(this)"></a>
                    </td>
                </tr>

                </tbody>
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
<!--硬件信息-->
<div class="sitedata">
    <div class="sitedata-box">
        <div class="sitedata-title">
            <h4 class="qm-c-p am-u-sm-8">硬件信息</h4>
            <div class="am-u-sm-4 ">
                <button class=" addproduct" data-am-modal="{target: '#popup2'}">
                    添加硬件
                </button>
            </div>

        </div>
        <div class=" product-list">
            <table class="am-table ">
                <thead>
                <tr>
                    <th>硬件名称</th>
                    <th>数量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>猪</td>
                    <td>0.6</td>
                    <td>
                        <a class="product-icon am-icon-pencil" href=""></a>
                        <a class="product-icon am-icon-close" href=""></a>
                    </td>
                </tr>

                </tbody>
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
<!---->
<div class="am-g  data-del-off ">

    <div>
        <button class="del-but">返回</button>
    </div>

    <div>
        <button class="del-but">保存</button>
    </div>
    <div>
        <button class="del-but">删除资料</button>
    </div>

</div>

<!---->
<div class="am-popup" id="popup1">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">产品信息</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="popthree">
                <ul class="poptwo-c-ul">
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">名　　称 :</div>
                        <div class="am-u-sm-9 pop-div2"><input type="" name="" value=""/></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">品　　种 :</div>
                        <div class="am-u-sm-9 pop-div2"><input type="" name="" value=""/></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">产品数量 :</div>
                        <div class="am-u-sm-9 pop-div2"><input type="" name="" value=""/></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">入栏时间 :</div>
                        <div class="am-u-sm-9 pop-div2">
                            <div class="poptime ">
                                <input class=" pop-input" type="" name="" value=""/>
                                <button onclick="QmTime(this)" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                            </div>
                        </div>


                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">日　　龄 :</div>
                        <div class="am-u-sm-9 pop-div2"><input type="" name="" value=""/></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">养殖方式 :</div>
                        <div class="am-u-sm-9 pop-div2">
                            <select name="">
                                <option value="">分类一</option>
                                <option value="">分类二</option>

                            </select>
                        </div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">用料类型 :</div>
                        <div class="am-u-sm-9 pop-div2"><input type="" name="" value=""/></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">备　　注 :</div>
                        <div class="am-u-sm-9 pop-div2"><textarea style="width: 100%;"></textarea></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="poptwo-li-but8">
                            <button>提交</button>
                            <button data-am-modal-close>取消</button>
                        </div>

                    </li>

                </ul>

            </div>
        </div>
    </div>
</div>
<!--弹窗2-->
<div class="am-popup" id="popup2">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">产品信息</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="popthree">
                <ul class="poptwo-c-ul">
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">硬件名称 :</div>
                        <div class="am-u-sm-9 pop-div2"><input type="" name="" value=""/></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="am-u-sm-3 pop-div1">数　　量 :</div>
                        <div class="am-u-sm-9 pop-div2"><input type="" name="" value=""/></div>
                    </li>
                    <li class="poptwo-c-li">
                        <div class="poptwo-li-but8">
                            <button>提交</button>
                            <button data-am-modal-close>取消</button>
                        </div>

                    </li>

                </ul>

            </div>
        </div>
    </div>
</div>
</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>

</html>