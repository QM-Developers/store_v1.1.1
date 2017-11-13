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
        var urlParams = document.URL.split("?")[1];

    </script>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-addBreed.css"/>

</head>
<body>
<div class="bodybox">
    <div class="breed-title">
        <div>产品信息</div>
    </div>
    <div class="am-g breedmessagebox">
        <ul class="am-u-sm-12">
            <li class="breed-li">
                <span class="am-u-sm-2 span">养殖类目 :</span>
                <div class="am-u-sm-8 am-u-end sel-box">
                    <select name="" class=" disable-sign" id="breedCategory">
                        <option value="">猪</option>

                    </select>
                    <input/>
                </div>
            </li>
            <li class="breed-li">
                <span class="am-u-sm-2 span">养殖品种 :</span>
                <div class="am-u-sm-8 am-u-end sel-box">
                    <select name="" class=" disable-sign" id="breedVariety">
                        <option value="">内三元</option>
                        <option value="">外三元</option>

                    </select>
                    <input/>
                </div>
            </li>
            <li class="breed-li">
                <span class="am-u-sm-2 span">养殖类型 :</span>
                <div class="am-u-sm-8 am-u-end sel-box">
                    <select name="" class=" disable-sign" id="breedType" onchange="selchage()">
                        <option value="type1">自繁自养</option>
                        <option value="type2">种苗养殖</option>
                        <option value="type3">商品养殖</option>
                    </select>
                    <input/>
                </div>
            </li>
        </ul>
    </div>
    <div class="am-g title-text">
        <span class="am-u-sm-2 " style="margin-left: 16px;">对应类型信息</span>
    </div>
    <div class="am-g breedmessagebox" style="border: 1px solid #ccc;">
        <ul class="am-u-sm-12" id="breedUl">

            <li class="breed-li ">
                <span class="am-u-sm-2 span">母体数量 :</span><input id="femaleNum"
                                                                 class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
            <li class="breed-li">
                <span class="am-u-sm-2 span">公体数量 :</span><input id="maleNum" class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
            <li class="breed-li">
                <span class="am-u-sm-2 span">产床数量 :</span><input id="obstetricTableNum"
                                                                 class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
            <li class="breed-li">
                <span class="am-u-sm-2 span">栏舍数量 :</span><input id="shedNum" class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
            <li class="breed-li">
                <span class="am-u-sm-2 span">空栏数量 :</span><input id="emptyShedNum"
                                                                 class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
            <li class="breed-li">
                <span class="am-u-sm-2 span">竞争品牌 :</span><input id="competitiveBrand"
                                                                 class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
            <li class="breed-li">
                <span class="am-u-sm-2 span">养殖规模 :</span><input id="breedScale"
                                                                 class="am-u-sm-8 am-u-end disable-sign"/>
            </li>
        </ul>

    </div>
    <div class="am-u-sm-2">
        <div class="breed-compile compile-show" id="compilebox">
            编辑
        </div>
        <div class="breed-compile " style="display: none;">
            取消
        </div>
    </div>
    <div class="but-box" id="but-box">
        <button class="but" onclick="qm_addBreed.gobock()">返回</button>
        <button class="but" id="removeData">删除</button>
        <button class="but" id="compileData" >编辑</button>
        <button class="but" id="submitData" onclick="qm_addBreed.submitData()">提交</button>
    </div>

</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script src="${path}/pages/customer/qm-addBreed.js"></script>
<script>
    qm_addBreed.inint();
</script>
<script>
    function selchage()
    {
        var selval = $('#breedType').find('option:selected').text();
        console.log(selval)
        $('#breedUl').empty();
        switch (selval)
        {
            case '自繁自养' :
                var $li = '<li class="breed-li ">' +
                    '<span class="am-u-sm-2 span">母体数量 :</span><input id="femaleNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">公体数量 :</span><input id="maleNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">产床数量 :</span><input id="obstetricTableNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">栏舍数量 :</span><input id="shedNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">空栏数量 :</span><input id="emptyShedNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">竞争品牌 :</span><input id="competitiveBrand" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">养殖规模 :</span><input id="breedScale" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>';
                $('#breedUl').append($li);
                break;
            case '种苗养殖' :
                var $li = '<li class="breed-li ">' +
                    '<span class="am-u-sm-2 span">母体数量 :</span><input id="femaleNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">公体数量 :</span><input id="maleNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">产床数量 :</span><input id="obstetricTableNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">竞争品牌 :</span><input id="competitiveBrand" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">养殖规模 :</span><input id="breedScale" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>';
                $('#breedUl').append($li);
                break;
            case '商品养殖' :
                var $li = '<li class="breed-li ">' +
                    '<span class="am-u-sm-2 span">存栏数量 :</span><input id="livestockNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">栏舍数量 :</span><input id="shedNum"  class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">空栏数量 :</span><input id="emptyShedNum" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">竞争品牌 :</span><input id="competitiveBrand" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>' +
                    '<li class="breed-li">' +
                    '<span class="am-u-sm-2 span">养殖规模 :</span><input id="breedScale" class="am-u-sm-8 am-u-end disable-sign"/>' +
                    '</li>';
                $('#breedUl').append($li);
                break;
        }
    }

</script>
</html>