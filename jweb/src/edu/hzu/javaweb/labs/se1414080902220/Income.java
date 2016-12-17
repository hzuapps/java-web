package edu.hzu.javaweb.labs.se1414080902220;
import java.text.DateFormat;
import java.util.Date;


public class Income 
{
	private int id;
	private Double incomeMoney;
	private String description;
	private String time;
	
	public Income()
	{
		this.incomeMoney=0.00;
		this.description="待填写";
		this.time= DateFormat.getDateInstance().format(new Date()).toString();
	}
	
	public Income(Double IncomeMoney,String Description,String timeString)
	{
		this.incomeMoney=IncomeMoney;
		this.description=Description;
		this.time=timeString;
	}
	
	public int SaveIncomeInfo()
	{
		String sqltext="insert into income(income,description,time) values(?,?,?)";
		Object[] params=new Object [3];
		params[0]=this.incomeMoney;
		params[1]=this.description;
		params[2]=this.time;
		int result=0;
		try {
			result=new SqlHelp().executeUpdate(sqltext, params);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return result;
		
		
	}
	
	public int getId() 
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public Double getIncomeMoney() 
	{
		return incomeMoney;
	}
	public void setIncomeMoney(Double incomeMoney)
	{
		this.incomeMoney = incomeMoney;
	}
	public String getDescription() 
	{
		return description;
	}
	public void setDescription(String description) 
	{
		this.description = description;
	}
	public String getTime() 
	{
		return time;
	}
	public void setTime(String time) 
	{
		this.time = time;
	}
}
