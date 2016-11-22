package edu.hzu.javaweb.labs.se1414080902206;

public class Login_Passenger {

	private String username,password,email;
    public Login_Passenger(){};
    public Login_Passenger(String username,String password,String email)
    {
    	this.username = username;
    	this.password = password;
    	this.email = email;
    }
    public String getUsername()
    {
    	return username;
    }
    public void setUsername(String username)
    {
    	this.username = username;
    }
    public String getPassword()
    {
    	return password;
    }
    public void setPassword(String password)
    {
    	this.password = password;
    }
    public String getEmail()
    {
    	return email;
    }
    public void setEmail(String email)
    {
    	this.email = email;
    }
}