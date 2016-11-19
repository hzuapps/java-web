package edu.hzu.javaweb.labs.se1414080902231;


public interface InUserDao {
	public abstract int createUser(User user);
	public abstract User findUser(String username,String password);
	public abstract int checkUser(String username);
	public abstract int updateUer(User user);
}
