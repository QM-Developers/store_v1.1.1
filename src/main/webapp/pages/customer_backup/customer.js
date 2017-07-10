var customerJS =
    {
        findCustomerByGroup: function ()
        {
            var url = path + "/s/findCustomerByGroup.action";
            myjs.ajax_post(url, {'customerGroupId': groupId}, function (data)
            {
                data = data.result;

                $("#page-title").text(data[0]['customerGroupName']);

                var item = "";
                for (var i = 0; i < data.length; i++)
                    item += '<div class="sort_list" onclick="customerJS.findCustomerInfo(\'' + data[i]["userPhone"] + '\')"><div class="num_logo"><img src="' + (path + data[i]["userImg"]) + '"/></div><div class="num_name">' + data[i]["userName"] + '</div></div>';

                $("#sort_box").append(item);
                initials();
            });
        },

        findCustomerInfo: function (userPhone)
        {
            var url = path + "/s/findCustomerInfo.action";

            myjs.ajax_post(url, {'userPhone': userPhone}, function (data)
            {
                data = data.result;

                $("#userName").val(data['userName']);
                $("#userPhone").val(data['userPhone']);
                $("#userBirthday").val(new Date(data['userBirthday']).format("yyyy-MM-dd"));
                $("#userAddress").val(data['userAddress']);

                $("input[name='userSex'][value='" + data['userSex'] + "']").attr("checked", true);

                var arr = data['userArea'].split(' ');
                opt0 = arr;
                _init_area();

                customerJS.findPlacesTitle(userPhone);
            });
        },

        findPlacesTitle: function (userPhone)
        {
            var url = path + "/s/findPlacesTitle.action";

            myjs.ajax_post(url, {'userPhone': userPhone}, function (data)
            {
                data = data.result;

                var item = "";

                for (var i = 0; i < data.length; i++)
                    item += '<li><a href="information.jsp?info&' + data[i]["userPlaceId"] + "&" + groupId + '">' + data[i]["userPlaceName"] + '</a></li>';

                $("#place-title").append(item);
            });
        },

        toBreedInfo: function ()
        {
            var userPhone = $("#userPhone").val();

            if (myjs.isNull(userPhone))
            {
                alert("请选择用户");
                return;
            }

            self.location.href = "information.jsp?add&" + userPhone + "&" + groupId;
        },

        modifyInfo: function ()
        {
            var $Resetbtn = $(".resetbtn");
            var $select_s = $("select");

            if ($Resetbtn.hasClass("sign_a"))
            {
                $('.am-u-sm-10 input').attr("disabled", false);
                $select_s.attr("disabled", false);
                $('.am-u-sm-10 input').css({"border": "1px solid #990000"});
                $Resetbtn.removeClass("sign_a");
                $Resetbtn.addClass("sign_b");
                $Resetbtn.text("确认修改")
            } else
            {
                $select_s.attr("disabled", true);
                $('.am-u-sm-10 input').attr("disabled", true);
                $('.am-u-sm-10 input').css({"border": "1px solid #AFEEEE"});
                $Resetbtn.removeClass("sign_b");
                $Resetbtn.addClass("sign_a");
                $Resetbtn.text("修改信息");
            }
        },

    };


$(function ()
{
    //控制个人信息input
    var $Resetbtn = $(".resetbtn");
    var $select_s = $("select");
    $('.am-u-sm-10 input').attr("disabled", true);
    $select_s.attr("disabled", true);

    //好友点击事件
//	$(".sort_list").each(function(){
//		$(this).click(function(){
//		})
//	})
//	


    var Initials = $('.initials');
    var LetterBox = $('#letter');
    Initials.find('ul').append('<li>A</li><li>B</li><li>C</li><li>D</li><li>E</li><li>F</li><li>G</li><li>H</li><li>I</li><li>J</li><li>K</li><li>L</li><li>M</li><li>N</li><li>O</li><li>P</li><li>Q</li><li>R</li><li>S</li><li>T</li><li>U</li><li>V</li><li>W</li><li>X</li><li>Y</li><li>Z</li><li>#</li>');
    // initials();

    $(".initials ul li").click(function ()
    {
        var _this = $(this);
        var LetterHtml = _this.html();
        LetterBox.html(LetterHtml).fadeIn();

        Initials.css('background', 'rgba(145,145,145,0.6)');

        setTimeout(function ()
        {
            Initials.css('background', 'rgba(145,145,145,0)');
            LetterBox.fadeOut();
        }, 1000);

        var _index = _this.index()
        if (_index == 0)
        {
            $('.sort_box').animate({scrollTop: '0px'}, 300);//点击第一个滚到顶部
        } else if (_index == 27)
        {
            var DefaultTop = $('#default').position().top;
            $('.sort_box').animate({scrollTop: DefaultTop + 'px'}, 300);//点击最后一个滚到#号
        } else
        {
            var letter = _this.text();
            if ($('#' + letter).length > 0)
            {
                var LetterTop = $('#' + letter).position().top;
                $('.sort_box').animate({scrollTop: LetterTop + 'px'}, 300);
            }
        }
    })

    var windowHeight = $(".sort_box").height();
    var InitHeight = windowHeight;
    Initials.height(InitHeight);
    var LiHeight = InitHeight / 28;
    Initials.find('li').height(LiHeight);


    var $seek_friend = $("#seek_friend");
    $seek_friend.bind('input propertychange', function ()
    {

        var value = $(this).val();
        if (value)
        {
            $("#listseek").fadeIn();

        } else
        {
            $("#listseek").fadeOut();
        }
    })

})

