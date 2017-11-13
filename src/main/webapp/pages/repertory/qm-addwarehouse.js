/**
 * Created by Administrator on 2017/10/10.
 */
var qm_addwarehouse = {
    inint: function ()
    {
        signCheck = parent.document.getElementById('positionName').getAttribute('name');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());

        var urlType = urlParams.split('=')[0]
        switch (urlType)
        {
            case 'buil':
                if (signCheck == 'salesman_manager')
                {
                    $('#header').text('调货单');
                    $('#operatorName').val($('#userName', parent.document).text()).attr('name', parent.document.getElementById('userName').getAttribute('name'));
                    console.log(parent.document.getElementById('userName').value)
                    $('#second-li').remove();
                    $('#third-li').remove();
                    qm_addwarehouse.getPageCount()
                    qm_addwarehouse.getBranchList();
                } else
                {
                    qm_addwarehouse.builComeIn();
                }
                $('#but1').remove();
                $('#but4').remove();
                $('#but5').remove();
                break;
            case 'record':
                qm_addwarehouse.recordComeIn();
                $('#but2').remove();
                $('#but3').remove();
                $('#but4').remove();
                $('#but5').remove();
                $('#approver').remove();
                break;
            case 'apply':

                $('#header').text('调货单');
                $('#second-li').remove();
                $('#but2').remove();
                $('#but3').remove();
                if (signCheck == 'logistics_manager')
                {
                    //后勤主管
                    console.log('进来了1')
                    $('#four-li').remove();
                    $('#orderNumber').html('调货单号');

                    $('.apply-2').html('库存');
                    $('.apply-3').html('调货数量');
                    $('.apply-1').remove();
                    $('#but4').remove();
                } else if (signCheck == 'salesman_manager')
                {
                    $('.apply-1').remove();
                    console.log('进来了2')
                    $('#but5').remove();
                } else
                {
                    $('#but4').remove();
                    $('#but5').remove();
                }


                $('#textareaText').attr('disabled', 'disabled');
                qm_addwarehouse.applyLook(pageNum, pageSize);
                break;
            default:
                break;
        }
    },
    applyLook: function (pageNum, pageSize)
    {
        //查看申请记录
        var url = '';
        var params = {};
        if (urlParams.split('=')[0] == 'apply')
        {
            //如果是查看
            url += path + '/s/getRepertoryApply.action';
            params['applyId'] = urlParams.split('=')[1];
        } else
        {
            url += path + '/s/listRepertoryApplyByProposer.action';
            params["pageNum"] = pageNum;
            params["pageSize"] = pageSize;
        }
        console.log(params, 'id记录查看')
        myjs.ajax_post(url, params, function (data)
        {

            var state = data.state;
            var data = data.result;
            console.log(data, '查看ID')
            var applyList = data.applyList;
            var applyStatus = data.applyStatus;
            console.log(applyStatus, '记录状态')
            console.log(data, '记录查看')
            if (state == '1')
            {
                $('#operatorName').val(data.proposerName);
                $('#approver').val(data.approverName);
                $('#recordCode').val(data.applyCode);
                $('#textareaText').val(data.applyRemark);

                switch (applyStatus)
                {
                    case 10:
                        $('#but4').remove();

                        console.log('状态2')
                        break;
                    case 11:
                        $('#but5').remove();
                        $('.apply-2').remove();
                        console.log('状态1')
                        break;
                    case 12:
                        $('#but4').remove();
                        $('#but5').remove();
                        $('.apply-2').remove();
                        console.log('状态3')
                        break;
                    default:
                        break;
                }

                var item = "";
                for (var i = 0; i < applyList.length; i++)
                {
                    item += '<li class="list-tr" >' +
                        '<div class="list-td1">' + applyList[i]["goodsCode"] + '</div>' +
                        '<div class="list-td2">' + applyList[i]["goodsName"] + '</div>' +
                        '<div class="list-td3">' + applyList[i]["goodsType"] + '</div>' +
                        '<div class="list-td4">' +
                        '<div class="list-td4-box" >' +
                        '<div class="list-td4-1" >' + applyList[i]["standardName"] + '</div>';
                    if (signCheck == 'logistics_manager' && applyStatus == '10')
                    {
                        item += '<div class="list-td4-3">' + applyList[i]["currentCount"] + '</div>';
                    }
                    item += '<div class="list-td4-3">' + applyList[i]["standardCount"] + '</div>' +
                        '</div>';
                }
                item += '</li>';

                $("#ul-table").append(item);
                //重新改变列表尺寸
                if (signCheck != 'logistics_manager' || applyStatus != '10')
                {
                    $('.list-toptd4').css('width', '30%');
                    $('.list-td4').css('width', '30%');
                    $('.list-td3').css('width', '20%');
                    $('.list-toptd4-box').find('.list-toptd4-1').css('width', '50%');
                    $('.list-td4-box').find('div').css('width', '50%');

                }
                //滚动条
                if ($('#ul-table').find('li').length > '10')
                {
                    $('#scrollbar').css('display', 'block')
                    scrollbar.scrollBar();
                }
            }
        })
    },

    builComeIn: function ()
    {
        //总部仓库
        $('#third-li').remove();
        $('#four-li').remove()
        var name = $('#userName', parent.document).text().trim();
        $('#operatorName').val(name);
        $('#branchName').val('总部仓库');
        qm_addwarehouse.getPageCount()

    },
    recordComeIn: function ()
    {
        //总部记录
        var url = path + '/s/getRepertoryIncome.action';
        var params = {};
        params['recordId'] = urlParams.split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;
            var incomeList = data.incomeList;

            console.log(data, '解析')
            if (state == '1')
            {
                $('#operatorName').val(data.operatorName);
                $('#branchName').val(data.branchName);
                $('#textareaText').val(data.recordRemark);
                $('#recordCode').val(data.recordCode);

                var item = "";
                for (var i = 0; i < incomeList.length; i++)
                {
                    item += '<li class="list-tr" id="' + incomeList[i]["goodsId"] + '">' +
                        '<div class="list-td1">' + incomeList[i]["goodsCode"] + '</div>' +
                        '<div class="list-td2">' + incomeList[i]["goodsName"] + '</div>' +
                        '<div class="list-td3">' + incomeList[i]["goodsTypeName"] + '</div>' +
                        '<div class="list-td4">' +
                        '<div class="list-td4-box" >' +
                        '<div class="list-td4-1" id="' + incomeList[i]["standardId"] + '">' + incomeList[i]["standardName"] + '</div>' +
                        '<div class="list-td4-2">' + incomeList[i]["currentCount"] + '</div>' +
                        '<div class="list-td4-3">' + incomeList[i]["standardCount"] + '</div>' +
                        '</div>';
                }
                item += '</li>';
            }
            $("#ul-table").append(item);
            if ($('#ul-table').find('li').length > '10')
            {
                $('#scrollbar').css('display', 'block')
                scrollbar.scrollBar();
            }
        })
    },
    getBranchList: function ()
    {
        //获取审批人
        var url = path + '/s/listRepertoryChecker.action';
        var params = {};
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '审批人')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                for (var i = 0; i < data.length; i++)
                {
                    $('#approver').val(data[i].approverName).attr('name', data[i].approverId);
                }

            }
        })
    },
    getPageCount: function ()
    {
        //循环获取商品
        var url = path + '/s/getFirstRepertory.action';
        var params = {};
        params['pageNum'] = '1';
        params['pageSize'] = '10';
        console.log(params, '页数')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '页数数据')
            var state = data.state;
            var pageCount = data.pageCount
            if (state == '1')
            {
                for (var i = 1; i <= pageCount; i++)
                {
                    var pageCountNum = i;
                    qm_addwarehouse.getData(pageCountNum)
                }
                console.log($('#ul-table').find('li').length)

            }
        })
    },

    getData: function (pageCountNum)
    {
        var url = path + '/s/getFirstRepertory.action';
        var params = {};
        params['pageNum'] = pageCountNum + '';
        params['pageSize'] = '10';

        console.log(params, '数据')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var pageCount = data.pageCount;
            var data = data.result;
            $('#pageright').text(pageCount)
            if (state == '1')
            {
                var item = "";
                for (var i = 0; i < data.length; i++)
                {
                    item += '<li class="list-tr" id="' + data[i]["goodsId"] + '">' +
                        '<div class="list-td1">' + data[i]["goodsCode"] + '</div>' +
                        '<div class="list-td2">' + data[i]["goodsName"] + '</div>' +
                        '<div class="list-td3">' + data[i]["goodsType"] + '</div>' +
                        '<div class="list-td4">';
                    var standardsList = data[i]["standards"];
                    for (var j = 0; j < standardsList.length; j++)
                    {
                        item += '<div class="list-td4-box" >' +
                            '<div class="list-td4-1" id="' + standardsList[j]["standardId"] + '">' + standardsList[j]["standardName"] + '</div>' +
                            '<div class="list-td4-2">' + standardsList[j]["standardCount"] + '</div>' +
                            '<div class="list-td4-3"><input onkeyup="indenxlogin.inputVal(this)" contentEditable="indenxlogin.inputVal(this)" onblur="indenxlogin.inputVal(this)"></div>' +
                            '</div>';
                    }
                    item += '</li>';
                }
                $("#ul-table").append(item);

                if ($('#ul-table').find('li').length > '10')
                {
                    $('#scrollbar').css('display', 'block')
                    scrollbar.scrollBar();
                }

            }
        })
    },

    submitBut: function ()
    {
        //提交
        var titletext = '提示';
        var conttext = '是否提交';
        var leftbuttext = '是';
        var fnleft = 'qm_addwarehouse.submitData()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)

    },
    submitData: function ()
    {
        var url = '';
        var params = {};
        if (signCheck == 'salesman_manager')
        {
            url += path + '/s/saveRepertoryApply.action';
            params['branchId'] = urlParams.split('&')[0].split('=')[1];
            params['branchName'] = unescape(urlParams.split('&')[1].split('=')[1]);
            params['proposerId'] = $.trim($('#operatorName').attr('name'));
            params['proposerName'] = $.trim($('#operatorName').val());
            params['approverId'] = $.trim($('#approver').attr('name'));
            params['approverName'] = $.trim($('#approver').val());
            params['applyRemark'] = $.trim($('#textareaText').val());
            params['goodsInfo'] = JSON.stringify(qm_addwarehouse.eachData());
        } else
        {
            url += path + '/s/saveRepertoryIncome.action';
            params['branchId'] = urlParams.split('=')[1];
            params['branchName'] = $.trim($('#branchName').val());
            params['applyRemark'] = $.trim($('#textareaText').val());
            params['goodsInfo'] = JSON.stringify(qm_addwarehouse.eachData());
        }
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                var text = '提交成功';
                qm_addwarehouse.succeedHint(text);
            }
        })
    },
    eachData: function ()
    {
        var jsonarr = [];
        $('#ul-table li').find('input').each(function ()
        {
            if (!myjs.isNull($(this).val()))
            {
                console.log($(this).parents('.list-tr').attr('id').trim(), '商品ID')
                console.log($(this).parents('.list-tr').find('.list-td4-1').attr('id').trim(), '商品规格id')
                var json = {
                    "goodsId": $(this).parents('.list-tr').attr('id').trim(),
                    'goodsName': $(this).parents('.list-tr').find('.list-td2').text(),
                    'standardId': $(this).parents('.list-tr').find('.list-td4-1').attr('id').trim(),
                    'standardName': $(this).parents('.list-tr').find('.list-td4-1').text(),
                    'standardCount': $(this).val()
                };
                jsonarr.push(json);
            }
        })
        return jsonarr;
    },
    succeedHint: function (text)
    {
        var titletext = '提示';
        var conttext = text;
        var fntext = '是';
        var fn = 'javascript:history.back(-1)';
        indenxlogin.Errorpopone(titletext, conttext, fn, fntext)
    },
    cancelBut: function ()
    {
        //取消操作

        console.log('1212')
        var titletext = '提示';
        var conttext = '是否取消操作';
        var leftbuttext = '是';
        var fnleft = 'javascript:history.back(-1)';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)

    },
    consentApplyBut: function ()
    {
        //提交
        var titletext = '提示';
        var conttext = '是否同意该调货申请';
        var leftbuttext = '是';
        var fnleft = 'qm_addwarehouse.consentApply()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)

    },
    consentApply: function ()
    {
        var url = path + '/s/updateRepertoryApplyAccept.action';
        var params = {};
        params['applyId'] = urlParams.split('=')[1];

        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                var text = '提交成功';
                qm_addwarehouse.succeedHint(text);
            } else
            {
                var text = '提交失败,库存不足';
                qm_addwarehouse.succeedHint(text);
            }
        })
    },
    applyFinishBut: function ()
    {
        //签收
        var titletext = '提示';
        var conttext = '是否确认签收';
        var leftbuttext = '是';
        var fnleft = 'qm_addwarehouse.applyFinish()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)

    },
    applyFinish: function ()
    {
        var url = path + '/s/updateRepertoryApplyFinish.action';
        var params = {};
        params['applyId'] = urlParams.split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                var text = '提交成功';
                qm_addwarehouse.succeedHint(text);
            }
        })
    },


}