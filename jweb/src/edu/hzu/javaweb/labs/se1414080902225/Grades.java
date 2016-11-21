package edu.hzu.javaweb.bean;

public class Grades 
{
	private String sno;
	private String courseName;
	private double grade;
	private double credit;
	
	
	public Grades(String CourseName,String Sno,double Credit)
	{
		this.courseName=CourseName;
		this.sno=Sno;
		this.credit=Credit;
	}
	
	
	public Grades(String CourseName,double Credit)
	{
		this.courseName=CourseName;
		this.credit=Credit;
		this.grade=0;
	}
	
	public double getCredit() 
	{
		return credit;
	}

	public void setCredit(double credit) 
	{
		this.credit = credit;
	}

	public String getSno() 
	{
		return sno;
	}
	
	public void setSno(String sno) 
	{
		this.sno = sno;
	}
	
	public String getCourseName() 
	{
		return courseName;
	}
	
	public void setCourseName(String courseName) 
	{
		this.courseName = courseName;
	}
	
	public double getGrade()
	{
		return grade;
	}
	
	public void setGrade(double grade) {
		this.grade = grade;
	}
	
	
	
}
