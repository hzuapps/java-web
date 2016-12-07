package indi.xiao.app.organization;

import indi.xiao.ext.common.AppBaseService;
import indi.xiao.ext.util.ClientResUtil;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import indi.xiao.app.databaseDef.OrganizationPojo;

import java.util.*;

/**
 * 组织服务
 *
 * @author xiaoyq
 *
 */
@Service("OrganizationService")
public class OrganizationService extends AppBaseService {
    //初始化日志输出方法
    public static Logger logger = LoggerFactory.getLogger(OrganizationService.class);

    /**
     * 慎用 会导致没有where 项时 查出全部数据，
     * 使用时要在业务逻辑中增加查询项是否为空的验证验证标准
     * 查询OrganizationPojo对象列表
     *
     * @param p OrganizationPojo
     * @return List<OrganizationPojo> reSelectList
     * @throws Exception
     */
    public List<OrganizationPojo> select(OrganizationPojo p) throws Exception {
        SqlSession ss = null;
        List<OrganizationPojo> reSelectList = null;
        try {
            ss = getSqlSession();
            reSelectList = ss.selectList("Organization.select", p);
        } catch (Exception x) {
            logger.error("Class OrganizationService,Method select,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
        return reSelectList;
    }

    /**
     * 根据主键 id 查询数据
     *
     * @param id String
     * @return OrganizationPojo rePojo
     * @throws Exception
     */
    public OrganizationPojo selectById(String id) throws Exception {
        SqlSession ss = null;
        OrganizationPojo rePojo = null;
        try {
            ss = getSqlSession();
            Map p = new HashMap();
            p.put("id", id);
            rePojo = ss.selectOne("Organization.selectById", p);
        } catch (Exception x) {
            logger.error("Class OrganizationService,Method selectById,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
        return rePojo;
    }


    /**
     * 添加数据到数据库
     *
     * @param p OrganizationPojo
     * @return int reInt
     * @throws Exception
     */
    public boolean insert(OrganizationPojo p) throws Exception {
        SqlSession ss = null;
        int reInt = 0;
        try {
            ss = getSqlSession();
            Map<String,String> param = new HashMap<>();
            param.put("pcode",p.getPcode());
            String sortStr = (String)ss.selectOne("Organization.selectMaxSort",param);
            int curSort = sortStr==null?0:Integer.valueOf(sortStr)+1;
            p.setSort(curSort);
            reInt = ss.insert("Organization.insert", p);
        } catch (Exception x) {
            logger.error("Class OrganizationService,Method insert,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
        return reInt>0?true:false;
    }

    /**
     * 更新数据
     *
     * @param p OrganizationPojo
     * @return int reInt
     * @throws Exception
     */
    public int updateById(OrganizationPojo p) throws Exception {
        SqlSession ss = null;
        int reInt = 0;
        try {
            ss = getSqlSession();
            reInt = ss.update("Organization.updateById", p);
        } catch (Exception x) {
            logger.error("Class OrganizationService,Method updateById,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
        return reInt;
    }

    /**
     * 根据主键 id 删除数据
     *
     * @param id String
     * @return int reInt
     * @throws Exception
     */
    public int deleteById(String id) throws Exception {
        SqlSession ss = null;
        int reInt = 0;
        try {
            ss = getSqlSession();
            Map p = new HashMap();
            p.put("id", id);
            reInt = ss.delete("Organization.deleteById", p);
        } catch (Exception x) {
            logger.error("Class OrganizationService,Method deleteById,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
        return reInt;
    }

    /**
     * 根据主键 批量删除数据(物理删除)
     *
     * @param idlist List
     * @return int reInt
     * @throws Exception
     */
    public int deleteByIds(List idlist) throws Exception {
        SqlSession ss = null;
        int reInt = 0;
        try {
            ss = getSqlSession();
            reInt = ss.delete("Organization.deleteByIds", idlist);
        } catch (Exception x) {
            logger.error("Class OrganizationService,Method deleteByIds,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
        return reInt;
    }

    /**
     * 根据主键 批量删除数据(disable设置1)
     *
     * @param idlist
     * @return reInt
     * @throws Exception
     */
    public int updataDisable(List idlist) throws Exception {
        SqlSession ss = null;
        int reInt = 0;
        try {
            ss = getSqlSession();
            reInt = ss.update("Organization.updataDisable", idlist);
        } catch (Exception x) {
            logger.error("Class OrganizationService,Method updataDisable,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
        return reInt;
    }

    /**
     * 关联删除
     *
     * @param pcode
     * @return reInt
     * @throws Exception
     */
    public int deleteRelation(String pcode) throws Exception {
        SqlSession ss = null;
        int reInt = 0;
        try {
            HashMap<String, String> map = new HashMap<String, String>();
            map.put("pcode", pcode);
            ss = getSqlSession();
            reInt = ss.update("Organization.deleteRelation", map);
        } catch (Exception x) {
            logger.error("Class OrganizationService,Method deleteRelation,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
            }
        }
        return reInt;
    }


    /**
     * 递归获取组织树模型
     * 默认顶级节点的父节点为-1，需注意
     * @param list
     * @param pcode
     * @return orgTreeList
     * @throws Exception
     */
    public List<OrganizationPojo> getOrgTree(List<OrganizationPojo> list,String pcode)throws Exception{
        List<OrganizationPojo> orgTreeList = new ArrayList<>();
        for(OrganizationPojo orgPojo: list){
            if(!orgPojo.getDfsVis() && orgPojo.getPcode().equals(pcode)){
                orgPojo.setDfsVis(true);
                orgPojo.setChildren(this.getOrgTree(list,orgPojo.getCode()));
                orgTreeList.add(orgPojo);
            }
        }
        Collections.sort(orgTreeList);
        return orgTreeList;
    }

    /**
     * 根据单一节点组织码code名称构建组织树
     * 默认顶级节点的父节点为-1，需注意
     * @param list
     * @param code
     * @return orgTreeList
     * @throws Exception
     */
    public List<OrganizationPojo> getOrgTreeByCode(List<OrganizationPojo> list,String code)throws Exception{
        List<OrganizationPojo> orgTreeList = new ArrayList<>();
        for (OrganizationPojo orgPojo: list){
            if(orgPojo.getCode().equals(code)){
                orgTreeList.add(orgPojo);
            }
        }

        for(OrganizationPojo orgPojo: orgTreeList){
            orgPojo.setChildren(this.getOrgTree(list,orgPojo.getCode()));
        }
        return orgTreeList;
    }

    /**
     * 根据单一节点组织名称name名称构建组织树
     * 默认顶级节点的父节点为-1，需注意
     * @param list
     * @param name
     * @return orgTreeList
     * @throws Exception
     */
    public List<OrganizationPojo> getOrgTreeByName(List<OrganizationPojo> list,String name)throws Exception{

        List<OrganizationPojo> orgTreeList = new ArrayList<>();
        for (OrganizationPojo orgPojo: list){
            if(orgPojo.getName().equals(name)){
                orgTreeList.add(orgPojo);
            }
        }

        for(OrganizationPojo orgPojo: orgTreeList){
            orgPojo.setChildren(this.getOrgTree(list,orgPojo.getCode()));
        }
        return orgTreeList;
    }

    /**
     * 根据id集合字符串更新组织关系的顺序关系
     *
     * @param midIds
     * @param ids
     * @param pcode
     * @param minSort
     * @return
     * @throws Exception
     */
    public boolean updateOrgTreeByIds(String midIds,String ids,String pcode,String minSort)throws Exception{
        SqlSession ss = null;
        try {
            ss = getSqlSession();
            String[] ids_ = ids.split(",");
            List<String> idlist = Arrays.asList(ids_);
            int sort = Integer.valueOf(minSort);

            for (int i=0;i<idlist.size();i++){

                HashMap<String,Object> map = new HashMap<>();
                map.put("id",idlist.get(i));
                map.put("sort",sort + i);
                ss.update("Organization.updateSortById", map);
            }
            this.updatePcodeByIds(midIds,pcode);
            return true;
        }catch (Exception x) {
            logger.error("Class OrganizationService,Method updateSort,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
                return false;
            }
        }
    }

    /**
     * 根据id集合字符串更新组织关系的父子关系
     *
     * @param ids
     * @param pcode
     * @return
     * @throws Exception
     */
    public boolean updatePcodeByIds(String ids,String pcode)throws Exception{
        SqlSession ss = null;
        try {
            ss = getSqlSession();
            String[] ids_ = ids.split(",");
            List<String> idlist = Arrays.asList(ids_);

            HashMap<String,Object> map = new HashMap<>();
            map.put("list",idlist);
            map.put("pcode",pcode);
            ss.update("Organization.updatePcodeByIdList", map);
            return true;
        }catch (Exception x) {
            logger.error("Class OrganizationService,Method updatePcodeByIds,sqlSession Execution exception", x);
            throw x;
        } finally {
            if (ss != null) {
                ss.close();
                return false;
            }
        }

    }

    //Test
    public static void main(String[] args) throws Exception {
        String configs[] = new String[]{"appConf/spring-context.xml", "classpath:appConf/spring-database.xml"};
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(configs);
        OrganizationService service = (OrganizationService)context.getBean("OrganizationService");

        OrganizationPojo p = new OrganizationPojo();
        List<OrganizationPojo> orgList = service.select(p);
        List<OrganizationPojo> orgTree = service.getOrgTree(orgList,"-1");
        System.out.println(ClientResUtil.getResponseToClient(true,"",orgList));
    }
}
