package edu.hzu.javaweb.labs.se1414080902135;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(
		//����������
		filterName="Lo_filter",
		//�������Һҳ��
		urlPatterns={"/*"},
		//��������ϸ��Ϣ
		initParams={
				@WebInitParam(name="encoding",value="UTF-8"),
				@WebInitParam(name="error",value="error.jsp"),
		}
		)
public class Lo_Filter implements Filter {
	private String encoding=null;
	private String error=null;
	
	public void destroy() {
		error=null;
		encoding=null;
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.encoding=fConfig.getInitParameter("encoding");
		error=fConfig.getInitParameter("error");
	}
	
	private String getEncoding(){
		return this.encoding;
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws
		IOException, ServletException {
		encoding=getEncoding();
		request.setCharacterEncoding(encoding);
		
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse rep=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		//��ȡ����·��
		String rurl=req.getRequestURL().toString();		
		
		if(rurl.endsWith("Jweb/")){
			chain.doFilter(request, response);	
		}else if(rurl.endsWith("html")){
			Object value=session.getAttribute("user");
			if(value==null){
				req.getRequestDispatcher(error).forward(req, rep);
			}else{
				chain.doFilter(request, response);
			}
		}
	}
}
