package edu.hzu.javaweb.labs.se1414080902134;

import java.sql.*;

import com.sun.org.apache.regexp.internal.RE;

/**
 * 
 * @author Administrator
 *
 */
public class UserDataDao {
	private String Select_up = "select id,UserName,Email,Password_ from UserData where " + 
							"UserName=? and Password_=?";
	private String Select_ep = "select UserName,Email,Password_ from UserData where " + 
			"Email=? and Password_=?";	
	/**
	 * Search the ud from database
	 * @param ud
	 * @return if the ud is exist in the database return true else return false
	 */
	public UserData CheckUser(UserData ud){
		PreparedStatement ps = null;
		boolean isGet = false;
		try {
			Connection conn = jdbcOne.getConnection();
			if (ud.getEmail().equals("")) {
				if (ud.getUserName().equals("")) {
					return null;
				}
				ps = conn.prepareStatement(Select_up);
				ps.setString(1, ud.getUserName());
			} else {
				ps = conn.prepareStatement(Select_ep);
				ps.setString(1, ud.getEmail());
			}
			ps.setString(2, ud.getPassword());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ud.setUserId(rs.getInt(1));
				ud.setUserName(rs.getString(2));
				ud.setEmail(rs.getString(3));
				ud.setPassword(rs.getString(4));
			}
			jdbcOne.free(rs, ps, conn);
			return ud;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ud;
	}
}
