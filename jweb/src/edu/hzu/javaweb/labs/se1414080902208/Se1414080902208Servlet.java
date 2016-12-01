import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
  @WebServlet("/1414080902208")
  public class Se1414080902208Servlet extends HttpServlet {
  
  		request.setCharacterEncoding("gb2312");
  		response.setCharacterEncoding("gb2312");
  		PrintWriter out = response.getWriter();
 		String Score = new String(request.getParameter("score"));
 		String Comment = new String(request.getParameter("comment"));
 		HttpSession session=request.getSession(true);
 		String msg = "";
  		if (Score.equals("")) {
 			out.println("评分不能为空");
 			msg = "评分不能为空";
  		} else if (Comment.equals("")) {
 			out.println("评论不能为空");
 			msg = "评论不能为空";
  		} else {
  			boolean flat = true;
  			char[] str=Score.toCharArray();
  			for (int i = 0;i < Score.length();i++) {
  				int x = str[i] - '0';
  				if (!(x >= 0 && x <= 10)) {
 // 评分最大为10分，，	
	                     out.println("请输入正确的评分");
 					msg = "请输入正确的评分";
  					flat = false;
  					break;
  				}
 
  				for (int i = 0;i < Amount.length();i++) {
  					int x = sstr[i] - '0';
  					if (!(x >= 0 && x <= 100)) {

 //评论字数最多为100 ，，			out.println("请在字数范围内输入评论");
 						msg = "请在字数范围内输入评论";
  						flat = false;
  						break;
  					}
  				}
  			}
 			if (flat) out.println("评价成功");
 			if (flat) msg = "评价成功";
  		}
 		System.out.println(msg);
 		request.setAttribute("message", msg);
 		request.getRequestDispatcher("/index.jsp").forward(request, response);

 		session.setAttribute("message", msg);


 