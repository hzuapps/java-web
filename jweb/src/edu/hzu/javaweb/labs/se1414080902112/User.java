package edu.hzu.javaweb.labs.se1414080902112;

public class User {
	private String name;
    private String sex;
	private String id;
	private String brithdate;
	private String information;
	public User(){}
	public User(String name,String sex,String id,String brithdate,String information)
	{
		this.name=name;
        this.sex=sex;
		this.id=id;
		this.brithdate=brithdate;
		this.information=information;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
        public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBrithdate() {
		return brithdate;
	}
	public void setBrithdate(String brithdate) {
		this.brithdate = brithdate;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information =information;
	}
}