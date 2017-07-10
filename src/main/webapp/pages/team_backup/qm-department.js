var qm_department = {
    init:function ()
    {
        qm_department.findDepartmentDetail();
    },

    findDepartmentDetail:function ()
    {
        var url = path + "/s/findDepartmentDetail.action";
        var params = {};

        if(departmentId == Constant.DEPARTMENT_MANAGER)
            params["departmentType"] = departmentId;
        else
            params["teamDepartmentId"] = departmentId;

        myjs.ajax_post(url,params,function (data)
        {
            console.log(data);
        });

    }
};