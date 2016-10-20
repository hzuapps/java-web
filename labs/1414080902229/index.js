function submitClick(){
  		var xuehao =$("#xuehao").val();
  		var password =$("#password").val()
  		if(xuehao==null||xuehao==undefined||xuehao==''){
  			alert("account is't null");
  			return ;
  		}
  		if(password==null||password==undefined||password==''){
  			alert("password is't null");
  			return ;
  		}
  		$.getJSON('success.json', function(data){
   			alert(data.msg);
   		});

  	}