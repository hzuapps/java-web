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
<<<<<<< HEAD

	private static List<Member> types;
	static {
		types = new ArrayList<Member>();
		types.add(new Member("张三"));
		types.add(new Member("李四"));
		types.add(new Member("王五"));
=======
	
	//初始化基本数�?
	private static List<Category> types;
	static{
		types=new ArrayList<Category>();
		types.add(new Category("日用品", false));
		types.add(new Category("零食",false));
		types.add(new Category("饮料",true));
>>>>>>> 1b4d53de7844201415c405bb574a1f6751802111
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
<<<<<<< HEAD
=======
	private void deleteTypes(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String str="";
		System.out.println(name);
		String[]arr=name.split(",");
		for(int j=0;j<arr.length;j++)
		{
			for(int i=0;i<types.size();i++){
				Category type=types.get(i);
				String typeName=type.getName();
				if(typeName.equals(arr[j]))
				{
					if(type.getIsHasBook()==false)
					types.remove(type);
					else str+=type.getName()+",";
					break;
				}
			} 
		}
		if(str.length()>1){
			str=str.substring(0, str.length()-1);
		}
		PrintWriter writer = response.getWriter();
		if(str.length()==0){
			writer.write("{\"msg\":\"success\"}");
		}
		else writer.write("{\"msg\":\""+str+"该类别下有商品"+"\"}");
		
		writer.close();
	}
>>>>>>> 1b4d53de7844201415c405bb574a1f6751802111

	public void showList(HttpServletResponse response) throws IOException {
		PrintWriter writer = response.getWriter();
		writer.write(reJSON(types));
		writer.close();
	}

	public void addTypes(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String name = request.getParameter("name");
		PrintWriter writer = response.getWriter();
<<<<<<< HEAD
		if (name == null || name.equals("")) {
			writer.write("{\"msg\":\"不能为空\"}");
			writer.close();
			return;
		}
		for (int i = 0; i < types.size(); i++) {
			if (types.get(i).getName().equals(name)) {
				writer.write("{\"msg\":\"添加失败\"}");
=======
		if(name==null||name.equals(""))
		{
		writer.write("{\"msg\":\"请输入商品类别\"}");
		writer.close();
		return ;
		}
		for(int i=0;i<types.size();i++){
			if(types.get(i).getName().equals(name))
			{
				writer.write("{\"msg\":\"该商品类别存在\"}");
>>>>>>> 1b4d53de7844201415c405bb574a1f6751802111
				writer.close();
				return;
			}
		}
<<<<<<< HEAD
		Member type = new Member();
=======
		Category type=new Category();
>>>>>>> 1b4d53de7844201415c405bb574a1f6751802111
		type.setName(name);
		types.add(type);
		writer.write("{\"msg\":\"success\"}");
		writer.close();
	}
<<<<<<< HEAD

	public String reJSON(List<Member> list) {
		StringBuffer str = new StringBuffer("{");
		Iterator<Member> iterator = list.iterator();
		while (iterator.hasNext()) {
			Member Member = iterator.next();
			str.append("\"" + Member.getName() + "\":\"" + true + "\"");
			if (iterator.hasNext())
				str.append(",");
=======
	
	/**
	 * 返回JSON数据
	 * @param list   商品类别集合
	 * @return 商品类别的JSON数据
	 */
	public String reJSON(List<Category> list)
	{
		StringBuffer str=new StringBuffer("{");
		Iterator<Category> iterator = list.iterator();
		while(iterator.hasNext())
		{
			Category bookType = iterator.next();
			str.append("\""+bookType.getName()+"\":\""+bookType.getIsHasBook()+"\"");
			if(iterator.hasNext())str.append(",");
>>>>>>> 1b4d53de7844201415c405bb574a1f6751802111
		}
		str.append("}");
		return str.toString();
	}
}
