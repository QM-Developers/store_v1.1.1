var qm_customerdata = {
    // front: null,
    // reverse: null,
    // idcard: null,
    init: function ()
    {
        var urltype = urlParams.split('=')[0];
        console.log(urlParams)

        switch (urltype)
        {
            case 'client':
                //客户
                $.cookie('clientdata', urlParams);
                qm_customerdata.getCustomerData();
                $('#freeze').remove();
                break;
            case 'cDataGO':
                //客户
                if ($.cookie('clientdata') != null)
                {
                    urlParams = $.cookie('clientdata');
                    qm_customerdata.getCustomerData();
                }
                break;
            default:
                break;
        }
    },

    // setData: function ()
    // {
    //     qm_customerdata.getCustomerData();
    //     // $('#record').attr('href', 'qm-customerrecord.jsp?cRecord=' + urlParams.split('=')[1] +'&name='+escape($('#userName').val()));
    //     // $('#applytransfer').attr('href', 'qm-applytransfer.jsp?applytransfer=' + urlParams.split('=')[1]);
    //     // $('.disable-sign').attr("disabled", "true");
    //     // // qm_customerdata.initWebUpload();
    //
    // },
    getCustomerData: function ()
    {
        console.log(urlParams)

        var url = path + '/s/getCustomer.action';
        console.log(path)
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;
            var usetype = data.customerType;
            var usegrade = data.creditRating;
            console.log(data)
            if (state == '1')
            {
                $('#record').attr('href', 'qm-customerrecord.jsp?cRecord=' + urlParams.split('=')[1] + '&name=' + escape(data.userName));
                $('#applytransfer').attr('href', 'qm-applytransfer.jsp?applytransfer=' + urlParams.split('=')[1]);
                $('.disable-sign').attr("disabled", "true");

                $('#userName').val(data.userName);
                $('#userSex').text(data.userSex);
                $('#userPhone').val(data.userPhone);
                $('#userBirthday').val(data.userBirthday);
                $('#userAddress').val(data.userAddress);

                switch (usegrade)
                {
                    //客户评级
                    case 0:
                        $("#creditRating").val("0");
                        break;
                    case 1:
                        $("#creditRating").val("1");
                        break;
                    case 2:
                        $("#creditRating").val("2");
                        break;
                    case 3:
                        $("#creditRating").val("3");
                        break;
                    case 4:
                        $("#creditRating").val("4");
                        break;

                    default:
                        break;
                }
                switch (usetype)
                {
                    //客户分类
                    case 'personal':

                        $("#customerType").html("个体农户");
                        var $div = '<div class="customerdata_select personal">' +
                            '<a href="qm-sitedatalistone.jsp?grid=' + urlParams.split('=')[1] + '">养殖信息</a>' +
                            '</div>';
                        var $personal = $('.personal').length;
                        if ($personal > 0)
                        {
                            return;
                        }
                        $('#sitelist').append($div);
                        $('.personal').css('display', 'block')
                        break;
                    case 'dealer':
                        $("#customerType").html("经销商");
                        var $div = '<div class="customerdata_select dealer">' +
                            '<a href="qm-manageunitlist.jsp?client=' + urlParams.split('=')[1] + '">经营单位</a>' +
                            '</div>';
                        var $dealer = $('.dealer').length;
                        if ($dealer > 0)
                        {
                            return;
                        }
                        $('#sitelist').append($div);
                        $('.dealer').css('display', 'block')
                        break;
                    case 'cooperation':
                        $("#customerType").html("合作农户");
                        var $div = '<div class="customerdata_select cooperation">' +
                            '<a href="qm-cooperativelist.jsp?client=' + urlParams.split('=')[1] + '"> 场地资源</a>' +
                            '</div>' +
                            '<div class="customerdata_select cooperation">' +
                            '<a href="qm-experiencelist.jsp?client=' + urlParams.split('=')[1] + '"> 养殖经验</a>' +
                            '</div>';
                        var $cooperation = $('.cooperation').length;
                        if ($cooperation > 0)
                        {
                            return;
                        }
                        $('#sitelist').append($div);
                        $('.cooperation').css('display', 'block')
                        break;
                    case 'cooperative':
                        $("#customerType").html("合作社");
                        var $div = '<div class="customerdata_select cooperative">' +
                            '<a href="qm-cooperationlist.jsp?khid=' + urlParams.split('=')[1] + '">合作社资源</a>' +
                            '</div>';
                        var $cooperative = $('.cooperative').length;
                        if ($cooperative > 0)
                        {
                            return;
                        }
                        $('#sitelist').append($div);
                        $('.cooperative').css('display', 'block')
                        break;
                    default:
                        break;
                }
                var prefix = path + '/s/getCustomerIDCard.action\?path=';
                if (!myjs.isNull(data.userCardFront))
                {
                    $('#front').prepend('<a  onmouseenter="qm_customerdata.removeshow(this)" onmouseleave="qm_customerdata.removehidden(this)" class="img-a "><i class="removeimage" onclick="qm_customerdata.removeImage(this)">X</i><img  src=' + prefix + data.userCardFront + '></a>');

                }
                if (!myjs.isNull(data.userCardBack))
                {
                    $('#reverse').prepend('<a onmouseenter="qm_customerdata.removeshow(this)" onmouseleave="qm_customerdata.removehidden(this)" class="img-a " ><i class="removeimage" onclick="qm_customerdata.removeImage(this)">X</i><img  src=' + prefix + data.userCardBack + '></a>');
                }

                if (!myjs.isNull(data.userCardHand))
                {
                    $('#idcard').prepend('<a  onmouseenter="qm_customerdata.removeshow(this)" onmouseleave="qm_customerdata.removehidden(this)" class="img-a "><i class="removeimage" onclick="qm_customerdata.removeImage(this)">X</i><img  src=' + prefix + data.userCardHand + '></a>');
                }

                $('#userCreateDate').text(new Date(data.userCreateDate).format("yyyy/MM/dd"));

                if (data.hadAccount == '0')
                {
                    $('#hadAccount').text('未建账').css('color', 'red');
                    $('#sponsor').css('display', 'block').attr('href', "qm-applyid.jsp?" + usetype + "=" + urlParams.split('=')[1]);
                } else if (data.hadAccount == '1')
                {
                    var $span = '<i>(' + new Date(data.userCreateDate).format("yyyy/MM/dd") + ')</i>';
                    $('#hadAccount').find('i').text('已建账')
                    $('#hadAccount').append($span);
                    $('#sponsor').remove();
                } else
                {
                    $('#hadAccount').text('已冻结').css('color', 'red');
                }
                $('#updateCount').text(data.updateCount);
                $('#userUpdateTime').text(data.userUpdateTime==null?'' :new Date(data.userUpdateTime).format("yyyy/MM/dd"));
                $('#merchandiserName').text(data.merchandiserName);
            }
        })
    },
    //控制编辑状态
    Compile: function (item)
    {

        var $Compile = $(item).parents(".qm-team").find(".disable-sign");//input元素
        if ($Compile.attr("disabled"))
        {
            $('.li-shade').css('display','none');
            $(item).text("保存").prev().css("display", "block");//改变文字
            $Compile.removeAttr("disabled").css("border", "1px solid #CCCCCC");//取消禁用
            $('#databut').css("display", "block").prev().css("border", "0px").parent().css("border", "1px solid #CCCCCC");//显示时间选择按钮
            $(item).parents(".qm-team").find(".sex-show").css("display", "none").next().css("display", "block");//性别显示隐藏
            $(".sex a").each(function ()
            {
                if ($(this).text().trim() == $(".sex-show").text().trim())
                    $(this).addClass("sex-checked");
                //判断性别
            });
        } else
        {
            var inputval = 0;
            $Compile.each(function ()
            {
                if (myjs.isNull($(this).val()))
                {
                    $(this).focus().css('border-color', 'red');
                    inputval += 1;
                }
            })
            if (inputval == 0)
            {
                $(item).text("编辑").prev().css("display", "none");
                $('.li-shade').css('display','block');
                $Compile.attr("disabled", "true").css("border", "0");
                $('#databut').css("display", "none").prev().css("border", "0px").parent().css("border", "0");
                $(item).parents(".qm-team").find(".sex-show").css("display", "block").next().css("display", "none")
                $(".sex a").each(function ()
                {
                    if ($(this).hasClass("sex-checked"))
                        $(".sex-show").text($(this).text().trim())
                });
                qm_customerdata.editCutomerData();
            }

        }
    },
    editCutomerData: function ()
    {

        var userName = $.trim($('#userName').val());
        var userPhone = $.trim($('#userPhone').val());
        var userBirthday = $.trim($('#userBirthday').val())
        var userAddress = $.trim($('#userAddress').val())
        var userSex = $.trim($('#Sex').find('.sex-checked').text());
        var creditRating = $.trim($("#creditRating").val());
        var url = path + "/s/updateCustomer.action";
        var params = {};
        params["customerId"] = urlParams.split('=')[1];
        params["userName"] = userName;
        params["userPhone"] = userPhone;
        params["userBirthday"] = userBirthday;
        params["userAddress"] = userAddress;
        params["userSex"] = userSex;
        params["creditRating"] = creditRating;
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state=='1'){
                $('#updateCount').text(data.updateCount)
                $('#userUpdateTime').text(new Date(data.userUpdateTime).format("yyyy/MM/dd"))
            }

        })

    },
    cancelCustomerData: function (item)
    {
        //取消编辑
        var $Compile = $(item).parents(".qm-team").find(".disable-sign");//input元素
        $('.li-shade').css('display','block');
        $(item).css('display', 'none').next().text('编辑');
        $Compile.attr("disabled", "true").css("border", "0");
        $('#databut').css("display", "none").prev().css("border", "0px").parent().css("border", "0");
        $(item).parents(".qm-team").find(".sex-show").css("display", "block").next().css("display", "none")
        $(".sex a").each(function ()
        {
            $(this).removeClass("sex-checked");

        });
        qm_customerdata.getCustomerData();
    },

    // initWebUpload: function ()
    // {
    //     var site = {
    //         // 选完文件后，是否自动上传。
    //         auto: true,
    //         // swf文件路径
    //         swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
    //         // 文件接收服务端。
    //         server: path + '/s/saveFrontImage.action',
    //         threads: 1, // 上传并发数
    //         // 选择文件的按钮。可选。
    //         // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    //         pick: '#front',
    //         fileVal: 'img',
    //         formData: {'customerId': urlParams},
    //         // 只允许选择图片文件。
    //         accept: {
    //             title: 'Images',
    //             extensions: 'gif,jpg,jpeg,bmp,png',
    //             mimeTypes: 'image/*'
    //         }
    //     };
    //     qm_customerdata.front = WebUploader.create(site);
    //     site.pick = '#reverse';
    //     site.server = path + '/s/saveBackImage.action';
    //     qm_customerdata.reverse = WebUploader.create(site);
    //     site.pick = '#idcard';
    //     site.server = path + '/s/saveHandImage.action';
    //     qm_customerdata.idcard = WebUploader.create(site);
    //
    //     function operation(element, id)
    //     {
    //         element.on('fileQueued', function (file)
    //         {
    //             var $li = $('<div><a class=img-a><i class="removeimage" onclick="qm_customerdata.removeImage(this)">X</i><img  src=""/></a></div>'),
    //                 $img = $li.find('img');
    //             // $list为容器jQuery实例
    //             $(id).find('.webuploader-pick').append($li);
    //
    //             element.makeThumb(file, function (error, src)
    //             {
    //                 if (error)
    //                 {
    //                     $img.replaceWith('<span>不能预览</span>');
    //                     return;
    //                 }
    //                 $img.attr('src', src);
    //             }, 310, 170);
    //         });
    //         // 文件上传过程中创建进度条实时显示。
    //         element.on('uploadProgress', function (file, percentage)
    //         {
    //             var $li = $('#' + file.id),
    //                 $percent = $li.find('.webuploader-pick');
    //             // 避免重复创建
    //             if (!$percent.length)
    //             {
    //                 $percent = $('<div class="am-progress add-progress am-progress-striped">' +
    //                     '<div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>' +
    //                     '</div>').appendTo($li).find('.webuploader-pick');
    //             }
    //             $percent.css('width', percentage * 100 + '%');
    //         });
    //         // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    //         element.on('uploadSuccess', function (file, data)
    //         {
    //             var $li = $('#' + file.id),
    //                 $percent = $li.find('.upload-progress');
    //             if ($percent.length)
    //                 $percent.remove();
    //             $li.append();
    //             console.log(data)
    //         });
    //         // 文件上传失败，显示上传出错。
    //         element.on('uploadError', function (file)
    //         {
    //             var $li = $('#' + file.id),
    //                 $percent = $li.find('.upload-progress');
    //             if ($percent.length)
    //                 $percent.remove();
    //             $percent = $('<div class="upload-progress" style="color: red;width: 65px">上传失败</div>').appendTo($li);
    //         });
    //         // 完成上传完了，成功或者失败，先删除进度条。
    //         element.on('uploadComplete', function (file)
    //         {
    //
    //         });
    //     }
    //     operation(qm_customerdata.front, $('#front'))
    //     operation(qm_customerdata.reverse, $('#reverse'))
    //     operation(qm_customerdata.idcard, $('#idcard'))
    // },
    removeshow: function (item)
    {

        $(item).find('.removeimage').css('display', 'block')
    },
    removehidden: function (item)
    {

        $(item).find('.removeimage').css('display', 'none')
    },
    // removeImage: function (item)
    // {
    //     //图片删除
    //     $(item).parent('a').remove();
    //     return false;
    // },
    goback: function ()
    {
        var url = urlParams.split('=')[0];
        console.log(url, '地址')
        switch (url)
        {
            case 'client':
                location.href = "qm-customerlist.jsp?cListGo=1";
                break;
            default:
                break;
        }
    },

}