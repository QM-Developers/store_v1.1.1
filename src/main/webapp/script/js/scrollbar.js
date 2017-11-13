/**
 * Created by Administrator on 2017/10/14.
 */
var scrollbar = {
    scrollBar: function ()
    {
        //滚动条
        var out = document.querySelector(".out")
        var inner = document.querySelector(".inner")
        var scrollbtn = document.querySelector(".scrollbtn")
        var scrollbar = document.querySelector(".scrollbar")
        var innerH = inner.getElementsByTagName('li').length * 42;
        // var innerH = inner.offsetHeight;
        var outH = out.offsetHeight;
        // var scrollbarH = scrollbar.offsetHeight;
        var scrollbarH = 420;
        var bili = innerH / outH;
        var tops = 0;
        var speed = 20;
        console.log(innerH, bili, outH)
        // if(bili<1){
        //     scrollbtn.style.display="none";
        // }

        var scrollbtnH = scrollbarH / bili;
        console.log(scrollbtnH)
        scrollbtn.style.height = scrollbtnH + "px";
        var lenH = scrollbarH - scrollbtnH;
        if (bili < 1)
        {
            scrollbar.style.display = "none";
        } else
        {
            scrollbtn.onclick = function (e)
            {
                var ev = e ? e : window.event;
                if (scrollbtn.stopPropagation)
                {
                    ev.stopPropagation();
                }
                // else
                // {
                //     ev.cancelBubble();
                // }
            }
            scrollbtn.onmousedown = function (e)
            {
                console.log(e, '鼠标位置')
                var ev = e || window.event;
                var lenY = ev.clientY - this.offsetTop;
                if (ev.preventDefault)
                {
                    ev.preventDefault()
                } else
                {
                    ev.returnValue = false;
                }
                document.onmousemove = function (e)
                {
                    var ev = e || window.event;
                    tops = ev.clientY - lenY;
                    if (tops < 0)
                    {
                        tops = 0;
                    }
                    if (tops > lenH)
                    {
                        tops = lenH;
                    }
                    scrollbtn.style.top = tops + "px";
                    var innerT = tops * bili;
                    inner.style.marginTop = -innerT + "px";
                }
                document.onmouseup = function ()
                {
                    document.onmousemove = null;
                    document.onmouseup = null;
                }
            }
            out.onmousewheel = function (event)
            {
                var event = event || window.event;
                if (event.wheelDelta > 0)
                {
                    tops -= speed;
                    setTop()
                } else
                {
                    tops += speed;
                    setTop()
                }
            }
            // mousewheel(out, function ()
            // {
            //     tops -= speed;
            //     setTop()
            // }, function ()
            // {
            //     tops += speed;
            //     setTop()
            // })
            scrollbar.onclick = function (e)
            {
                var ev = e || window.event;
                tops = ev.offsetY;
                setTop()
            }
            document.onkeydown = function (e)
            {
                var ev = e || event;
                if (ev.keyCode == 38)
                {
                    tops -= speed;

                    setTop()
                } else if (ev.keyCode == 40)
                {
                    tops += speed;
                    setTop()
                }
            }

            function setTop()
            {
                if (tops < 0)
                {
                    tops = 0;
                }
                if (tops >= lenH)
                {
                    tops = lenH;
                }
                scrollbtn.style.top = tops + "px";
                inner.style.marginTop = -tops * bili + "px";
            }
        }
    },
}