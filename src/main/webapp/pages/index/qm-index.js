var status = 1;
















function getStyleAttr(obj, attr) {
	//最终样式
	var styleObj = obj.currentStyle || getComputedStyle(obj, null);
	return styleObj[attr];
}

function switchSysBar(item) {
	
	var switchPoint = document.getElementById("switchPoint");//获取小按钮
	var frmTitle = document.getElementById("frmTitle");//获取iframe	
	

	if(1 == window.status) {
		window.status = 0;		

		frmTitle.style.display = "none"
	} else {
		window.status = 1;		

		frmTitle.style.display = ""
	}

}
function iFrameHeight() {

	var ifm = document.getElementById("iframepage");
	var subWeb = document.frames ? document.frames["iframepage"].document :
		ifm.contentDocument;
	if(ifm != null && subWeb != null) {
		ifm.height = subWeb.body.scrollHeight;
	}
}



  Menu = function(){
	$(".client").css("display","block")
}

//Menuli = function(item) {
//
////	$(item).addClass("add-parent");
////	var addli = "<div class='menu-div'>";
////	for(var i = 0; i < 4; i++) {
////		addli += '<div class=menu-lichild onmouseenter=lichild(this) >xxx部门</div>';
////	}
////	addli += "</div>";
////	$(item).append(addli);
////	$(item).siblings().removeClass("add-parent").find(".menu-div").remove()
//$(".menu-div").css("display","block")
//}
//MenuUl = function(item) {
//
//	$(item).find(".menu-li").removeClass("add-parent").find(".menu-div").remove()
//}
//
//lichild=function(item){
//	$(item).addClass("menu-childli");
//	$(item).siblings().removeClass("menu-childli")
//	
//}

