

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/LoginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");


		   String driverName="com.mysql.jdbc.Driver";
		   String UserName="root";
		   String userPwd="";
		   String dbName="thesis";
		   String url1="jdbc:mysql://localhost:3306/"+dbName;
		   String url2="?user="+UserName+"&password="+userPwd;
		   String url3="&useUnicode=true&characterEncoding=utf-8";
		   String url=url1+url2+url3;


		   request.setCharacterEncoding("utf-8");
		   String sql= "select password from user where userName=?";

		   try{

			   Class.forName(driverName);
			   Connection conn=DriverManager.getConnection(url);

			   PreparedStatement pstmt=conn.prepareStatement(sql);
			   pstmt.setString(1,userName);


		       ResultSet r=pstmt.executeQuery();


		       if(r.next())
		       {

		           System.out.println(r.getString("password"));
		           PrintWriter out=response.getWriter();
		           if(r.getString("password").equals(password))
		           {
		           HttpSession session=request.getSession();
		   		   session.setAttribute("userName", userName);
		   		       out.println("登陆成功");
		           }
		   		   else
		   			   out.println("登陆失败");


		       }
		       r.close();
		       conn.close();

		   }catch(SQLException e)
		   {
		       e.printStackTrace();
		   } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			 e.printStackTrace();
		}




	}

}
