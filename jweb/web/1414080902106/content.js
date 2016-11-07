window.onload = function(){
	var title = $("#title").val();
	if(title == "")
		showTip();
	else
		hideTip();
};

function hideTip(){
	$("#title-tip").hide();
}
function showTip(){
	$("#title-tip").show();				
}
function onTip(){
	hideTip();
	$("#title").focus();
}
function outTitle(){
	var title = $("#title").val();
	if(title == "")
		showTip();
}