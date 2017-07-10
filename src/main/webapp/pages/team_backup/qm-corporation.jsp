<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>公司资料</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/team/qm-corporation.css"/>
</head>

<body>
<div class=" qm-header">

</div>

<div class="qm-c-list companylist" id="companylist">
    <div class="qm-c-company ">
        <h4 class="qm-c-p">搜索结果列表</h4>

        <ul class="qm-c-ul">
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
            <li class="qm-c-li">青麦科技</li>
        </ul>
    </div>
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
<div class="emptydata">
    <div id="Department">
        <div class="Corporation">
            <div class="qm-team Department">
                <div class="groupdata-title">
                    <h4 class="qm-c-p">公司资料</h4>
                </div>
                <div class="am-g qm-team-txt">
                    <div class=" am-u-sm-10">
                        <div class="qm-team-input">
                            <span class=" am-u-sm-1">公司名称:</span><input class=" am-u-sm-4 am-u-end"/>
                        </div>
                        <div class=" qm-team-input">
                            <span class=" am-u-sm-1">负责人:</span><input class=" am-u-sm-4 am-u-end"/>
                            <span class=" am-u-sm-1">成立时间:</span>
                            <div style="height: 53px;padding: 0;float: left;" class="am-u-sm-4 ">
                                <div class="poptime">
                                    <input class="bor-no pop-input" type="" name="" value=""/>
                                    <button onclick="QmTime(this)" class="am-btn am-btn-default databut am-icon-calendar qm-time-but" data-am-datepicker="{format: 'yyyy-mm-dd'}" type="button"></button>
                                </div>
                            </div>
                        </div>
                        <div class=" qm-team-input">
                            <span class=" am-u-sm-1">联系电话:</span><input class=" am-u-sm-4 am-u-end"/>
                            <span class=" am-u-sm-1">公司地址:</span><input class=" am-u-sm-4 am-u-end"/>
                        </div>
                    </div>
                    <div class=" am-u-sm-2 qm-c-compile">
                        <div class="qm-c-compile1" onclick="Compile(this)">编辑</div>
                    </div>
                </div>
            </div>
        </div>
        <!---->
        <div class="Corporationlist">
            <div class="am-g qm-team1">
                <div class="groupdata-title">
                    <h4 class="qm-c-p">部门列表</h4>
                </div>
                <div class="am-u-sm-10 qm-team1-tab">
                    <table class="am-table ">
                        <thead>
                        <tr>
                            <th>名称</th>
                            <th>性别</th>
                            <th>联系电话</th>
                            <th>部门</th>
                            <th>职位</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="am-u-sm-10 qm-team1-box">
                    <table class="am-table ">
                        <tbody>
                        <tr>
                            <td>赵钱孙</td>
                            <td>男</td>
                            <td>10086010110</td>
                            <td>xx部门</td>
                            <td>xx职位</td>
                            <td><a class="personnel-details" href="">详细信息</a></td>
                        </tr>
                        <tr>
                            <td>赵钱孙</td>
                            <td>男</td>
                            <td>10086010110</td>
                            <td>xx部门</td>
                            <td>xx职位</td>
                            <td><a class="personnel-details" href="">详细信息</a></td>
                        </tr>
                        <tr>
                            <td>赵钱孙</td>
                            <td>男</td>
                            <td>10086010110</td>
                            <td>xx部门</td>
                            <td>xx职位</td>
                            <td><a class="personnel-details" href="">详细信息</a></td>
                        </tr>
                        <tr>
                            <td>赵钱孙</td>
                            <td>男</td>
                            <td>10086010110</td>
                            <td>xx部门</td>
                            <td>xx职位</td>
                            <td><a class="personnel-details" href="">详细信息</a></td>
                        </tr>
                        <tr>
                            <td>赵钱孙</td>
                            <td>男</td>
                            <td>10086010110</td>
                            <td>xx部门</td>
                            <td>xx职位</td>
                            <td><a class="personnel-details" href="">详细信息</a></td>
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
    </div>
</div>
<div class="am-g">
    <div class="del-but-box">
        <button class="del-but">返回</button>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript">
    $(function ()
    {
        $(".qm-header").load("header.html")
    })
</script>
</html>