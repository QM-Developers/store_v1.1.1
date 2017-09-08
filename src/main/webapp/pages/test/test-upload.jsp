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
    <link rel="stylesheet" type="text/css" href="${path}/script/webuploader-0.1.5/webuploader.css">

</head>

<body>
<div id="filePicker">添加图片</div>
<img src="${path}/s/getVisitIDCard.action?path=/WEB-INF/upload/img/id_card/89d9317fb3834353bcf2a507bee2eb82/ccc8922fee8e4108b3659b6b94e34bdd.jpg">
</body>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>

<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>

<script type="text/javascript">
    var params = {};
    params["customerId"] = "1ddd3d18c22a4c129c2517d50e69a400";
    var uploader = WebUploader.create({
        // 选完文件后，是否自动上传。
        auto: true,
        // swf文件路径
        swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
        // 文件接收服务端。
        server: path + '/s/saveFrontImage.action',
        threads: 1, // 上传并发数
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#filePicker',
        formData: params,
        fileVal: 'img',
        // 只允许选择图片文件。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        }
    });

    uploader.on('fileQueued', function (file)
    {

    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on('uploadProgress', function (file, percentage)
    {

    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on('uploadSuccess', function (file, data)
    {
        console.log(data);
    });

    // 文件上传失败，显示上传出错。
    uploader.on('uploadError', function (file)
    {

    });

    // 完成上传完了，成功或者失败，先删除进度条。
    uploader.on('uploadComplete', function (file)
    {

    });
</script>

</html>