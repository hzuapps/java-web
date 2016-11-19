package edu.hzu.javaweb.labs.se1414080902113;

public class Book {
	private String name;
	private String writer;
	private String date;
	private String publish;
	private String main;
	public Book(){}
	public Book(String sname,String swriter,String sdate,String spublish,String smain)
	{
		this.name=sname;
		this.writer=swriter;
		this.date=sdate;
		this.publish=spublish;
		this.main=smain;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}

}
