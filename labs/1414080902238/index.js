$(document).ready(function(){
	$("#save").click(function(){
		$.ajax({
			  url: "success.json"
			}).done(function(data) {
			  if ( console && console.log ) {
			      console.dir(data);
			      alert(data.msg);
			    }
			});
			  event.preventDefault();
			});});