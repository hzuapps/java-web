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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd��");
		date_time = sdf.format(currDate);
		return date_time;
	}
	public String getweek()
	{
		String[] weeks = {"����һ","���ڶ�","������","������","������","������","������"};
		int index = calendar.get(Calendar.DAY_OF_WEEK);
		week = weeks[index-1];
		return week;
	}
}
