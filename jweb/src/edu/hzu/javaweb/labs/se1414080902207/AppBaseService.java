package indi.xiao.ext.common;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

/**
 * 对AppBase的功能拓展.
 * 其他Service的类都实现本类.
 *
 * @Author xiaoyq
 */
public abstract class AppBaseService extends AppBase{
    public static Logger logger = LoggerFactory.getLogger(AppBaseService.class);

    private final String APPDBSOURCE = "appDBSource";

    public AppBaseService() {
    }


    public SqlSession getSqlSession() throws Exception {
        SqlSessionFactory sqlMap = (SqlSessionFactory)this.getContext().getBean(APPDBSOURCE);
        return sqlMap.openSession();
    }

}