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



<script type="text/javascript">
function e(){
var name=document.forms[0].InputName.value;
if(name.length<=0)alter("而当事人")；
else document.forms[0].Button();
}
</script>

   
 