package edu.hzu.javaweb.labs.se1414080902134;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSON;  
import net.sf.json.JSONArray;  
import net.sf.json.JSONObject;  
import net.sf.json.JSONSerializer;  

/**
 * Servlet implementation class notesOP
 */
@WebServlet("/notesOP")
public class notesOP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public notesOP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Object o = request.getParameter("OP");
		notesDao nd = new notesDao();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		if (o == null || session.getAttribute("login") == null) {
			return ;
		} else {
			String OP = (String)o;
			note n;
			int result_ = 0;
			switch (OP) {
				case "insert":
					n = fill(request);
					int result_1 = nd.insert(n, ((UserData)session
								.getAttribute("ud")).getUserId());
					n.setId(result_1);
					out.append("{\"op\":\"insert\",\"cout\":\"" + 
								result_1 + "\",\"note\":[" + 
								toJson.noteToJson(n) + "]}");
					break;
				case "delete":
					n = fill(request);
					int result_2 = nd.delete(n);
					if (result_2 == 0) {
						out.append("{\"op\":\"remove\",\"cout\":\"" + result_2 + "\"}");
					} else {
						out.append("{\"op\":\"remove\",\"cout\":\"" + n.getId() + "\"}");
					}
					break;
				case "getall":
					List<note> notes = nd.getAll(((UserData)session
								.getAttribute("ud")).getUserId());
					if (notes == null) {
						out.append("{}");
					} else {
						out.append(toJson.buildToJson(notes, "getall"));
					}
					break;
				case "update" :
					n = fill(request);
					int result_3 = nd.update(n, ((UserData)session
							.getAttribute("ud")).getUserId());
					out.append("{\"op\":\"update\",\"cout\":\"" + result_3 + "\"}");
					break;
				default :
					out.append("{\"op\":\"fail\",\"cout\":\"0\"}");
					return;
			}
		}
	}
	public note fill(HttpServletRequest req){
		note n = new note();
		String tstr;
		n.setId(Integer.parseInt(getParam(req,"id","0")));
		tstr = getParam(req,"title","title");
		if (tstr.length() > n.titleMaxLength) {
			tstr.substring(0, n.titleMaxLength);
		}
		n.setTitle(tstr);
		if (tstr.length() > n.contentMaxLength) {
			tstr.substring(0, n.contentMaxLength);
		}
		tstr = getParam(req,"content","content");
		n.setContent(tstr);
		tstr = (String)getParam(req,"quickCode","____");
		if (tstr == "____" || tstr.length() != n.quickCodeLength) {
			try {
				throw new Exception("quickCode is strange .");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		n.setQuickCode(tstr);
		n.setLastTime(new Date());
		return n;
	}
	private String getParam(HttpServletRequest req,String attr,String defaultValue) {
		String o = req.getParameter(attr);
		if (o == null) {
			return defaultValue; 
		} else {
			if (o.equals("")) {
				return defaultValue;
			}
			return o;
		}
	}
}
