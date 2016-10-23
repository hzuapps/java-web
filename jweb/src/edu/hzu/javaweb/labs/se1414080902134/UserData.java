package edu.hzu.javaweb.bean.se1414080902134;

public class UserData {
	private String UserName;
	private String Email;
	private String Password;
	private String QuickCode;
	private boolean Remeber;
	public UserData(){
		UserName = "";
		Email = "";
		Password = "";
		QuickCode = "";
		Remeber = false;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getQuickCode(){
		return QuickCode;
	}
	public void setQuickCode(String qc){
		QuickCode = qc;
	}
	public boolean getRemeber() {
		return Remeber;
	}
	public void setRemeber(boolean reamber) {
		Remeber = reamber;
	}
	public void setAttribute(String key,String value){
		//System.out.println(key + " +++ " + value);
		if (key.toLowerCase().equals("username")) {
			setUserName(value);
		} else if (key.toLowerCase().equals("email")) {
			setEmail(value);
		} else if (key.toLowerCase().equals("password")) {
			setPassword(value);
		} else if (key.toLowerCase().equals("quickcode")) {
			setQuickCode(value);
		} else if (key.toLowerCase().equals("Remeber")) {
			if (value.toLowerCase().equals("on")) {
				setRemeber(true);
			}
		}
	}
	public boolean isComplete(){
		//System.out.println(Password + "\t" + UserName + "\t" + Email);
		if (QuickCode.equals("")) {
			if (Password.equals("")) {
				System.out.println("Password false");
				return false;
			} else {
				if (UserName.equals("") && Email.equals("")) {
					System.out.println("UserName false");
					return false;
				} else {
					return true;
				}
			}
		} else {
			return true;
		}
	}
}
