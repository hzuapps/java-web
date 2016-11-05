package indi.xiao.ext.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/10/18.
 */
public class ClientResUtil {
    public static Logger logger =  LoggerFactory.getLogger(ClientResUtil.class);
    public static String getResponseToClient(boolean success,String extInfo,Object dataArea){
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("success",success);
        map.put("msg",extInfo);
        map.put("data",dataArea);
        String reJson = "";
        try{
            reJson = JsonUtil.objectToJson(map);
        }catch (Exception e){
            logger.error("ClientResUtil getResponseToClient 对象json转换异常: " + map);
        }
        return reJson;
    }
}
