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
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-companyprofile.css"/>
</head>

<body>

<!--seo-->
<div class="companylist" id="companylist">
    <div class="qm-team companyprofile-info">
        <div class="companyprofile-title">
            <h4 class="qm-c-p">基本信息</h4>

        </div>
        <!--左-->
        <div class="companyprofile-leftcont">
            <div class=" qm-team-input">
                <span class="companyprofile-span">企业名称:</span><input/>

            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">企业号码:</span><input/>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">企业电话:</span><input/>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">企业类型:</span>
                <div class="companyprofile-selbox">
                    <select name="">
                        <option value="">类型1</option>
                        <option value="">类型2</option>

                    </select>
                </div>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">所属行业:</span>
                <div class="companyprofile-selbox">
                    <select name="">
                        <option value="">行业1</option>
                        <option value="">行业2</option>

                    </select>
                </div>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">所在地区:</span>
                <div class="companyprofile-selbox">
                    <select name="">
                        <option value="">地区1</option>
                        <option value="">地区2</option>

                    </select>
                </div>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">详细地址:</span><input/>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">邮政编码:</span><input/>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">企业传真:</span><input/>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">企业网址:</span><input/>
            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">成立时间:</span><input/>
            </div>
        </div>
        <!--右-->
        <div class="companyprofile-rightcont">
            <div class=" qm-team-input">
                <div class=" qm-team-input">
                    <span class="companyprofile-span companyprofile-info-logo">公司LOGO:</span>
                    <div class="companyprofile-butbox">
                        <button class="companyprofile-but">上传文件</button>
                        <span class="companyprofile-buttext color-ccc">支持png,jpeg,png,bmp格式</span>
                    </div>
                    <div class="companyprofile-imgbox">
                        <img src="" alt=""/>
                        <div class="companyprofile-preview">预览</div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>
<!--个人-->
<div class="personage">
    <div class="qm-team">
        <div class="companyprofile-title">
            <h4 class="qm-c-p">个人资料</h4>
        </div>

        <div class="companyprofile-leftcont">
            <div class=" qm-team-input">
                <span class="companyprofile-span">姓　　名:</span><input/>

            </div>
            <div class=" qm-team-input">

                <span class="companyprofile-span">性　　别:</span>

                <div class="pop-div2 ">
                    <a href="###" name="male" onclick="PopInput(this)" class="poptwo-c-lia  man">男</a>
                    <a href="###" onclick="PopInput(this)" name="woman" class="poptwo-c-lia woman">女</a>
                </div>
            </div>

            <div class=" qm-team-input">
                <span class="companyprofile-span">职　　位:</span><input/>

            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">电话号码:</span><input/>

            </div>
            <div class=" qm-team-input">
                <span class="companyprofile-span">邮箱号码:</span><input/>

            </div>

        </div>

    </div>
</div>
<div class="companyprofile-preserve">
    <div class="preserve-but">保存</div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>

</html>