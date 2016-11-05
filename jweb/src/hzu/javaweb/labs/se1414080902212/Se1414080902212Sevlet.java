package _Sevlet_Test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.omg.CORBA.portable.InputStream;

@MultipartConfig(location = "C:/upload/", maxFileSize = 8388608, fileSizeThreshold = 819200)

public class Se1414080902212Sevlet extends HttpServlet {

	
	public Se1414080902212Sevlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("  <BODY>");
		out.println("文件名:"+request.getParameter("file_name")+"<br/>");
		out.println("文件描述 : "+request.getParameter("file_discribe")+"<br/>");
		out.println("上传成功");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		String fileName=request.getParameter("file_name");
//		Part part=request.getPart("file_Toup");
//		writeTo(fileName,part);
	}

	//存储文件
    private void writeTo(String fileName, Part part) throws IOException, FileNotFoundException {
        InputStream in = (InputStream) part.getInputStream();
        OutputStream out = new FileOutputStream(fileName);
        byte[] buffer = new byte[1024];
        int length = -1;
        while ((length = in.read(buffer)) != -1) {
            out.write(buffer, 0, length);
        }
        in.close();
        out.close();
    }
	public void init() throws ServletException {
		
	}

}
