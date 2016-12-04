package control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import util.Build;
import model.User;

public class Load {
	Build build = new Build();
	
	// 登录
	public String load(User us,HttpServletRequest request) {
		String name=us.getUsername();
		String pass=us.getPasssword();
		HttpSession session=request.getSession();
		
		
		@SuppressWarnings("unchecked")
		Map<String, String> map=(Map<String, String>) session.getAttribute("user");
		if(map!=null){
			String check_pass=map.get(name);
			if (check_pass!=null) {
				if(check_pass.equals(pass)){
					return "shop_manager.jsp";
				}else{
					return "密码错误，请重新输入";
				}
			} else {
				return "账号不存在，请重新输入";
			}
		}else{
			return "账号不存在，请重新输入";
		}
	}
	
	// 注册
	public String enroll(HttpServletRequest request,User us) {
		String name=us.getUsername();
		String pass=us.getPasssword();
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		Map<String, String> map=(Map<String, String>) session.getAttribute("user");
		
		if(map.containsKey(name)){
			return "账户已存在，请重新输入";
		}else if (build.add(name,pass)) {
			//更新用户session
			map.put(name,pass);
			session.setAttribute("user", map);
			return "shop_manager.jsp";
		} else {
			System.out.println("添加用户出错");
			return "系统出错，请稍后重试";
		}
	}
}
