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

    <script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
</head>
<body>
<button id="filePicker">上传</button>
</body>
<script type="text/javascript">
    var uploader;

    uploader = WebUploader.create({
        // 选完文件后，是否自动上传。
        auto: true,
        // swf文件路径
        swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
        // 文件接收服务端。
        server: path + '/insertCardHand.action',
        threads: 1, // 上传并发数
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#filePicker',
        fileVal: 'cardHand',
        // 只允许选择图片文件。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        }
    });

    uploader.on('fileQueued', function (file)
    {
        var $list = $("#upload-list");

        var $li = $('<div onclick="gdReleaseJS.onSelectImg(this);" class="imgbox am-img-thumbnail">' +
                '<a id="' + file.id + '"><img style="width: 100%;height: 100%" src=""/></a>' +
                '</div>'),
            $img = $li.find('img');

        // $list为容器jQuery实例
        $list.append($li);

        uploader.makeThumb(file, function (error, src)
        {
            if (error)
            {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }
            $img.attr('src', src);
        }, 1, 1);
    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on('uploadProgress', function (file, percentage)
    {
        var $li = $('#' + file.id),
            $percent = $li.find('.upload-progress');

        // 避免重复创建
        if (!$percent.length)
        {
            $percent = $('<div class="upload-progress am-progress am-progress-striped am-progress-sm am-active ">' +
                '<div class="am-progress-bar am-progress-bar-secondary"  style="width: 0%"></div>' +
                '</div>').appendTo($li).find('.upload-progress');
        }

        $percent.css('width', percentage * 100 + '%');
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on('uploadSuccess', function (file, data)
    {
        var $li = $('#' + file.id),
            $percent = $li.find('.upload-progress');

        $li.find("img").attr("real-path", data.result);
        console.log(data);

        if ($percent.length)
            $percent.remove();

        $li.append('<div class="b-shade"><span>700x700</span></div>');
    });

    // 文件上传失败，显示上传出错。
    uploader.on('uploadError', function (file)
    {
        var $li = $('#' + file.id),
            $percent = $li.find('.upload-progress');

        if ($percent.length)
            $percent.remove();

        $percent = $('<div class="upload-progress" style="color: red;width: 65px">上传失败</div>').appendTo($li);
    });

    // 完成上传完了，成功或者失败，先删除进度条。
    uploader.on('uploadComplete', function (file)
    {

    });
</script>
</html>
