window.onload = function(){
	var t = title.value;
	if(t == "")
		showTip();
	else
		hideTip();
	tip.onclick = function() {onTitle();};
	title.onclick = function() {onTitle();};
	title.onblur = function() {outTitle();};
  home.setAttribute("class", home.getAttribute("class") + " btn btn-sm btn-success glyphicon glyphicon-circle-arrow-left");
  Do.setAttribute("class", Do.getAttribute("class") + " btn btn-sm btn-success");
};
//隐藏提示
function hideTip(){
	tip.style.display = "none";
}
//显示提示
function showTip(){
	tip.style.display = "";	
}
//单击/*提示或*/标题输入框
function onTitle(){
	hideTip();
	title.focus();
}
//标题输入框失去焦点
function outTitle(){
	var t = title.value;
	if(t == "")
		showTip();
}
//发表帖子
function newPosts() {
  var t = title.value;
  if (t == "")
    onTitle();
  else {
    createXHR();
    sendXHR("newPosts", "title=" + t + "&text=" + text.value, "post", function() {
      if (XHR.readyState == 4 && XHR.status == 200) {
        var info = XHR.responseText;
        if (info == "success")
          location.href = "./home.jsp";
        else
          alert(info);
      }
    });
  }
}
function gotoHome() {
  location.href = "./home.jsp";
}