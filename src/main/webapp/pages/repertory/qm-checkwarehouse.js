/**
 * Created by Administrator on 2017/10/11.
 */
var qm_checkwarehouse = {
    inint: function ()
    {
        console.log(urlParams)
        var urlType = urlParams.split('=')[0];
        switch (urlType)
        {
            case 'buil':
                //总部仓库新建
                $('#third-li').remove();
                $('#but1').remove();
                var name = $('#userName', parent.document).text().trim();
                $('#operatorName').val(name);
                $('#branchName').val('总部仓库');
                qm_checkwarehouse.getPageCount();

                break;
            case 'record':
                //盘点记录详情进来的
                $('#but2').remove();
                $('#but3').remove();
                qm_checkwarehouse.recordCheck();
                break;
            case 'branch':
                //分支盘点
                $('#third-li').remove();
                $('#but1').remove();
                var name = $('#userName', parent.document).text().trim();
                $('#operatorName').val(name).attr('name', parent.document.getElementById('userName').getAttribute('name'));
               $('#branchName').val(unescape(urlParams.split('&')[1].split('=')[1]));
                qm_checkwarehouse.getPageCount();
                break;
            default:

                break;
        }
    },
    getPageCount: function ()
    {
        //获取
        var url ='';
        var params = {};
         if (urlParams.split('=')[0]=='branch'){
             url += path + '/s/listBranchGoods.action';//销售点库存
             params['branchId'] = urlParams.split('&')[0].split('=')[1];
         }else {
             url += path + '/s/getFirstRepertory.action';//所有的
         }
        params['pageNum'] = '1';
        params['pageSize'] = '10';
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
                    qm_checkwarehouse.getData(pageCountNum)
                }
            }
        })
    },

    getData: function (pageCountNum)
    {
        var url ='';
        var params = {};
        if (urlParams.split('=')[0]=='branch'){
            url += path + '/s/listBranchGoods.action';//销售点库存
            params['branchId'] = urlParams.split('&')[0].split('=')[1];
            console.log('111')
        }else {
            url += path + '/s/getFirstRepertory.action';//所有的
            console.log('222')

        }
        params['pageNum'] = pageCountNum + '';
        params['pageSize'] = '10';
        console.log(params, '数据')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
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
                            '<div class="list-td4-3"><div class="list-input list-input-left" onclick="qm_checkwarehouse.buildLeft(this)" onmouseleave="qm_checkwarehouse.removeBuild(this)"></div></div>' +
                            '<div class="list-td4-3"><input onkeyup="indenxlogin.inputVal(this)" contentEditable="indenxlogin.inputVal(this)" onblur="indenxlogin.inputVal(this)"></div>' +
                            '<div class="list-td4-3"><div class="list-input list-input-right" onclick="qm_checkwarehouse.buildRight(this)" onmouseleave="qm_checkwarehouse.removeBuild(this)"></div></div>' +
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
        var titletext = '提示';
        var conttext = '是否提交盘点单';
        var leftbuttext = '是';
        var fnleft = 'qm_checkwarehouse.submitData()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    submitData: function ()
    {
        //提交
        var url = path + '/s/updateRepertory.action';
        var params = {};
        if (urlParams.split('=')[0] == 'branch')
            params['branchId'] = urlParams.split('&')[0].split('=')[1];
        else
            params['branchId'] = urlParams.split('=')[1];
        params['branchName'] = $.trim($('#branchName').val());
        params['recordRemark'] = $.trim($('#textareaText').val());
        params['goodsInfo'] = JSON.stringify(qm_checkwarehouse.eachData());
        console.log(params)

        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                qm_checkwarehouse.succeedHint();
            }
        })
    },
    eachData: function ()
    {
        var jsonarr = [];
        $('#ul-table li').find('input').each(function ()
        {
            if (!myjs.isNull($(this).val()) && !myjs.isNull($(this).parents('.list-td4-3').prev().find('.list-input').text()) && !myjs.isNull($(this).parents('.list-td4-3').next().find('.list-input').text()))
            {
                var json = {
                    "goodsId": $(this).parents('.list-tr').attr('id').trim(),
                    'goodsName': $(this).parents('.list-tr').find('.list-td2').text(),
                    'standardId': $(this).parents('.list-tr').find('.list-td4-1').attr('id').trim(),
                    'standardName': $(this).parents('.list-tr').find('.list-td4-1').text(),
                    'recordType': $(this).parents('.list-td4-3').prev().find('.list-input').attr('name'),
                    'standardCount': $(this).val(),
                    'recordReason': $(this).parents('.list-td4-3').next().find('.list-input').text()

                };
                jsonarr.push(json);
            }
        })
        return jsonarr;
    },
    succeedHint: function ()
    {
        var titletext = '提示';
        var conttext = '提交进账单成功';
        var fntext = '是';
        var fn = 'javascript:history.back(-1)';
        indenxlogin.Errorpopone(titletext, conttext, fn, fntext)
    },
    //查看
    recordCheck: function ()
    {
        var url = path + '/s/getRepertoryRecord.action';
        var params = {};
        params['recordId'] = urlParams.split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;
            var recordList = data.recordList;

            console.log(data, '解析')
            if (state == '1')
            {
                $('#operatorName').val(data.operatorName);
                $('#branchName').val(data.branchName);
                $('#textareaText').val(data.recordRemark);
                $('#recordCode').val(data.recordCode);
                $('#textareaText').attr('disabled', 'disabled')
                var item = "";
                for (var i = 0; i < recordList.length; i++)
                {
                    item += '<li class="list-tr" id="' + recordList[i]["goodsId"] + '">' +
                        '<div class="list-td1">' + recordList[i]["goodsCode"] + '</div>' +
                        '<div class="list-td2">' + recordList[i]["goodsName"] + '</div>' +
                        '<div class="list-td3">' + recordList[i]["goodsType"] + '</div>' +
                        '<div class="list-td4">' +
                        '<div class="list-td4-box" >' +
                        '<div class="list-td4-1" >' + recordList[i]["standardName"] + '</div>' +
                        '<div class="list-td4-2">' + recordList[i]["currentCount"] + '</div>' +
                        '<div class="list-td4-3"><div class="list-input list-input-left">' + (recordList[i]["recordType"] == '1' ? '增加' : '扣除') + '</div></div>' +
                        '<div class="list-td4-3"><input value="' + recordList[i]["standardCount"] + '" readonly></div>' +
                        '<div class="list-td4-3"><div class="list-input list-input-right" >' + recordList[i]["recordReason"] + '</div></div>' +
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

    buildLeftData: function (item, event)
    {

        $(item).parents('.list-input').text($(item).text()).attr('name', $(item).attr('name'));
        qm_checkwarehouse.removeBuild()
        event.stopPropagation()
    },
    removeBuild: function (item)
    {
        $(item).find('.list-L-operation').remove();
        console.log('111')
    },
    buildLeft: function (item)
    {
        $(item).parents('.list-tr').siblings().find('.list-L-operation').remove();
        var $item = '<ul class="list-L-operation">' +
            '<li onclick="qm_checkwarehouse.buildLeftData(this,event)" name="1">增加</li>' +
            '<li onclick="qm_checkwarehouse.buildLeftData(this,event)" name="2">减少</li>' +
            '</ul>';
        $(item).append($item)
        if ($('#ul-table').find('.list-tr').length >= '10')
        {
            if ($(item).parents('.list-tr').nextAll().length <= '2')
            {
                $(item).find('.list-L-operation').css('top', '-61px')
            }
        }
    },
    buildRight: function (item)
    {
        var $item = '<ul class="list-L-operation">' +
            '<li onclick="qm_checkwarehouse.buildLeftData(this,event)">正常处理</li>' +
            '<li onclick="qm_checkwarehouse.buildLeftData(this,event)">废旧处理</li>' +
            '<li onclick="qm_checkwarehouse.buildLeftData(this,event)">录入错误</li>' +
            '</ul>';
        $(item).append($item)
        if ($('#ul-table').find('.list-tr').length >= '10')
        {
            if ($(item).parents('.list-tr').nextAll().length <= '2')
            {
                $(item).find('.list-L-operation').css('top', '-92px')
            }
        }
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

}