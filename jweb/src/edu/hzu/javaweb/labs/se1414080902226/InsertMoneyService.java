package edu.hzu.javaweb.labs.se1414080902226;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class InsertMoneyService {
	public boolean insertMoney(ResultMap rm){
		Connection connection = DaoHelper.getConnection();
		try {
			PreparedStatement ptmt = connection.prepareStatement("insert into goddess(name,money,pdata) values(?,?,curdate())");
			ptmt.setString(1, rm.getName());
			ptmt.setLong(2,rm.getMoney());
			return ptmt.execute();
		} catch (SQLException e) {
//			 TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
