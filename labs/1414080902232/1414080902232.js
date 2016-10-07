window.onload = function(){
$("#sub").click(function(event){
	$.ajax({
		type: "post", 
                                        url: "1414080902232.json", 
                                    //    data:{},
                                        dataType: "json", 
                                        success: function (data) { 
                                        	//   alert("yes");
                                                alert(data.msg);
                                                //$("input#showTime").val(data[0].demoData); 
                                        }, 
                                        error: function (XMLHttpRequest, textStatus, errorThrown) { 
                                              alert(XMLHttpRequest.readyState);
                                              //  alert(arguments[2]); 
                                        } 
	})
});
}
