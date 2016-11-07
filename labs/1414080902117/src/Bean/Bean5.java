package Bean;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Bean5 {
	private String date_time;
	private String week;
	private Calendar calendar= Calendar.getInstance();
	public String getdatetime()
	{
		Date currDate =Calendar.getInstance().getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		date_time = sdf.format(currDate);
		return date_time;
	}
	public String getweek()
	{
		String[] weeks = {"星期一","星期二","星期三","星期四","星期五","星期六","星期日"};
		int index = calendar.get(Calendar.DAY_OF_WEEK);
		week = weeks[index-1];
		return week;
	}
}
