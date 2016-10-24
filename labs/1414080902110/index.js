jQuery(document).ready(function() {
	$(".btn").click(function(event) {
		alert("点击了登陆按钮！");	
		$.ajax({
			url: "success.json"
		}).done(function(data) {
			if (console&&console.log) {
				var account = $('#account').value;
				var password = $('#password').value;
				console.dir(data);
				alert(data.msg);
			}
		})	
	});
});
