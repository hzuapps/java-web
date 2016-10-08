$(function(){
	
$( "#fm" ).submit(function( event ) {
        
alert( "cc" );alert(result msg);

$.ajax({
  url: "success.json"
}).done(function(data) {
  if ( console && console.log ) {
      console.dir(data);
      alert(data.msg);
    }
});
    
});

})