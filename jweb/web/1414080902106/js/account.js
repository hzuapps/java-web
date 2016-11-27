window.onload = function() {
  home.setAttribute("class", home.getAttribute("class") + " btn btn-sm btn-success glyphicon glyphicon-circle-arrow-left");
  remove.setAttribute("class", remove.getAttribute("class") + " btn btn-sm btn-danger glyphicon glyphicon-trash");
};
function gotoHome() {
  location.href = "./home.jsp";
}
function removeAccount(username) {
  createXHR();
  sendXHR("removeAccount", "username=" + username, "post", function() {
    if(XHR.readyState == 4 && XHR.status == 200) {
      var info = XHR.responseText;
      if (info == "success")
        location.href = "./";
      else
        alert(info);
    }
  });
}
function beObvious(obj) {
  obj.style = "background-color: rgba(0,0,0,.2)";
}
function beNormal(obj) {
  obj.style = "";
}
