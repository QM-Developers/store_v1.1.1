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
		<title></title>
		<link rel="stylesheet" type="text/css" href="../../script/Amaze/assets/css/amazeui.min.css" />

		<style type="text/css">
			
			
			.groupheader .qm-but1 {
				display: block;
				width: 90px;
				background: #f2f2f2;
				font-size: 18px;
				color: #000000;
				text-align: center;
				line-height: 42px;
				margin-left: 30px;
			}
			.groupheader .qm-but1:hover {				
				background: #CCCCCC;			
			}
			.groupheader-left {
				width: 50%;
				float: left;
			}
			
			.groupheader-right {
				width: 50%;
				margin-top: 4px;
			}
			
			.groupheader-box {
				width: 300px;
				height: 35px;
				margin-right: 44px;
				border-top-left-radius: 2px;
				border-bottom-left-radius: 4px;
			}
			
			.groupheader-put {
				display: inline-block;
				float: left;
				width: 259px;
				height: 34px;
				padding-left: 10px;
				border: none;
			}
			
			.groupheader-span {
				display: inline-block;
				width: 40px;
				height: 35px;
				cursor: pointer;
				background: url(../../images/seo.jpg) no-repeat;
			}
		</style>
	</head>

	<body>
		
			<div class=" groupheader-left">
				<a class="qm-but1" href="qm-groupdata.html">客户建档</a>
			</div>
			<div class=" am-fr groupheader-right">
				<div class="am-fr groupheader-box">
					<input class="groupheader-put" type="" name="" value="" placeholder="输入关键字符" /><span id="seobut" class="groupheader-span"></span>
				</div>
			</div>
		
	</body>

</html>