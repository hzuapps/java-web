
$(function(){

    $( "#target" ).submit(function( event ){
		$.ajax({ 
		url: "yes.json",
		success: function(data){
			alert(data.msg);
		}
	  });
	});
});