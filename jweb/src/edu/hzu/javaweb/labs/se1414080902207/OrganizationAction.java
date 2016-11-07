package indi.xiao.app.organization.action;

import indi.xiao.app.databaseDef.OrganizationPojo;
import indi.xiao.ext.common.AppBaseAction;
import indi.xiao.ext.util.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import indi.xiao.app.organization.OrganizationService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 组织处理
 *
 * @author zhongyuan.yang
 */
@Controller
@RequestMapping("/organization")
public class OrganizationAction extends AppBaseAction {
    public static Logger logger = LoggerFactory.getLogger(OrganizationAction.class);

    @Resource(name = "OrganizationService")
    private OrganizationService OrganizationService;
    

    /**
     * 修改组织对象
     *
     * @param params   HashMap<String,String>
     * @param pojo     OrganizationPojo
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     */
    @RequestMapping("doUpdateOrg")
    public void doUpdateOrg(@RequestParam HashMap<String, String> params, OrganizationPojo pojo, HttpServletRequest request, HttpServletResponse response) {

        //参数检查
        String id = params.get("id");
        String code = params.get("code");

        if (code == null || code.length() == 0) {
            logger.error("OrganizationAction --- doUpdateOrg error . " + JsonUtil.genInfoJsonStr(pojo), "参数异常，没有传入组织码code。");
            postStrToClient(JsonUtil.genInfoJsonStr(false, "参数异常，没有传入组织码code。"),response);
            return;
        }
        if (id==null && id.length() <= 0) {
            logger.error("OrganizationAction --- doUpdateOrg error . " + JsonUtil.genInfoJsonStr(pojo), "参数异常，没有传入唯一标志id。");
            postStrToClient(JsonUtil.genInfoJsonStr(false, "参数异常，没有传入唯一标志id。"), response);
            return;
        }
        try {

            // 获取更新前的组织数据
            if(OrganizationService.selectById(pojo.getId())==null) {
                postStrToClient(JsonUtil.genInfoJsonStr(false, "所要更新组织不存在", pojo), response);
                return;
            }
            // 更新组织数据
            OrganizationService.updateById(pojo);

            postStrToClient(JsonUtil.genInfoJsonStr(true, "组织修改成功。", pojo), response);
            return;
        } catch (Exception x) {
            logger.error("OrganizationAction --- doSave error . " + JsonUtil.genInfoJsonStr(pojo), x);
            postStrToClient(JsonUtil.genInfoJsonStr(false, "操作由于异常失败。", pojo), response);
        }
    }


    /**
     * 添加组织对象
     *
     * @param params   HashMap<String,String>
     * @param pojo     OrganizationPojo
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     */
    @RequestMapping("doAddOrg")
    public void doAddOrg(@RequestParam HashMap<String, String> params, OrganizationPojo pojo, HttpServletRequest request, HttpServletResponse response) {

        // 登陆用户所属prjCode的获取
        String prjCode = params.get("u_prjCode");
        // 必须传入参数
        if (prjCode == null || "".equals(prjCode)) {
            logger.error("OrganizationAction --- doSave error . 参数异常，没有传入服务标识");
            postStrToClient(JsonUtil.genInfoJsonStr(false, "参数异常，没有传入服务标识", prjCode), response);
            return;
        }

        //参数检查
        String code = pojo.getCode();
        String pcode = pojo.getPcode();

        if (code == null || "".equals(code)) {
            logger.error("OrganizationAction --- doAddOrg error . " + JsonUtil.genInfoJsonStr(pojo), "参数异常，没有传入组织码code。");
            postStrToClient(JsonUtil.genInfoJsonStr(false, "参数异常，没有传入组织码code。"), response);
            return;
        }

        if (pcode==null && "".equals(pcode)) {
            logger.error("OrganizationAction --- doAddOrg error . " + JsonUtil.genInfoJsonStr(pojo), "参数异常，没有传入父组织码pcode。");
            postStrToClient(JsonUtil.genInfoJsonStr(false, "参数异常，没有传入父组织码pcode"), response);
            return;
        }

        try {

            // 是否已存在该组织
            if(OrganizationService.exist(pojo.getCode())){
                postStrToClient(JsonUtil.genInfoJsonStr(false, "该组织已存在", pojo), response);
                return;
            }
            // 新建
            OrganizationService.insert(pojo);
            postStrToClient(JsonUtil.genInfoJsonStr(true, "组织新建成功。", pojo), response);
        } catch (Exception x) {
            x.printStackTrace();
            logger.error("OrganizationAction --- doSave error . " + JsonUtil.genInfoJsonStr(pojo), x);
            postStrToClient(JsonUtil.genInfoJsonStr(false, "操作由于异常失败。", pojo), response);
        }
    }


