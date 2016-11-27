window.onload = function() {
  loginBtn.setAttribute("class", "btn btn-sm btn-primary");
  registerBtn.setAttribute("class", "btn btn-sm btn-success");
  loginBtn.onclick = function() {login();};
  registerBtn.onclick = function() {gotoRegister();};
};

function login() {
  var usn = username.value;
  var pwd = password.value;
  sendXHR("login", "username=" + usn + "&password=" + pwd, "post", function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
      var info = XHR.responseText;
      if (info == "success")
        //登录成功，跳转到主页
        location.href = "./home.jsp";
      else
        //登录失败，显示错误信息
        tip.innerHTML = info;
    }
  });
}

function gotoRegister() {
  location.href = "./register.jsp";
}
