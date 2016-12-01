package edu.hzu.javaweb.labs.se1414080902228;
public class Product {
	private String id;
	private String name;
	private String date;
	private String describe;
	private String remarks;
	private int num;
	private int type;
	
	public Product(){}
	
	public Product(String id, String name, String date, String describe,
			String remarks, int num, int type) {
		super();
		this.id = id;
		this.name = name;
		this.date = date;
		this.describe = describe;
		this.remarks = remarks;
		this.num = num;
		this.type = type;
	}

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
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	
	
}