function initials()
{//公众号排序
    var SortList = $(".sort_list");
    var SortBox = $(".sort_box");
    SortList.sort(asc_sort).appendTo('.sort_box');//按首字母排序
    function asc_sort(a, b)
    {
        return makePy($(b).find('.num_name').text().charAt(0))[0].toUpperCase() < makePy($(a).find('.num_name').text().charAt(0))[0].toUpperCase() ? 1 : -1;
    }

    var initials = [];
    var num = 0;
    SortList.each(function (i)
    {
        var initial = makePy($(this).find('.num_name').text().charAt(0))[0].toUpperCase();
        if (initial >= 'A' && initial <= 'Z')
        {
            if (initials.indexOf(initial) === -1)
                initials.push(initial);
        } else
        {
            num++;
        }

    });

    $.each(initials, function (index, value)
    {//添加首字母标签
        SortBox.append('<div class="sort_letter" id="' + value + '">' + value + '</div>');
    });
    if (num != 0)
    {
        SortBox.append('<div class="sort_letter" id="default">#</div>');
    }

    for (var i = 0; i < SortList.length; i++)
    {//插入到对应的首字母后面
        var letter = makePy(SortList.eq(i).find('.num_name').text().charAt(0))[0].toUpperCase();
        switch (letter)
        {
            case "A":
                $('#A').after(SortList.eq(i));
                break;
            case "B":
                $('#B').after(SortList.eq(i));
                break;
            case "C":
                $('#C').after(SortList.eq(i));
                break;
            case "D":
                $('#D').after(SortList.eq(i));
                break;
            case "E":
                $('#E').after(SortList.eq(i));
                break;
            case "F":
                $('#F').after(SortList.eq(i));
                break;
            case "G":
                $('#G').after(SortList.eq(i));
                break;
            case "H":
                $('#H').after(SortList.eq(i));
                break;
            case "I":
                $('#I').after(SortList.eq(i));
                break;
            case "J":
                $('#J').after(SortList.eq(i));
                break;
            case "K":
                $('#K').after(SortList.eq(i));
                break;
            case "L":
                $('#L').after(SortList.eq(i));
                break;
            case "M":
                $('#M').after(SortList.eq(i));
                break;
            case "N":
                $('#N').after(SortList.eq(i));
                break;
            case "O":
                $('#O').after(SortList.eq(i));
                break;
            case "P":
                $('#P').after(SortList.eq(i));
                break;
            case "Q":
                $('#Q').after(SortList.eq(i));
                break;
            case "R":
                $('#R').after(SortList.eq(i));
                break;
            case "S":
                $('#S').after(SortList.eq(i));
                break;
            case "T":
                $('#T').after(SortList.eq(i));
                break;
            case "U":
                $('#U').after(SortList.eq(i));
                break;
            case "V":
                $('#V').after(SortList.eq(i));
                break;
            case "W":
                $('#W').after(SortList.eq(i));
                break;
            case "X":
                $('#X').after(SortList.eq(i));
                break;
            case "Y":
                $('#Y').after(SortList.eq(i));
                break;
            case "Z":
                $('#Z').after(SortList.eq(i));
                break;
            default:
                $('#default').after(SortList.eq(i));
                break;
        }
    }
    ;
}
