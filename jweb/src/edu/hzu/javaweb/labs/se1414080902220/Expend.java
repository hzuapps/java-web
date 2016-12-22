package edu.hzu.javaweb.labs.se1414080902220;

public class Expend 
{
	private Integer id;
	private Double number;
	private String expendTime;
	private String flowing;
	private String purpose;
	
	public Integer getId()
	{
		return id;
	}
	
	public void setId(Integer id) 
	{
		this.id = id;
	}
	
	public Double getNumber() 
	{
		return number;
	}
	
	public void setNumber(Double number) 
	{
		this.number = number;
	}
	
	public String getExpendTime() 
	{
		return expendTime;
	}
	public void setExpendTime(String expendTime) 
	{
		this.expendTime = expendTime;
	}
	public String getFlowing() {
		return flowing;
	}
	
	public void setFlowing(String flowing) 
	{
		this.flowing = flowing;
	}
	
	public String getPurpose()
	{
		return purpose;
	}
	
	public void setPurpose(String purpose) 
	{
		this.purpose = purpose;
	}
	public Expend()
	{
		
	}
	public Expend (Integer Id,Double Number, String ExpendTime,String Flowing) 
	{
		this.id=Id;  
		this.number=Number;
		this.flowing=Flowing;
		this.expendTime=ExpendTime;
		this.purpose="未知";
	}
	
}
