package se1414080902114;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.json.JSONArray;

import se1414080902114.Users;
import se1414080902114.Dbconnection;

public class UsersAction {
	private static final long serialVersionUID = 1L;
	String insert="insert";      //从前端传回来的信息是增加信息
    String delete="delete";      //从前端传回来的信息是删除信息
    String query="query";        //从前端传回来的信息是查询信息
    String update="update";      //从前端传回来的信息是更新信息
    String mainParameter;        //获取前端请求的参数值
    static String ses=null;      //包存需要的session数据
    
	//Post方法提交过来的处理函数
	public void doPost(ServletRequest request, ServletRequest response,Servlet session) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");//设置HTTP响应的编码方式
		((ServletResponse) response).setContentType("text/html;charset=utf-8");//设置前端浏览器显示数据的编码方式和
		String method=request.getParameter("method");
		String tr=request.getParameter("b");
		System.out.println("b=");
		System.out.println(tr);
		
		if(tr!=null){
			ses=((ServletRequest) session).getAttribute("judge").toString();
			((ServletRequest) session).removeAttribute("judge");	
		}else{
			mainParameter=request.getParameter("a");
			((ServletRequest) session).setAttribute("judge", mainParameter);
			request.getRequestDispatcher("/users/users.jsp").forward(request, (ServletResponse) response);
		}
		
		if(method!=null){
			if(insert.equals(method)){
				System.out.print("选择插入操作！");
				Insert(request,response);
				
			}else if(update.equals(method)){
				Update(request,response);
			}else if(delete.equals(method)){
				Delete(request,response);
			}
		}
	}
	
	
	//数据库插入操作
	public void Insert(ServletRequest request, ServletRequest response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
	    String Type = request.getParameter("Type");
		Type = URLDecoder.decode(Type,"utf-8");
		String Username = request.getParameter("Username");
		Username = URLDecoder.decode(Username,"utf-8");

		String sql = "insert into trees(Type,Username,uniqueId) values("+Type+",'"+Username+"','"+ses+"')";
		if(insert.equals(method)){
			 Connection conn = new Dbconnection().getConn();
			 Statement stmt=null;
			try{
				stmt=conn.createStatement();
				int a=stmt.executeUpdate(sql);
				if(a>0){
					System.out.println("添加成功！");
				}else{
					System.out.println("添加失败！");
				}
			}catch (SQLException e){
				 System.out.println("添加失败");
			} finally {
				try {
					if (conn != null)
						conn.close();
					if (stmt != null)
						stmt.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	//数据库删除操作
	public void Delete(ServletRequest request, ServletRequest response)
			throws ServletException, IOException {

		String method=request.getParameter("method");
		String dId=request.getParameter("Info");
		dId = URLDecoder.decode(dId,"utf-8");
		System.out.println("dId=");
		System.out.println(dId);
		String sql = "delete  from trees where Info='"+dId+"'";
		if(delete.equals(method)){
			Connection conn = new Dbconnection().getConn();
		    Statement stmt=null;
			try{
				stmt=conn.createStatement();
				int a=stmt.executeUpdate(sql);
				if(a>0){
					System.out.println("删除成功！");
					System.out.println("a=");
					System.out.println(a);
				}else{
					System.out.println("删除失败！");
				}
			}catch (SQLException e){
				 System.out.println("删除失败");
			} finally {
				try {
					if (conn != null)
						conn.close();
					if (stmt != null)
						stmt.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	//数据库查询操作
	public void Query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method=request.getParameter("method");
		if(delete.equals(method)){
			
		}
	}
	
	//数据库更新数操作
	public void Update(ServletRequest request, ServletRequest response)
			throws ServletException, IOException {

		String method=request.getParameter("method");
		if(update.equals(method)){
			
		}
	}
    

	
	public void getJson(String str,ServletRequest request, ServletResponse response) throws IOException{
		String sql = "select * from trees where uniqueId='"+str+"'";
		JSONArray treeArray = new JSONArray();
		Statement stat = null;
		ResultSet rs = null;//创建对象，用来保存从数据表中查询到的数据
		Connection conn = new Dbconnection().getConn();
		List<Users> userslist=new ArrayList<Users>();//实例化List对象
		try{
			stat = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);//获取连接状态
			rs = stat.executeQuery(sql);//执行SQL语句查询
			while(rs.next()){
				        Users usersbean=new Users();
						usersbean.setInfo(rs.getString("Info"));
						usersbean.setType(rs.getString("Type"));
						usersbean.setUsername(rs.getString("Username"));
						userslist.add(usersbean);						
			     }

			for(Users users: userslist){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("Info",users.getInfo());
					jsonObject.put("Username",users.getUsername());
					jsonObject.put("Type",users.getType());
					treeArray.put(jsonObject);
			}
			System.out.println(treeArray.toString());
		    
		}catch (SQLException e) {
			e.printStackTrace();//有异常把异常打印到命令控制行中
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (stat != null)
					stat.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
//		return treeArray.toString();
		String data = treeArray.toString();
 		
		response.getWriter().write(data);
		
	}

}
