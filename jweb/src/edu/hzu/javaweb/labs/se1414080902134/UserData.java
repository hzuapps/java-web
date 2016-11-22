package edu.hzu.javaweb.labs.se1414080902134;

public class UserData {
	private int userId;
	private String UserName;
	private String Email;
	private String Password;
	private String QuickCode;
	private boolean Remeber;
	public boolean isLogin;
	public UserData(){
		UserName = "";
		Email = "";
		Password = "";
		QuickCode = "";
		Remeber = false;
		isLogin = false;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
					//mock to search from database
					//return mock_.mockLogin(this);
					UserData ud = (new UserDataDao()).CheckUser(this);
					if (ud != null) {
						setUserName(ud.getUserName());
						setEmail(ud.getEmail());
						setPassword(ud.getPassword());
						isLogin = true;
						return true;
					} else {
						return false;
					}
				}
			}
		} else {
			return true;
		}
	}
}

class mock_{
	public static boolean mockLogin(Object o){
		return true;
	}
}
