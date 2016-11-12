package indi.xiao.ext.aop;

import indi.xiao.ext.common.AppBaseService;
import indi.xiao.ext.util.JsonUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 请求拦截处理,
 * 对于任何action请求进行拦截,
 * 做验证处理.
 *
 * @Author xiaoyq
 */
@Aspect
public class AppActionAop extends AppBaseService {
    public static Logger logger = LoggerFactory.getLogger(AppActionAop.class);

    @Pointcut("execution(* indi.xiao.app.*.action..*(..))")
    private void anyMethod() {
    }

    @Around("anyMethod()")
    public Object appsActionMethod(ProceedingJoinPoint pjp) throws Throwable {

        Object[] obs = pjp.getArgs();
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        Boolean loginFlag = false;

        if (obs != null) {
            for (int i = 0; i < obs.length; i++) {
                Object obj = obs[i];
                if (obj instanceof HttpServletRequest) {
                    request = (HttpServletRequest) obj;
                }
                if (obj instanceof HttpServletResponse) {
                    response = (HttpServletResponse) obj;
                }
            }

            // 如果拦截到的类继承了接口LoginAopSkip，不执行登陆验证
            if (!(pjp.getThis() instanceof LoginAopSkip)) {
                //校验登陆合法性，cookie校验
                Cookie[] cookies = request.getCookies();
                if(cookies!=null && cookies.length>0){
                    for (Cookie ck : cookies) {
                        if ("login".equals(ck.getName()) && ck.getValue() != null) {
                            loginFlag = true;
                        }
                    }
                }
            }else{
                loginFlag = true;
            }

            // 登陆验证通过时，进行权限验证
            if (loginFlag) {
                pjp.proceed();
            } else {
                response.sendRedirect("/infoManager/login.html");
            }
        }
        return "";
    }

}
