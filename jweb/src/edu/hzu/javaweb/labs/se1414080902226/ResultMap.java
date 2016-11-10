package edu.hzu.javaweb.labs.se1414080902226;

import java.sql.Date;


public class ResultMap {
	private String name;

	private int money;
	private Date data;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "ResultMap [name=" + name + ", money=" + money + ", data="
				+ data + "]";
	}
}
