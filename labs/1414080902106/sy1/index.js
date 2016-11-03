window.onload = function(){
	//初始化年份列表
	var years = document.getElementById("year");
	var year = new Date().getFullYear();
	var node = null;
	while(year >= 1900){
		node = new Option(year,year);
		years.options.add(node);
		year--;
	}
	//初始化月份列表
	var months = document.getElementById("month");
	for(var i = 1;i <= 12;i++){
		node = new Option(i,i);
		months.options.add(node);
	}
};
//判断当前选择的年份是否是闰年
function isLeap(){
	var options = document.getElementById("year").options;
	var index = options.selectedIndex;
	var year = options[index].text;
	if(year % 100 != 0){
		if(year % 4 == 0)
			return true;
	}else{
		if(year % 400 == 0)
			return true;
	}
	return false;
}
//清空options集合但保留第一项
function clear(options){
	var len = options.length - 1;
	for(var i = 0;i < len;i++)
		options.remove(1);
}
//年份变化时执行
function onYearChange(){
	onMonthChange();
}
//月份变化时执行
function onMonthChange(){
	//获取当前选择的年份项索引
	var yearIndex = document.getElementById("year").options.selectedIndex;
	//获取当前选择的月份
	var month = document.getElementById("month").options.selectedIndex;
	//获取日列表对象
	var days = document.getElementById("day");
	//获取当前选择的日项索引
	var oldDayIndex = days.selectedIndex;
	//如果年份或月份没有选择，就隐藏日列表并结束
	if(month == 0 || yearIndex == 0){
		days.style.display = "none";
		return;
	}
	//显示日列表
	days.style.display = "";
	//计算最大的日数
	var maxDay = null;
	switch(month){
	case 1:
	case 3:
	case 5:
	case 7:
	case 8:
	case 10:
	case 12:
		maxDay = 31;
		break;
	case 2:
		if(isLeap() == true)
			maxDay = 29;
		else
			maxDay = 28;
		break;
	default:
		maxDay = 30;
	}
	//情况原日列表，保留第一项
	clear(days.options);
	//重新插入日项
	var node = null;
	for(var i = 1;i <= maxDay;i++){
		node = new Option(i,i);
		days.options.add(node);
	}
	//如果原来选择的日不超过新的最大日数，则保留原选择
	if(oldDayIndex <= maxDay)
		days.options.selectedIndex = oldDayIndex;
}
