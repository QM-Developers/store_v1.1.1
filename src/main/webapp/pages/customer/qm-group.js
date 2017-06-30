







$(function(){
	//遮罩显示
//	$("#Prompt-box").css("display", "block");
	//遮罩关闭
	$(".potential-right").click(function(){
		$("#Prompt-box").css("display", "none");
	})
	
	
		$(".qm-team input").attr("disabled","true");
//	    $(".databut").css("display","none");

})


Groupdata_select = function(item){
	$(item).css("border","1px solid #ccc")
	$(item).find(".groupdata_select-ul").css("display","block")
}

PopInput = function(item) {

	$(item).addClass("poptwo-c-lia1")
	$(item).siblings().removeClass("poptwo-c-lia1")

}


 

