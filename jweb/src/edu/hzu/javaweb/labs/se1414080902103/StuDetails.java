package edu.hzu.javaweb.labs.se1414080902103;

public class StuDetails {
	private String name;
	private String id;
	private String date;
	private String note;
	public StuDetails(){}
	public StuDetails(String name,String id,String date,String note)
	{
		this.name=name;
		this.id=id;
		this.date=date;
		this.note=note;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setBrithdate(String date) {
		this.date = date;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note =note;
	}
}