    /**
     * 更新组织关系的顺序关系
     *
     * @param params   HashMap<String,String>
     * @param pojo     OrganizationPojo
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     */
    @RequestMapping("doUpdateOrgTree")
    public void doUpdateOrgTree(@RequestParam HashMap<String, String> params, OrganizationPojo pojo, HttpServletRequest request, HttpServletResponse response){

        String ids = params.get("ids");
        String midIds = params.get("midIds");
        if (midIds.length() <=0 || ids.length() <= 0) {
            postStrToClient(JsonUtil.genInfoJsonStr(false, "未重排组织。。", ids), response);
            return;
        }
        String minSort = params.get("minSort");
        if (minSort==null||!minSort.matches("\\d+(.\\d+)?")) {
            postStrToClient(JsonUtil.genInfoJsonStr(false, "未知的排序参数。。", minSort), response);
            return;
        }

        String pcode = params.get("pcode");
        if (pcode == null || "".equals(pcode)) {
            logger.error("OrganizationAction --- doUpdateOrgTree error . 参数异常，没有传入父组织码");
            postStrToClient(JsonUtil.genInfoJsonStr(false, "参数异常，没有传入父组织码", pcode), response);
            return;
        }

        try {
            OrganizationService.updateOrgTreeByIds(midIds, ids, pcode, minSort);
            postStrToClient(JsonUtil.genInfoJsonStr(true, "组织关系更新成功。", ids), response);
            return;
        } catch (Exception x) {
            logger.error("OrganizationAction --- doUpdateOrgTree error . " + ids, x);
            postStrToClient(JsonUtil.genInfoJsonStr(false, "操作由于异常失败。", ids), response);
        }
    }

    /**
     * 删除组织对象
     *
     * @param params   HashMap<String,String>
     * @param pojo     OrganizationPojo
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     */
    @RequestMapping("doDelete")
    public void doDelete(@RequestParam HashMap<String, String> params, OrganizationPojo pojo, HttpServletRequest request, HttpServletResponse response) {

        String ids = params.get("ids");
        if (ids.length() <= 0) {
            postStrToClient(JsonUtil.genInfoJsonStr(false, "请选择要删除的数据。。", ids), response);
            return;
        }
        try {

            String[] ids_ = ids.split(",");
            List idlist = Arrays.asList(ids_);
            for (OrganizationPojo pojos : OrganizationService.selectByIds(idlist)) {
                // 更新组织disable为1，逻辑删除子组织
                OrganizationService.updataDisable(idlist);
                OrganizationService.deleteRelation(pojos.getCode());
            }
            postStrToClient(JsonUtil.genInfoJsonStr(true, "数据删除成功。", ids), response);
            return;
        } catch (Exception x) {
            logger.error("OrganizationAction --- doDelete error . " + ids, x);
            postStrToClient(JsonUtil.genInfoJsonStr(false, "操作由于异常失败。", ids), response);
        }
    }

    /**
     * 拉取组织树信息
     * 显示在页面上
     *
     * @param params
     * @param pojo
     * @param request
     * @param response
     */
    @RequestMapping("doSelectAllOrgTree")
    public void doSelectAllOrgTree(@RequestParam HashMap<String, String> params, OrganizationPojo pojo, HttpServletRequest request, HttpServletResponse response) {

        try {

            pojo.setDisable("0");
            List<OrganizationPojo> pojoList = OrganizationService.select(pojo);

            List<OrganizationPojo> orgTree = OrganizationService.getOrgTree(pojoList,"-1");
            postStrToClient(JsonUtil.genInfoJsonStr(orgTree), response);
        } catch (Exception x) {
            //执行过程中出现异常，则记录log，并返回错误消息
            logger.error("OrganizationAction --- doSelectAllOrgTree error . " + JsonUtil.genInfoJsonStr(pojo), x);
            postStrToClient(JsonUtil.genInfoJsonStr(false, "操作由于异常失败。", pojo), response);
        }
    }


    /**
     * 拉取组织树信息(查询结果）
     * 显示在页面上
     *
     * @param params
     * @param pojo
     * @param request
     * @param response
     */
    @RequestMapping("doSelectOneOrgTree")
    public void doSelectOneOrgTree(@RequestParam HashMap<String, String> params, OrganizationPojo pojo, HttpServletRequest request, HttpServletResponse response) {


        //组织名称
        String orgName = params.get("orgName");
        if (orgName == null || orgName.length() == 0) {
            logger.error("OrganizationAction --- doSelectOneOrgTree error . " + JsonUtil.genInfoJsonStr(pojo), "参数异常，没有传入组织名称。");
            postStrToClient(JsonUtil.genInfoJsonStr(false, "参数异常，没有传入组织名称。"), response);
            return;
        }

        try {

            pojo.setDisable("0");
            List<OrganizationPojo> pojoList = OrganizationService.select(pojo);

            List<OrganizationPojo> orgTree = OrganizationService.getOrgTreeByName(pojoList,orgName);
            postStrToClient(JsonUtil.genInfoJsonStr(orgTree), response);
        } catch (Exception x) {
            //执行过程中出现异常，则记录log，并返回错误消息
            logger.error("OrganizationAction --- doSelectOneOrgTree error . " + JsonUtil.genInfoJsonStr(pojo), x);
            postStrToClient(JsonUtil.genInfoJsonStr(false, "操作由于异常失败。", pojo), response);
        }
    }
}
