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
	<link rel="stylesheet" type="text/css" href="${path}/pages/customer/qm-experiencelist.css"/>
</head>

	<body>
		<div class="bodybox opacity-box">
			<div class="site-header" onclick="qm_experiencelist.popshow()" >
				<a class="site-header-but" id="addexperience" ><i class="site-header-i"></i>添加经验</a>
			</div>
			<div class="sitelistbox">
				<div class="site-title">
					<div>经验列表</div>
				</div>
				<div class="site-table-box">
					<table class="am-table " id="table">
						<tbody>
							<tr>
								<th>养殖类目</th>
								<th>养殖品种</th>
								<th>养殖类型</th>
								<th>养殖年限</th>
								<th>操作区</th>
							</tr>
							<%--<tr>--%>
								<%--<td>猪</td>--%>
								<%--<td>内三元</td>--%>
								<%--<td>商品养殖</td>--%>
								<%--<td>2年</td>--%>
								<%--<td>--%>
									<%--<a class="personnel-details">删除</a>--%>
								<%--</td>--%>
							<%--</tr>--%>

						</tbody>
					</table>
					<div class="paging">

						<div class="goback" onclick="javascript:history.back(-1);">
							返回
						</div>

						<div class="pagingright" onclick="qm_experiencelist.NextPage(this)">
							下一页
						</div>
						<div class="pagingmodle">
							<span id="pageleft">1</span>/<span id="pageright">1</span>
						</div>
						<div class="pagingleft" onclick="qm_experiencelist.NextPage(this)">
							上一页
						</div>

						<div class="paging-num-box" id="pagebox">
							人数显示:<span class="paging-num" onclick="qm_experiencelist.pageShowNum(this)">30</span>
							<span class="paging-num" onclick="qm_experiencelist.pageShowNum(this)">20</span>
							<span class="paging-num paging-checked" onclick="qm_experiencelist.pageShowNum(this)">10</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pop-up-box" id="addmessage">
			<div class="pop-up-cont">
				<div class="pop-up-title">
					养殖产品信息
				</div>
				<ul>
					<li>
						<span class="left-span">养殖类目:</span>
						<select name="" class="right-cont" id="breedCategory">
							<option value="">鱼</option>
							<option value="">猪</option>
							<option value="">虾</option>
							<option value="">自定义</option>
						</select>
					</li>
					<li>
						<span class="left-span">养殖品种:</span>
						<select name="" class="right-cont" id="breedVariety">
							<option value="">内三元</option>
							<option value="">外三元</option>
							<option value="">自定义</option>
						</select>
					</li>
					<li>
						<span class="left-span">养殖类型:</span>
						<select name="" class="right-cont" id="breedType">
							<option value="">自繁自养</option>
							<option value="">种苗繁殖</option>
							<option value="">商品养殖</option>
						</select>
					</li>
					<li class="typethree">
						<span class="left-span">养殖年限:</span>
						<input class="right-cont" id="breedAge" />
					</li>

				</ul>
				<div class="pop-up-but">
					<div  onclick="qm_experiencelist.submitdata()">
						提交
					</div>
					<div onclick="qm_experiencelist.pophidden()">
						取消
					</div>
				</div>
			</div>
		</div>
	</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>

<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/customer/qm-experiencelist.js"></script>
<script>
    qm_experiencelist.inint()
</script>
</html>