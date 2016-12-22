package edu.hzu.javaweb.labs.se1414080902119;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/1414080902119")
public class Se1414080902119servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String operate = request.getParameter("operate");
		System.out.println(request.getRequestURI());
		if (operate == null)
			operate = "";
		try {
			if ("add".equals(operate))
				addTypes(response, request);
			else {
				showList(response, request);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void showList(HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException, ServletException {
		Connection connection = DBConnection.getConnection();
		List<Member> types = new ArrayList<Member>();
		String sql = "select name,idcard from member";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			Member member = new Member(resultSet.getString(1),resultSet.getString(2));
			types.add(member);
		}
		DBConnection.close(connection);
		DBConnection.close(statement);
		PrintWriter writer = response.getWriter();
		writer.write(reJSON(types));
		writer.close();
	}

	public void addTypes(HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException {
		String name = request.getParameter("name");
		String idCard = request.getParameter("idCard");
		System.out.println(name+":"+idCard);
		PrintWriter writer = response.getWriter();
		if (name == null || name.equals("")) {
			writer.write("{\"msg\":\"不能为空\"}");
			writer.close();
			return;
		}
		Connection connection = DBConnection.getConnection();
		String sql1 = "select name from member where name=?";
		PreparedStatement statement1 = connection.prepareStatement(sql1);
		statement1.setString(1, name);
		ResultSet resultSet = statement1.executeQuery();
		if (resultSet.next()) {
			writer.write("{\"msg\":\"添加失败\"}");
			writer.close();
		}
		Member type = new Member();
		type.setName(name);
		type.setIdCard(idCard);
		String sql = "insert into member(name,idcard) values(?,?)";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, type.getName());
		statement.setString(2, type.getIdCard());
		statement.executeUpdate();
		DBConnection.close(connection);
		DBConnection.close(statement);
		writer.write("{\"msg\":\"success\"}");
		writer.close();
	}

	public String reJSON(List<Member> list) {
		StringBuffer str = new StringBuffer("{");
		Iterator<Member> iterator = list.iterator();
		while (iterator.hasNext()) {
			Member Member = iterator.next();
			str.append("\"" +"姓名:"+Member.getName()+"      身份证:"+Member.getIdCard() + "\":\"" + true + "\"");
			if (iterator.hasNext())
				str.append(",");
		}
		str.append("}");
		return str.toString();
	}
}
