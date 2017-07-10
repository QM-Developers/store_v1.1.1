<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<script type="text/javascript">
    var path = "${path}";
    var basePath = "${basePath}";
</script>

<script type="text/javascript">
    var urlParams = document.URL.split("?");
    var optFlag = urlParams[1];
    var customerId = "";
    var placeId = urlParams[2];
    var breedId = "";
    var hardwareId = "";
</script>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/information.css"/>

</head>

<body>
<div class="admin-content">
    <div style="height: 90%" class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">场地信息</strong></div>
        </div>
        <hr/>

        <div class="am-u-sm-12">
            <button type="button" onclick="history.go(-1);" class="am-btn am-btn-default">返回上一级</button>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
                <button onclick="informationJS.hardwareWindow();" class="am-btn am-btn-primary am-btn-sm">
                    <i class="am-icon-plus"></i>
                    添加硬件信息
                </button>
                <ul id="hardware-list" class="am-list"></ul>

                <button onclick="informationJS.breedWindow();" class="am-btn am-btn-primary am-btn-sm">
                    <i class="am-icon-plus"></i>
                    添加养殖信息
                </button>
                <div style="margin-top: 15px;" class="am-panel-group" id="accordion"></div>
            </div>

            <div style="margin-top: 50px" class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
                <form class="am-form am-form-horizontal">
                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">场地名称</label>
                        <div class="am-u-sm-9">
                            <input id="userPlaceName" type="text">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">场地区域</label>
                        <div class="am-u-sm-9">
                            <div class="info">
                                <div id="show">
                                    <select style="float: left;width: 33.33%" id="s_province" name="s_province"></select>
                                    <select style="float: left;width: 33.33%" id="s_city" name="s_city"></select>
                                    <select style="float: left;width: 33.34%" id="s_county" name="s_county"></select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">详细地址</label>
                        <div class="am-u-sm-9">
                            <input id="userPlaceAddress" type="text">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">场地类型</label>
                        <div class="am-u-sm-9">
                            <input id="userPlaceType" onclick="inputSelJS.init(this);" type="text">
                            <div class="cpm_frith_cont_ul">
                                <div onclick="inputSelJS.selClick(this)">123</div>
                                <div onclick="inputSelJS.selClick(this)">345</div>
                                <div onclick="inputSelJS.selClick(this)">234</div>
                            </div>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">员工数量</label>
                        <div class="am-u-sm-9">
                            <input id="userEmployeeNum" type="number">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">占地面积</label>
                        <div class="am-u-sm-9">
                            <input id="userPlaceAcreage" type="number">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <div class="am-u-sm-push-10">
                            <button type="button" onclick="informationJS.saveOrUpdatePlace();" class="am-btn am-btn-primary">保存修改</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <footer class="admin-content-footer">
        <hr>
        <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
</div>


<div class="am-popup" id="breed-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">养殖信息</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="am-form am-form-horizontal" style="width: 400px">
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">养殖类型</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="userBreedType"/>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">对应品种</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="userBreedVariety">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">养殖方式</label>
                    <div class="am-u-sm-9" style="margin-top: 5px">
                        <input type="text" id="userBreedStyle"/>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">用料类型</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="userFodderType"/>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">配料方式</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="userFodderStyle"/>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">用料总量</label>
                    <div class="am-u-sm-9">
                        <input type="number" id="userFodderNum">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">养殖数量</label>
                    <div class="am-u-sm-9">
                        <input type="number" id="userBreedNum">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">月出栏数</label>
                    <div class="am-u-sm-9">
                        <input type="number" id="userSellNum">
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-u-sm-8 am-u-sm-push-4">
                        <button type="button" onclick="informationJS.saveOrUpdateBreed()" class="am-btn am-btn-primary">保 存</button>
                        <button type="button" data-am-modal-close class="am-btn am-btn-default">取 消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="am-popup" id="hardware-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">养殖信息</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <div class="am-form am-form-horizontal" style="width: 400px">
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">硬件名称</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="userHardwareName"/>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">数量</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="userHardwareNum">
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-u-sm-8 am-u-sm-push-4">
                        <button type="button" onclick="informationJS.saveOrUpdateHardware()" class="am-btn am-btn-primary">保 存</button>
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
<script src="${path}/script/js/area.js"></script>
<script type="text/javascript">
    _init_area();
</script>

<script type="text/javascript" src="${path}/script/js/inputSel.js"></script>
<script type="text/javascript">
    $(function ()
    {
        //添加养殖信息控制
        $(".add_breed").click(function ()
        {
            $("#cpm_frith_cont_box").show();
        });

        $(".aad_hardware").click(function ()
        {

            $(".cpm_hardware").fadeIn()
        });

        $(".information_addition").click(function ()
        {
            history.back(-1);
        });
    })
</script>

<script type="text/javascript" src="${path}/pages/customer/information.js"></script>
<script type="text/javascript">
    informationJS.init();
</script>

</html>