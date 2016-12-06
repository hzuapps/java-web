
     function showtime(todaytime){
    
     var hour=todaytime.getHours();
     var minute=todaytime.getMinutes();
     var second=todaytime.getSeconds();
     
	 if(hour<10) hour= '0' + hour;
	 if(minute<10) minute = '0' + minute;
	 if(second<10) second = '0' + second;
	 if(hour>=0||hour<=12) var mor="AM";
	 if(hour>12||hour<=24) var afr="PM";
	 var str=hour+":"+minute+":"+second;
	 return str;
   }

   function showdate(todaydate){
     var year=todaydate.getYear();
     var month=todaydate.getMonth()+1;
     var day=todaydate.getDate();
     var dd= todaydate.getDay();
	 if(year<1900) year = year+1900;
	 if(month<10) month= '0' + month;
	 if(day<10) day = '0' + day;
	 if  (dd==1)  dd="星期一";
	 if  (dd==2)  dd="星期二";
	 if  (dd==3)  dd="星期三";
	 if  (dd==4)  dd="星期四";
	 if  (dd==5)  dd="星期五";
	 if  (dd==6)  dd="星期六";
	 if  (dd==0)  dd="星期日";
	 var str=year+"-"+month+"-"+day+" "+dd;
	 return str;
   }

   function time()
	{
	var today;
	today = new Date();
	document.getElementById("left-bottom").innerHTML = showtime(today);
	window.setTimeout("time()", 1000);
	}
	time();
    
    function todaydate(){
    var today;
	today = new Date();
	document.getElementById("left-bottom-date").innerHTML = showdate(today);
    }
    todaydate();
   