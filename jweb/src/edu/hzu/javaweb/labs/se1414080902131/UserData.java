package edu.hzu.javaweb.labs.se1414080902131;
public class UserDate{
	private boolean readed;
	private String jiekuan;
	private String time;
	private String way;
	private String pass;
	public void UserDate(){
		jiekuan=" ";
		time=" ";
		way=" ";
		pass=" ";
		readed=false;
	}
	public void setCheck(boolean yanzheng){
		readed=yanzheng;
	}
	pubic void setMoney(String zijin){
		jiekuan=zijin;
		
	}
	public void setTime(String day){
		time=day;
	}
	public void setMent(String ment){
		way=ment;
	}
	public void setPwd(String passwd){
		pass=passwd;
	}
	public String getReaded(){
		return readed;
	}
	public String getMoney(){
		return jiekuan;
	}
	public String getTime(){
		return time;
	}
	public String getMent(){
		return way;
	}
	public String getPwd(){
		return pass;
	}
	public boolean isComplete(){
			if(readed.equal("")){
				System.out.println("请仔细阅读相关借款信息！");
				return false;
			}
			else{if(jiekuan.equals("")){
				System.out.println("请输入借款数目！");
				return false;
			}
		}
			else{if(time.equal("")){
				System.out.println("请输入借款期限");
				return false;
			}
			}
			else{if(way.equals("")){
				System.out.println("请选择还款方式！");
				return false;}
			}
		else{if(pass.equals("")){
			System.out.println("请输入支付密码！");
			return false;}
		}else{return true;}
}