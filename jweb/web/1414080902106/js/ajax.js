var XHR = null;
function createXHR() {
	try {
		XHR = new XMLHttpRequest();
	} catch (e) {
		var xhrs = new Vector (
				"Msxml2.XMLHTTP.3.0",
				"Msxml2.XMLHTTP.4.0",
				"Msxml2.XMLHTTP.5.0",
				"Msxml2.XMLHTTP.6.0",
				"Msxml2.XMLHTTP",
				"Microsoft.XMLHTTP"
		);
		for (var i = 0; i < xhrs.length; i++) {
			try {
				XHR = new ActiveXObject(xhrs[i]);
				if (XHR != null)
					break;
			} catch (e) {}
		}
		if (XHR == null)
			alter("Can't create Ajax Object!");
	}
}
function sendXHR(url, param, method, operation) {
	createXHR();
	if (XHR == null)
		return false;
	//设置响应方法
	XHR.onreadystatechange = operation;
	if (method == "get") {
		//打开连接
		XHR.open(method, url + "?" + param);
		//发送请求，此时不用发送参数
		XHR.send(null);
	} else if (method == "post") {
		//打开连接
		XHR.open(method, url);
		//设置请求首部
		XHR.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		XHR.send(param);
	}
}