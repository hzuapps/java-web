function hideTip(){
	$("#title-tip").hide();
}
function displayTip(){
	$("#title-tip").show();				
}
function onTip(){
	hideTip();
	$("#title").focus();
}
function outTitle(){
	var title = $("#title").val();
	if(title == "")
		displayTip();
}
function Submit(){
	var title = $("#title").val();
	var context = $("#context").val();
	alert(title + "\n-------------------------\n" + context);
}