package edu.hzu.javaweb.labs.se1414080902238;

public class Client {
	private String name;
	private String phone;
	private String car;
	private boolean hadPaid;
	 
	public Client(){}
	public Client(String na,String ph,String ca,boolean hp){
		name=na;
		phone=ph;
		car=ca;
		hadPaid=hp;
	}
	
	public String getName(){return name; }
	public void setName(String na){name=na;}
	public String getPhone(){return phone;}
	public void setPhone(String ph){phone=ph;}
	public String getCar(){return car;}
	public void setCar(String ca){car=ca;}
	public boolean getHadPaid(){return hadPaid;}
	public void setHadPaid(boolean hp){hadPaid=hp;}
}
