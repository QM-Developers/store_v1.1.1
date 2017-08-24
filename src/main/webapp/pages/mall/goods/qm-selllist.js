var qm_selllist = {
    init: function ()
    {
        var intnum = $('#shownum').find('.paging-checked').text();
        // console.log(intnum)
        qm_selllist.findDepartment();
        qm_selllist.initMap();
        qm_selllist.getlist(1, intnum);
        qm_selllist.closemodal();

    },

    findDepartment: function ()
    {
        // console.log('2222')
        $('#popup-title-text').text('添加销售点');

        var url = path + "/s/findDepartmentList" + Constant.URL_SUFFIX;
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["departmentId"] + '">' + data[i]["departmentName"] + '</option>';
            // $("#department-list");
            $("#department-list").empty().append(item);
            qm_selllist.findMemberList(data[0]["departmentId"]);
        });
    },

    findMemberList: function (did, phone)
    {
        var url = path + "/s/findMemberList" + Constant.URL_SUFFIX;
        var params = {};

        params["departmentId"] = did;

        myjs.ajax_post(url, params, function (data)
        {

            data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["userPhone"] + '" id="' + data[i]["userId"] + '">' + data[i]["userName"] + '</option>';
            $("#member-list").empty().append(item);
            $("#member-list option").each(function (i)
            {
                if ($(this).val() == phone)
                    $(this).attr("selected", "selected");
            });
            phone = myjs.isNull(phone) ? data[0]["userPhone"] : phone;
            qm_selllist.findMemberPhone(phone);
        });
    },

    findMemberPhone: function (phone)
    {
        $("#member-phone").val(phone);
    },

    initMap: function ()
    {
        var success = function (rep)
        {
            var location = rep.regeocode.pois[0].location;
            $("#branch-lat-lng").val(location.lat + "," + location.lng);
            $("#branch-area").val(rep.regeocode.pois[0].name);
        };

        var fail = function (rep)
        {
            // console.log(rep);
        };
        dragMap.init("map", "tip", success, fail);
    },

    addBranch: function ()
    {
        var url = path + "/s/addBranch" + Constant.URL_SUFFIX;
        var params = {};
        params["branchName"] = $("#branch-name").val();
        params["branchArea"] = $("#branch-area").val();
        params["departmentId"] = $("#department-list").val();
        params["departmentName"] = $("#department-list option:selected").text();
        params["managerId"] = $("#member-list option:selected").attr("id");
        params["managerName"] = $("#member-list option:selected").text();
        params["managerPhone"] = $("#member-phone").val();
        params["latLng"] = $("#branch-lat-lng").val();

        console.log(params);
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var aid = data.result;
              // console.log(data)
            if (state == '1')
            {
                var  pageSize=$.trim( $('#shownum').find('.paging-checked').text());
                // console.log('这个', pageNum)
                 var pageNum = $.trim($('#pagenumleft').text());
                qm_selllist.addlistli(params.branchName, params.managerName, params.managerPhone, aid);
                $("#branch-name").val('');
                $("#tip").val('');
                qm_selllist.findDepartment();
                qm_selllist.getlist(pageNum, pageSize)
            }
        });
    },
    addlistli: function (branchName,departmentName, managerName, managerPhone, id)
    {//添加销售点
        var  pageSize=$.trim( $('#shownum').find('.paging-checked').text());
        var item = '';
        item += "<li id= " + id + " class=goodslist-list-tr>" +
            "<div>" + branchName + "</div>" +
            "<div>" + departmentName + "</div>" +
            "<div>" + managerName + "</div>" +
            "<div>" + managerPhone + "</div>" +
            "<div class=item4>" +
            "<a data-am-modal={target:'#popup2'} onclick=qm_selllist.modification(this)>编辑 </a>" +
            "<a href=qm-branchlist.html?" + id + ">分配商品 </a>" +
            "<a href=qm-branchgoodslist.html?" + id + ">查看商品 </a>" +
            "<a  onclick=qm_selllist.removeBranch(this)>删除</a>" +
            "</div>" +
            "</li>";

        var lilenggth = $('#poslist li').length;
        if (lilenggth <= pageSize)
        {
            $("#poslist").append(item);
        } else
        {
            $('#popup2').modal('close');
        }

        $('#popup2').modal('close');
    },
    getlist: function (pagenum, pagesize)
    {
        //获取列表
        $('#poslist li').eq(0).nextAll().remove();
        //    $('#poslist').find('li').eq(0).nextAll().remove();
        var url = path + "/s/listBranch.action" + Constant.URL_SUFFIX;
        var params = {};
        params["pageNum"] = pagenum;//页数
        params["pageSize"] = pagesize;//显示数
        myjs.ajax_post(url, params, function (data)
        {
            var pageCount = data.pageCount;
            var state = data.state;
            var data = data.result;
            console.log(data);
            console.log(pageCount);
            if (state == '1')
            {
                $('#pagenumright').html(pageCount);
                for (var i = 0; i < data.length; i++)
                {
                    if (i < pagesize)
                    {
                        qm_selllist.addlistli(data[i].branchName,data[i].departmentName, data[i].managerName, data[i].managerPhone, data[i].branchId);
                    }
                }
            }
        })
    },
    removeBranch: function (item)
    {
        //删除
         self = item;
        var titletext = '提示';
        var conttext = '是否删除这个销售点'
        var leftbuttext = '是';
        var fnleft ='qm_selllist.removeBranchpop()' ;
        var rightbuttext = '否';
        var fnright = 'indenxlogin.ErrorpopRemove(this)';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    removeBranchpop:function ()
    {
        var anum = $(self).parents('li').attr('id');
        var pageNum = $.trim($('#pagenumleft').text());
        var pageSize = $('#shownum').find('.paging-checked').text();
        var url = path + "/s/removeBranch.action" + Constant.URL_SUFFIX;
        var params = {};
        params["branchId"] = $.trim(anum);
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            if (state == '1')
            {
                qm_selllist.getlist(pageNum, pageSize)
            }
        });

      $('.password-box').remove();
    },
    modification: function (item)
    {
        //编辑
        var amendid = $(item).parents('li').attr('id');

        var url = path + "/s/getBranch" + Constant.URL_SUFFIX;
        var params = {};
        params["branchId"] = $.trim(amendid);
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;
            // console.log(state);
            // console.log(data);
            if (state == '1')
            {
                $('#branch-name').val(data.branchName);
                qm_selllist.findMemberList($.trim(data.departmentId), $.trim(data.managerPhone));
                $("#department-list").val($.trim(data.departmentId));
                $('#branch-area').val(data.branchArea);
                $('#popup-title-text').text('编辑销售点');
            }
        })
    },
    closemodal: function ()
    {
        //关闭弹窗重置
        $('#popup2').on('closed.modal.amui', function ()
        {
            console.log('111')
            $("#branch-name").val('');
            $("#tip").val('');
            qm_selllist.findDepartment();
        })
    },
    shownum: function (item)
    {
        //选择显示数量

        $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
        var pageSize =$.trim($(item).text());
        var pageNum = $.trim($('#pagenumleft').text());
        console.log(pageNum)
        var pageCount = $.trim($('#pagenumright').text());
        var pageresult = (pageNum == pageCount)?1:pageNum;
        $('#pagenumleft').html(pageresult);
        console.log(pageresult)
        qm_selllist.getlist(pageresult, pageSize)
    },
    pagenext: function (item)
    {
        //翻页
        var pagetext = $.trim($(item).text());
        console.log(pagetext)
        var pageSizetext = $('#pagenumleft').text();
        var pageCount = $.trim($('#pagenumright').text());
        var pageNum = $('#shownum').find('.paging-checked').text();
        if (pagetext == '下一页')
        {
            if (pageSizetext >= pageCount)
                return;
            var pageSize = Math.ceil((pageSizetext - 0) + 1);
            $('#pagenumleft').html(pageSize);
            console.log(pageSize)
            qm_selllist.getlist(pageSize, pageNum)
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageSize = Math.ceil((pageSizetext - 0) - 1);
            $('#pagenumleft').html(pageSize);
            qm_selllist.getlist(pageSize, pageNum)
        }
    }

};