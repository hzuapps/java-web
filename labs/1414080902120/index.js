
$( "#target" ).submit(function( event ) {
	alert( "Handler for .submit() called." );
	event.preventDefault();
});
//原本的jq库好像没反应然后就换了一个饿2.1.4的库，用另一种ajax响应
function JQJSONRequest() {
	$.ajax({
		url : "success.json",
		complete : function(data) {
		    console.log(data);
		    if (data.readyState == 4 && data.status == 200) {
		        var str = "",
		            resp = JSON.parse(data.responseText);
		        str = "Result :";
		        for (var i in resp) {
		            str += "<br/>" +  i + "　　" + resp[i]
		        }
		        $("#result").html(str);
		    }
		}
	});
}