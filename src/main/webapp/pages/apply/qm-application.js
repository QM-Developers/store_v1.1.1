/**
 * Created by Administrator on 2017/10/27.
 */
var qm_application = {
    front: null,
    reverse: null,
    idcard: null,
    inint: function ()
    {
        var urlType = urlParams.split('=')[0];
        console.log(urlType)
        switch (urlType)
        {
            case 'addApply':
                //申请
                qm_application.initWebUpload();//初始化图片上传
                qm_application.getBranchList();//获取审批人
                $('#dispose').remove();
                $('#disagree').remove();
                $('#consent').remove();
                break;
            case 'applyDetails':
                //详情
                $('#sbumitBut').remove();
                $('#disagree').remove();
                $('#consent').remove();
                qm_application.getDetails();
                $('#dispose').css('display', 'block');
                break;
            case 'approveApply':
                //审批
                $('#sbumitBut').remove();
                $('#dispose').css('display', 'block');
                qm_application.getDetails();

                break;
            default:
                break;
        }

    },
    getBranchList: function ()
    {
        //获取审批部门
        var url = path + '/s/findDepartmentList.action';
        var params = {};
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '部门ID')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                var num = $('.branchbox').length;
                var $option = '';
                for (var i = 0; i < data.length; i++)
                {
                    $option += '<option value="' + data[i].departmentId + '">' + data[i].departmentName + '</option>';
                }
                $('#branch' + num).empty().append($option);
                qm_application.getBranchOption(data[0].departmentId)
            }
        })
    },
    getBranchOption: function (thisval)
    {
        //获取部门下的成员
        var url = path + "/s/findMemberList.action";
        var params = {};
        var num = $('.branchoption').length;
        params["departmentId"] = thisval;
        params['pageNum'] = '1';
        params['pageSize'] = '999';
        console.log(params, '成员id')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '成员')
            var data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["userId"] + '" >' + data[i]["userName"] + '</option>';
            $('#branchoption' + num).empty().append(item);
        });
    },
    onChangeVal: function (item)
    {
        //改变的成员列表
        var itemval = $(item).val();
        var $ieem = $(item).parents('.goods-box1-2').next().find('.branchoption');
        var url = path + "/s/findMemberList.action";
        var params = {};
        params["departmentId"] = itemval;
        params['pageNum'] = '1';
        params['pageSize'] = '999';
        console.log(params, '成员id')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '成员')
            var data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["userId"] + '">' + data[i]["userName"] + '</option>';
            $ieem.empty().append(item);

        });
    },
    addApprove: function (item)
    {

        var $element = $(item).parents('.approver').find(".goods-box1").length;
        if ($element >= 3)
        {
            return;
        }
        var $Approver = '<div class="goods-box1 branchbox">' +
            '<div class="goods-box1-1">审批人员:</div>' +
            '<div class="goods-box1-2">' +
            '<select name="" class="branch" id="branch' + parseInt($element + 1) + '" onchange="qm_application.getBranchOption(this.value)">' +
            '<option value=""></option>' +
            '</select>' +
            '</div>' +
            '<div class="goods-box1-2">' +
            '<select name="" class="branchoption" id="branchoption' + parseInt($element + 1) + '">' +
            '<option value=""></option>' +
            '</select>' +
            '</div>' +
            '<div class="removethis" onclick="qm_application.removeApprove(this)">X</div>' +
            '</div>';
        $(item).parents('#approver').append($Approver);
        console.log($element)
        qm_application.getBranchList();

    },
    removeApprove: function (item)
    {
        $(item).parents('.goods-box1').remove();
    },
    initWebUpload: function ()
    {
        var site = {
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
            // 文件接收服务端。
            server: path + '/s/saveCommonApplyImage.action',
            threads: 1, // 上传并发数
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#front',
            fileVal: 'img',
            // formData: {'customerId': urlParams},
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        };
        qm_application.front = WebUploader.create(site);
        site.pick = '#reverse';
        site.server = path + '/s/saveCommonApplyImage.action';
        qm_application.reverse = WebUploader.create(site);
        site.pick = '#idcard';
        site.server = path + '/s/saveCommonApplyImage.action';
        qm_application.idcard = WebUploader.create(site);

        function operation(element, id)
        {
            element.on('fileQueued', function (file)
            {
                var $li = $('<a class=img-a><i class="removeimage" onclick="qm_application.removeImage(this)">X</i><img  src=""/></a>'),
                    $img = $li.find('img');
                // $list为容器jQuery实例
                $(id).find('.webuploader-pick').append($li);

                element.makeThumb(file, function (error, src)
                {
                    if (error)
                    {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }
                    $img.attr('src', src);
                }, 310, 170);
            });
            // 文件上传过程中创建进度条实时显示。
            element.on('uploadProgress', function (file, percentage)
            {
                var $li = $('#' + file.id),
                    $percent = $li.find('.progress .progress-bar');

                // 避免重复创建
                if (!$percent.length)
                {
                    $percent = $('<div class="progress progress-striped active">' +
                        '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                        '</div>' +
                        '</div>').appendTo($li).find('progress-bar');
                }
                // $li.find('p.state').text('上传中');
                $percent.css('width', percentage * 100 + '%');

            });

            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            element.on('uploadSuccess', function (file, data)
            {
                var $li = $('#' + file.id),
                    $percent = $li.find('.upload-progress');

                if ($percent.length)
                    $percent.remove();

                $li.append($percent);
                console.log(data)
                var imgid = data.result;
                $(id).attr('name', imgid)

            });

            // 文件上传失败，显示上传出错。
            element.on('uploadError', function (file)
            {
                var $li = $('#' + file.id),
                    $percent = $li.find('.upload-progress');

                if ($percent.length)
                    $percent.remove();

                $percent = $('<div class="upload-progress" style="color: red;width: 65px">上传失败</div>').appendTo($li);
                $li.append($percent);
            });
            // 完成上传完了，成功或者失败，先删除进度条。
            element.on('uploadComplete', function (file)
            {

            });
        }

        operation(qm_application.front, $('#front'));
        operation(qm_application.reverse, $('#reverse'));
        operation(qm_application.idcard, $('#idcard'));

    },
    submitBut: function ()
    {
        if (!myjs.isNull($('#applyTitle').val()) && !myjs.isNull($('#beginDate').val()) && !myjs.isNull($('#endDate').val()) && !myjs.isNull($('#reason').val()))
        {
            var titletext = '提示';
            var conttext = '是否提交申请';
            var leftbuttext = '是';
            var fnleft = 'qm_application.submitApply()';
            var rightbuttext = '否';
            var fnright = 'indenxlogin.ErrorpopRemove(this)'
            indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)

        } else
        {
            var titletext = '提示';
            var conttext = '提交失败！信息不完整';
            var fnclick = 'indenxlogin.ErrorpopRemove(this)';
            var buttext = '确定';
            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext)
        }
    },
    submitApply: function ()
    {
        var url = path + '/s/saveCommonApply.action';
        var params = {};
        params['applyTitle'] = $('#applyTitle').val();
        params['beginDate'] = $('#beginDate').val().trim();
        params['endDate'] = $('#endDate').val().trim();
        params['applyReason'] = $('#reason').val().trim();
        params['commonApplyApprove'] = JSON.stringify(qm_application.eachApprove());
        params['commonApplyImage'] = JSON.stringify(qm_application.eachImage());
        console.log(params, '提交数据')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                location.href = "qm-applylist.jsp";
            }
        })
    },
    eachApprove: function ()
    {
        //获取审批人
        var jsonperson = [];
        $('.branchoption').each(function (i)
        {
            var json = {
                "approveId": $(this).val(),
                'approveName': $(this).find("option:selected").text(),
                'approveSequence': parseInt(i + 1),
            };
            console.log(i)
            jsonperson.push(json);

        });
        for (var j = 0; j < jsonperson.length; j++)
        {
            console.log(jsonperson[j], 'renyuan')
        }

        return jsonperson;
    },
    eachImage: function ()
    {
        //获取图片
        var jsonImage = [];
        $('.filePicker').each(function ()
        {
            if (!myjs.isNull($(this).attr('name')))
            {
                var json = {
                    "imageId": $(this).attr('name'),
                };
                jsonImage.push(json);
            }
        })
        return jsonImage;
    },
    removeImage: function (item)
    {
        //删除图片
        $(item).parent('a').remove();
        return false;
    },
