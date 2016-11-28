var checker;
window.onload = function() {
  registerBtn.setAttribute("class", "btn btn-sm btn-success");
  resetBtn.setAttribute("class", "btn btn-sm btn-danger");
  registerBtn.style.display = "none";
  registerBtn.onclick = function() {register();};
  resetBtn.onclick = function() {location.reload(true);};
  password.onkeyup = function() {checkPassword2();};
  password2.onkeyup = function() {checkPassword2();};
};

function register() {
	var usn = username.value;
	var pwd = password.value;
	var nam = Name.value;
	sendXHR("register", "username=" + usn + "&password=" + pwd + "&name=" + nam, "post", function() {
		if (XHR.readyState == 4 && XHR.status == 200) {
			var info = XHR.responseText;
			if (info == "success")
				location.href = "./";
			else {
			  tip.innerHTML = info;
			}
		}
	});
}

function checkPassword2() {
  var pwd = password.value;
  var pwd2 = password2.value;
  if (pwd != pwd2) {
    pwdTip.innerHTML = "前后两次输入的密码不一致！";
    password2.style.borderColor = "red";
    registerBtn.style.display = "none";
  } else {
    pwdTip.innerHTML = "";
    password2.style.borderColor = "";
    registerBtn.style.display = "";
  }
}
