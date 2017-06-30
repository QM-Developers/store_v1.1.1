var dragMap = {
    init: function (container, hint, success, fail)
    {
        AMapUI.loadUI(['misc/PositionPicker'], function (PositionPicker)
        {
            var map = new AMap.Map(container, {
                zoom: 15,
                scrollWheel: false
            });
            var positionPicker = new PositionPicker({
                mode: 'dragMap',
                map: map
            });

            positionPicker.on('success', success);
            positionPicker.on('fail', fail);
            positionPicker.setMode("dragMap");
            positionPicker.start(map.getBounds().getSouthWest());

            map.addControl(new AMap.ToolBar({
                liteStyle: true
            }));

            var autoOptions = {
                input: hint
            };
            var auto = new AMap.Autocomplete(autoOptions);
            var placeSearch = new AMap.PlaceSearch({
                map: map
            });  //构造地点查询类
            AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
            function select(e)
            {
                placeSearch.setCity(e.poi.adcode);
                placeSearch.search(e.poi.name);  //关键字查询查询
            }
        });
    }
};