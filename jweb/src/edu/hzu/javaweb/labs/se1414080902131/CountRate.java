package beans;

public class CountRate {
	private double money1;
private String qixian, repayment,date;
private int num;

public CountRate(double money1, String qixian, String repayment,int num,String date,double sum,double rate) {
	this.money1=money1;
	this.qixian=qixian;
	this.repayment=repayment;
	this.num=num;
	this.date=date;
// TODO Auto-generated constructor stub
}

public double getMoney1(){return money1;}
public void setMoney1(double money1){this.money1=money1;}
public String getQixian(){return qixian;}
public void setQixian(String qixian){this.qixian=qixian;}
public String getRepayment(){return repayment;}
public void setRepayment(String repayment){this.repayment=repayment;}
public int getNum(){return num;}
public void setNum(int num){this.num=num;}
public String getDate(){return date;}
public void setDate(String date){this.date=date;}
}
