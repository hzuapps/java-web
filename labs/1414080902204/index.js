jQuery(document).ready(function() {
	$("#ss").click(function(event) {
		alert("你点击了注册按钮");	
		$.ajax({
			url: "success.json"
		}).done(function(data) {
			if (console&&console.log) {
				console.dir(data);
				alert(data.msg);
			}
		})	
	});
});
