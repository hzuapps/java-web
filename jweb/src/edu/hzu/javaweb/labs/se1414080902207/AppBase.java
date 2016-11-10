package indi.xiao.ext.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ApplicationObjectSupport;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * 对ApplicationObjectSupport的功能拓展.
 * 其他Service的类都继承本类.
 *
 * @Author xiaoyq
 */
public abstract class AppBase extends ApplicationObjectSupport {
    public static Logger logger = LoggerFactory.getLogger(AppBase.class);

    public ApplicationContext applicationContext;

    public AppBase(){

    }

    public ApplicationContext getContext(){
        return this.getApplicationContext();
    }

    public Object getBean(String id){
        return this.getContext().getBean(id);
    }

    public void postStrToClient(String json,HttpServletResponse response){
        try{
            response.setContentType("text/html;charset=utf-8");
            PrintWriter pw = response.getWriter();
            pw.write(json);
            pw.flush();
            pw.close();
        }catch (Exception e){
            logger.error("AppBase  -- postStrToClient error " + json, e);
        }

    }

    public static void main(String[] args)throws Exception{

    }
}
