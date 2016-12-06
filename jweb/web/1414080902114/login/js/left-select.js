	       function show(Str) {
			if(document.all(Str).style.display=='none') {
			document.all(Str).style.display='block';
			} 
			else{
				document.all(Str).style.display='none';
			    }
		    } 
		    
	
			function on(){ 
				if (event.srcElement.className=="five"){ 
				event.srcElement.style.background="#fff"; 
				// event.srcElement.style.color="white";
				} 
			} 
	
			function out(){ 
				if (event.srcElement.className=="five"){ 
				event.srcElement.style.background="";
				// event.srcElement.style.color="";
				} 
			}

        