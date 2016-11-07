package edu.hzu.javaweb.labs.se1414080902115;

public class UserData {
 private String user;
 private String pwd;
 private boolean Remember;
 public void UserDate(){
	 user="";
	 pwd="";
	 Remember=true;
 }
 public void setUser(String name){
	   user=name;
 }
 public void setPwd(String Pwd)
 {
	 pwd=Pwd;
 }
 public void setRemeber(boolean remember)
 {
	 Remember=remember;
 }
 public String getUser(){
	return user;
 }
 public String getPwd(){
	 return pwd;
 }
 public boolean getRemember(){
	 return Remember;
 }
}
