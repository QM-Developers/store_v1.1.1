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
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-customersetup.css"/>

</head>

<body class="bodybox opacity-box">
<div class="border-box " id="personal">
    <div class="am-g frist-line">
        <div class=" am-u-lg-3 ">个体农户</div>
        <div class=" am-u-lg-9 ">以家庭为单位从事农业生产经营活动的自耕农户,与商家是买卖关系,个体农户需货量小,建议安排使用销售点商城。</div>
    </div>
    <div class="am-g frist-line second-line">
        <div class=" am-u-lg-3">库存使用设置</div>
        <div class=" am-u-lg-9 ">
            <div class="button-box type1">
                <a onclick="qm_customersetup.checkedAndUnchecked(this)" name="1" class="warehouse-1 warehouse-unchecked "></a>
                <span>使用总部库存</span>
            </div>
            <div class="button-box button-box-second type2">
                <a onclick="qm_customersetup.checkedAndUnchecked(this)" name="2" class="warehouse-1 warehouse-unchecked"></a>
                <span>使用销售点库存</span>
            </div>
            <a class=" warehouse-but" onclick="qm_customersetup.submitHint(this)">确定</a>

        </div>
    </div>
</div>
<div class="border-box " id="cooperation">
    <div class="am-g frist-line">
        <div class=" am-u-lg-3 ">合作农户</div>
        <div class=" am-u-lg-9 ">和公司合作的农户,使用商家的商品资源生产农成品,交给商家销售,合作农户需货量小,建议安排使用销售点商城。</div>
    </div>
    <div class="am-g frist-line second-line">
        <div class=" am-u-lg-3">库存使用设置</div>
        <div class=" am-u-lg-9 ">
            <div class="button-box type1">
                <a onclick="qm_customersetup.checkedAndUnchecked(this)" name="1" class="warehouse-1 warehouse-unchecked "></a>
                <span>使用总部库存</span>
            </div>
            <div class="button-box button-box-second type2">
                <a onclick="qm_customersetup.checkedAndUnchecked(this)" name="2" class="warehouse-1 warehouse-unchecked"></a>
                <span>使用销售点库存</span>
            </div>
            <a class=" warehouse-but" onclick="qm_customersetup.submitHint(this)">确定</a>

        </div>
    </div>
</div>
<div class="border-box " id="cooperative">
    <div class="am-g frist-line">
        <div class=" am-u-lg-3 ">合作社</div>
        <div class=" am-u-lg-9 ">多个农户抱团与公司合作,使用商家的商品资源生产农成品,给商家打包销售,合作社需货量大,建议使用总部商城。</div>
    </div>
    <div class="am-g frist-line second-line">
        <div class=" am-u-lg-3">库存使用设置</div>
        <div class=" am-u-lg-9 ">
            <div class="button-box type1">
                <a onclick="qm_customersetup.checkedAndUnchecked(this)" name="1" class="warehouse-1 warehouse-unchecked "></a>
                <span>使用总部库存</span>
            </div>
            <div class="button-box button-box-second type2">
                <a onclick="qm_customersetup.checkedAndUnchecked(this)" name="2" class="warehouse-1 warehouse-unchecked"></a>
                <span>使用销售点库存</span>
            </div>
            <a class=" warehouse-but" onclick="qm_customersetup.submitHint(this)">确定</a>
        </div>
    </div>
</div>
<div class="border-box " id="dealer">
    <div class="am-g frist-line">
        <div class=" am-u-lg-3 ">经销商</div>
        <div class=" am-u-lg-9 ">经销商是二级销售商,购买公司的商品后独立销售,经销商需货量大,建议使用总部商城。</div>
    </div>
    <div class="am-g frist-line second-line">
        <div class=" am-u-lg-3">库存使用设置</div>
        <div class=" am-u-lg-9 ">
            <div class="button-box type1">
                <a onclick="qm_customersetup.checkedAndUnchecked(this)" name="1" class="warehouse-1 warehouse-unchecked "></a>
                <span>使用总部库存</span>
            </div>
            <div class="button-box button-box-second type2">
                <a onclick="qm_customersetup.checkedAndUnchecked(this)" name="2" class="warehouse-1 warehouse-unchecked"></a>
                <span>使用销售点库存</span>
            </div>
            <a class=" warehouse-but" onclick="qm_customersetup.submitHint(this)">确定</a>
        </div>
    </div>
</div>
</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script src="${path}/pages/management/qm-customersetup.js"></script>
<script type="text/javascript">
    qm_customersetup.inint();
</script>
</html>