$(document).ready(function(){
	  $("form").submit(function(e){
	  $.ajax({
			  url: "Style/success.json",
			}).done(function(data) {
			  if ( console && console.log ) {
			      console.dir(data);
			      alert(data.msg);
			    }
		   });
	  });
});

 

