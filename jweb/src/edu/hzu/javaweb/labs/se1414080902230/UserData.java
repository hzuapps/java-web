package edu.hzu.javaweb.labs.se1414080902230;

public class UserData {
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAttribute(String key,String value){
		if(key.toLowerCase().equals("username")){
			setUsername(value);
		}else if(key.toLowerCase().equals("password")){
			setPassword(value);
		}
	}
	public boolean EmptyInput(){
		if(username.isEmpty()||password.isEmpty()){
			return true;
		}
		return false;
	}
}
