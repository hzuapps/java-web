

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MessageShow
 */
@WebServlet("/MessageShow")
public class MessageShow extends HttpServlet {
	ArrayList<Message> MessageList=new ArrayList<Message>();
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageShow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		MessageList.add(new Message("基于Python的网络爬虫","2016","教师命题","软件教研室","AAA","3"));
		MessageList.add(new Message("红外感应实现教室照明智能控制","2016","教师命题","硬件教研室","BBB","2"));
		MessageList.add(new Message("基于.NETMVC的自动推荐商城","2016","教师命题","软件教研室","CCC","2"));
		MessageList.add(new Message("大数据分析算法","2016","教师命题","网络教研室","DDD","3"));

        request.setAttribute("List", MessageList);
		request.getRequestDispatcher("/SelectMessage.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
