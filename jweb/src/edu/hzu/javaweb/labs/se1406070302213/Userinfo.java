package edu.hzu.javaweb.labs.se1406070302213;

public class Userinfo {
	private String id;
	private String name;
	private String date;
	private boolean sex;
	private int age;
	
	public Userinfo(){}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Boolean getSex() {
		return sex;
	}
	public void setSex(boolean sex) {
		this.sex =sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}