//  获取详情
    getDetails: function ()
    {
        var url = path + '/s/getCommonApply.action';
        var params = {};
        params['applyId'] = urlParams.split('=')[1];
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data,'审批详情')
            var state = data.state;
            var data = data.result;
            var approve = data.approveList;
            var imageId = data.imageList;

            if (state == '1')
            {
                console.log(data.approve);
                if (data.approve !='1' && urlParams.split('=')[0] == 'approveApply')
                {
                    console.log('1111')
                    $('#disagree,#consent').css('display','none').attr('disabled', true).css('background', '#ccc');
                }else {
                    $('#disagree,#consent').css('display','block')
                }

                $('#applyTitle').attr('disabled', 'disabled').val(data.applyTitle);
                $('#beginDate').attr('disabled', 'disabled').val(new Date(data.beginDate).format("yyyy-MM-dd"));
                $('#endDate').attr('disabled', 'disabled').val(new Date(data.endDate).format("yyyy-MM-dd"));
                $('#reason').attr('disabled', 'disabled').val(data.applyReason);
                $('#approver').empty();
                var $itemMember = '';
                for (var i = 0; i < approve.length; i++)
                {
                    $itemMember += '<div class="goods-box1 branchbox">' +
                        '<div class="goods-box1-1">审批人员:</div>' +
                        '<div class="goods-box1-2">' +
                        '<input disabled value="' + approve[i].departmentName + '">' +
                        '</div>' +
                        '<div class="goods-box1-2">' +
                        '<input disabled value="' + approve[i].approveName + '">' +
                        '</div>' +
                        '</div>';
                }
                $('#approver').append($itemMember);
                // var pathImg = path + '/user_getHeadPortrait.action\?path=';
                for (var j = 0; j < imageId.length; j++)
                {
                    var $img = '<a class="img-a">' +
                        '<img alt="" src="' + path + imageId[j].imagePath + '">' +
                        '</a>';
                    $('.imgbox').eq(j).append($img)
                }
                ;
                var $itemScheme = '';
                for (var k = 0; k < approve.length; k++)
                {
                    console.log(approve[k], 'changdu');
                    $itemScheme += '<div class="goods-box">' +
                        '<div class="goods-box1 approvestate">' +
                        '<div >' + approve[k].departmentName + '</div><div>' + approve[k].approveName + '</div><div>(' + qm_application.statusType(approve[k].approveResult) + ')</div></div>' +
                        '<div class="am-g goods-box2">' +
                        '<div class="goods-box1-1">审批意见:</div>';
                    if (approve[k].approveId == parent.document.getElementById('userName').getAttribute('name') && urlParams.split('=')[0] == 'approveApply' && approve[k].approveResult == '20')
                    {
                        $itemScheme += '<textarea  maxlength="500" class="goods-box2-2 " id="approveText" name="' + approve[k].approveSequence + '">' + approve[k].approveAdvice + '</textarea>';
                        // $('#disagree,#consent').attr('disabled', true).css('background', '#ccc');
                    } else
                    {
                        $itemScheme += '<textarea disabled maxlength="500" class="goods-box2-2" name="' + approve[k].approveSequence + '">' + approve[k].approveAdvice + '</textarea>';
                    }
                    $itemScheme += '</div></div>';
                }
                $('#dispose').append($itemScheme);
            }
        })
    },
    statusType: function (num)
    {
        //状态
        var text = '';
        switch (num)
        {
            case 20:
                text = '待审批';
                break;
            case 21:
                text = '已同意';
                break;
            case 22:
                text = '已否决';
                break;
            default:
                break;
        }
        return text;
    },
    consentApplyBut: function ()
    {
        var titletext = '提示';
        var conttext = '是否提交申请';
        var leftbuttext = '是';
        var fnleft = 'qm_application.consentApply()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()'
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    consentApply: function ()
    {
        //同意申请
        var url = path + '/s/updateCommonApplyAccept.action';
        var params = {};
        params['applyId'] = urlParams.split('=')[1];
        params['approveAdvice'] = $('#approveText').val();
        params['approveSequence'] = $('#approveText').attr('name');
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '同意')
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
             $('#approveText').attr('disabled','disabled').parents('.goods-box2').prev().find('div').last().text('(已同意)')
                $('#disagree,#consent').remove();
                indenxlogin.removepop();
            }
        })
    },
    disagreeApplyBut: function ()
    {
        var titletext = '提示';
        var conttext = '是否提交申请';
        var leftbuttext = '是';
        var fnleft = 'qm_application.disagreeApply()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.ErrorpopRemove(this)'
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    disagreeApply: function ()
    {
        //拒绝申请
        var url = path + '/s/updateCommonApplyRefuse.action';
        var params = {};
        params['applyId'] = urlParams.split('=')[1];
        params['approveAdvice'] = $('#approveText').val();
        params['approveSequence'] = $('#approveText').attr('name');
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '拒绝')
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                $('#approveText').attr('disabled','disabled').parents('.goods-box2').prev().find('div').last().text('(已拒绝)');
                $('#disagree,#consent').remove()
                indenxlogin.removepop();
            }
        })
    },

}