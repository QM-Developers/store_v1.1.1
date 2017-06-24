<%@ taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript">
        var path = "${path}";
        var basePath = "${basePath}";
    </script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>

    <style type="text/css">
        .add-v {
            width: 100%;
            height: 100%;
        }
        .add-v .add-v-ul {
            position: relative;
            width: 100%;
            padding: 0;
        }
        .add-v .add-v-ul li {
            width: 100%;
        }
        .add-v .add-v-ul li img {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="add-v">
    <ul class="add-v-ul" id="img-list">
        <cc:forEach var="url" items="${images}">
            <li><img src="${path.concat(url)}"/></li>
        </cc:forEach>
    </ul>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
</html>