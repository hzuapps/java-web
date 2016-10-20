jQuery(document).ready(function(){
	$( ".btn" ).click(function( event ) {
		if (confirm("Are you sure to submit it?")) {  
            alert("Login Was Successful");  
        }  
        else {  
            alert("Login Was Failed");  
        }  
  
		$.ajax({
			url: "success.json"
		}).done(function(data) {
			if ( console && console.log ) {
				console.dir(data);
				alert(data.msg);
			}
		});
		event.preventDefault();
	});
});
