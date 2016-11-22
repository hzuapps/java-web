package edu.hzu.javaweb.labs.se1414080902119;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/1414080902119")
public class Se1414080902119servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static List<Member> types;
	static {
		types = new ArrayList<Member>();
		types.add(new Member("张三"));
		types.add(new Member("李四"));
		types.add(new Member("王五"));
	}

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
		if ("show".equals(operate))
			doshow(response, request);
		else if ("add".equals(operate))
			addTypes(response, request);
		else
			showList(response);
	}

	private void doshow(HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException {
		request.setAttribute("list", types);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/1414080902119/client.jsp");
		dispatcher.forward(request, response);
	}

	public void showList(HttpServletResponse response) throws IOException {
		PrintWriter writer = response.getWriter();
		writer.write(reJSON(types));
		writer.close();
	}

	public void addTypes(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String name = request.getParameter("name");
		PrintWriter writer = response.getWriter();
		if (name == null || name.equals("")) {
			writer.write("{\"msg\":\"不能为空\"}");
			writer.close();
			return;
		}
		for (int i = 0; i < types.size(); i++) {
			if (types.get(i).getName().equals(name)) {
				writer.write("{\"msg\":\"添加失败\"}");
				writer.close();
				return;
			}
		}
		Member type = new Member();
		type.setName(name);
		types.add(type);
		writer.write("{\"msg\":\"success\"}");
		writer.close();
	}

	public String reJSON(List<Member> list) {
		StringBuffer str = new StringBuffer("{");
		Iterator<Member> iterator = list.iterator();
		while (iterator.hasNext()) {
			Member Member = iterator.next();
			str.append("\"" + Member.getName() + "\":\"" + true + "\"");
			if (iterator.hasNext())
				str.append(",");
		}
		str.append("}");
		return str.toString();
	}
}
