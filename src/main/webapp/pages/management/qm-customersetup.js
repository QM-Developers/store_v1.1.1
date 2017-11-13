/**
 * Created by Administrator on 2017/10/24.
 */
var qm_customersetup = {
    inint: function ()
    {
        qm_customersetup.getConfirmChecked();
        qm_customersetup.eachBut()

    },
    checkedAndUnchecked: function (item)
    {
        if ($(item).hasClass('warehouse-checked'))
        {
            $(item).removeClass('warehouse-checked').addClass('warehouse-unchecked');
        } else
        {
            $(item).removeClass('warehouse-unchecked').addClass('warehouse-checked');
            $(item).parents('.button-box').siblings().find('a').removeClass('warehouse-checked').addClass('warehouse-unchecked');

        }
    },
    getConfirmChecked: function ()
    {
        console.log('111111')
        var url = path + '/s/listRepertoryLevel.action';
        var params = {};
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '获取数据')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                for (var i = 0; i < data.length; i++)
                {
                    $('.border-box').each(function ()
                    {
                        if ($(this).attr('id') == data[i].customerType)
                        {
                            if (data[i].repertoryType == '1')
                            {
                                $(this).find('.type1').find('.warehouse-1').removeClass('warehouse-unchecked').addClass('warehouse-checked');
                            } else if (data[i].repertoryType == '2')
                            {
                                $(this).find('.type2').find('.warehouse-1').removeClass('warehouse-unchecked').addClass('warehouse-checked');
                            } else
                            {

                            }
                            ;
                            $(this).find('.warehouse-but').remove();
                            $(this).find('.button-box').find('.warehouse-1').removeAttr('onclick', 'qm_customersetup.checkedAndUnchecked(this)');
                        }
                    })
                }
            }
        })
    },
    submitHint: function (item)
    {
        //提交
        $item = $(item);
        var checkedItem = $(item).parents('.border-box').find('.warehouse-1');
        if (checkedItem.hasClass('warehouse-checked'))
        {
            var titletext = '提示';
            var conttext = '客户权限设定后无法更改,是否确认设定 ';
            var leftbuttext = '是';
            var fnleft = 'qm_customersetup.submitType()';
            var rightbuttext = '否';
            var fnright = 'indenxlogin.removepop()';
            indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
        }
    },
    submitType: function ()
    {
        var url = path + '/s/saveRepertoryLevel.action';
        var params = {};
        var repertoryType = $item.parents('.border-box').find('.warehouse-checked').attr('name');
        params['customerType'] = $item.parents('.border-box').attr('id');
        params['repertoryType'] = repertoryType;
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                $item.parents('.border-box').find('.warehouse-1').removeAttr('onclick', 'qm_customersetup.checkedAndUnchecked(this)');
                $item.remove();
                indenxlogin.removepop();
            }
        })
    },
    eachBut:function ()
    {
      $('.am-u-lg-9 ').each(function ()
      {
          if($(this).find('.type1').find('a').hasClass('warehouse-checked') || $(this).find('.type2').find('a').hasClass('warehouse-checked')){
              $(this).find('.warehouse-but').css('display','inline-block')
              console.log('1122')
          }else {
              $(this).find('.warehouse-but').remove();
              console.log('1333')
          }
      })
    },

}