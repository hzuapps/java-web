package edu.hzu.javaweb.labs.se1414080902226;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class QueryMoneyService {
	public List<ResultMap> queryMoney(){
		List<ResultMap> l=new ArrayList<>();
		Connection connection = DaoHelper.getConnection();
		ResultMap rms=null;
		String sql="select *from money";
		 try {
			PreparedStatement ptmt = connection.prepareStatement(sql);
			ResultSet resultSet = ptmt.executeQuery();
			while(resultSet.next()){
				rms=new ResultMap();;
				rms.setName(resultSet.getString("name"));
				rms.setMoney(resultSet.getInt("money"));
				rms.setData(resultSet.getDate("pdata"));
				l.add(rms);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return l;
	}
}
