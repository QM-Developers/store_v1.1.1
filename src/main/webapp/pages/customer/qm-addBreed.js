/**
 * Created by Administrator on 2017/9/4.
 */
var qm_addBreed = {
    inint: function ()
    {
        console.log(urlParams, '添加养殖')
        var urltype = urlParams.split('=')[0];
        switch (urltype){
            //合作社
            case 'siteid':
                $('#removeData').css('display','none');
                $('#compileData').css('display','none');
                break;

            case 'cdxqfrom':
                $('#submitData').css('display','none');
                break;
            //    个人
            case 'grsiteid':
                $('#removeData').css('display','none');
                $('#compileData').css('display','none');
                break;
            case 'graddyz':
                $('#removeData').css('display','none');
                $('#compileData').css('display','none');
                break;
            case 'grfrom':
                $('#submitData').css('display','none');
                break;
            case 'rBreedMessage':
                $('#submitData').css('display','none');
                break;
            case 'rgrbreed':
                $('#submitData').css('display','none');
                break;

        }

    },

    submitData: function ()
    {
        var url = path + '/s/saveUserBreed.action';
        var params = {};
        params['userPlaceId'] = urlParams.split('&')[0].split('=')[1];
        params['breedCategory'] = $.trim($('#breedCategory').find("option:selected").text());
        params['breedVariety'] = $.trim($('#breedVariety').find("option:selected").text());
        params['breedType'] = $.trim($('#breedType').find("option:selected").text());
        var selval = $('#breedType').val();
        console.log(selval, '添加的类型');
        switch (selval)
        {
            case 'type1':
                params['femaleNum'] = $.trim($('#femaleNum').val());
                params['maleNum'] = $.trim($('#maleNum').val());
                params['obstetricTableNum'] = $.trim($('#obstetricTableNum').val());
                params['shedNum'] = $.trim($('#shedNum').val());
                params['emptyShedNum'] = $.trim($('#emptyShedNum').val());
                params['competitiveBrand'] = $.trim($('#competitiveBrand').val());
                params['breedScale'] = $.trim($('#breedScale').val());
                break;
            case 'type2':
                params['femaleNum'] = $.trim($('#femaleNum').val());
                params['maleNum'] = $.trim($('#maleNum').val());
                params['obstetricTableNum'] = $.trim($('#obstetricTableNum').val());
                params['competitiveBrand'] = $.trim($('#competitiveBrand').val());
                params['breedScale'] = $.trim($('#breedScale').val());
                break;
            case 'type3':
                params['livestockNum'] = $.trim($('#livestockNum').val());
                params['shedNum'] = $.trim($('#shedNum').val());
                params['emptyShedNum'] = $.trim($('#emptyShedNum').val());
                params['competitiveBrand'] = $.trim($('#competitiveBrand').val());
                params['breedScale'] = $.trim($('#breedScale').val());
                break;
            default:

                break;
        }
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            if (state == '1')
            {
                qm_addBreed.gobock();
            }
        })
    },

    removeData:function ()
    {

    },
    gobock: function ()
    {
        var urltype = urlParams.split('=')[0];
        switch (urltype){
            case'cdxqfrom':
                //详情过来的返回
                location.href = "qm-sitemessageone.jsp?yzbock=1";
                break;
            case'siteid':
            //合作社添加过来的返回
            location.href = "qm-sitemessageone.jsp?addbock=2";
                break;
            case'grsiteid':
                //合作社添加过来的返回
                location.href = "qm-sitemessageone.jsp?graddxqbock=2";
                break;
            case'graddyz':
                //个人添加过来的返回
                location.href = "qm-sitemessageone.jsp?graddxqbock=3";
                break;
            case'grfrom':
                //个人添加过来的返回
                location.href = "qm-sitemessageone.jsp?graddxqbock=4";
                break;
            case'rBreedMessage':
                //资源合作社
                location.href = "qm-sitemessageone.jsp?rMessageGo=5";
                break;
            case'rgrbreed':
                //资源个体
                location.href = "qm-sitemessageone.jsp?rgrBreedGo=5";
                break;

        }

    },
}