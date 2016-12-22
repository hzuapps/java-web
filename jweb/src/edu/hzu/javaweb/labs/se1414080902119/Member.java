package edu.hzu.javaweb.labs.se1414080902119;

public class Member {
	public String name; // 
	public String idCard;
	
	
	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Member() {
		super();
	}

	public Member(String name, String idCard) {
		super();
		this.name = name;
		this.idCard = idCard;
	}
	
}
