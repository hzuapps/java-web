package indi.xiao.ext.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/10/18.
 */
public class JsonUtil {
    public static Logger logger = LoggerFactory.getLogger(JsonUtil.class);
    public static ObjectMapper mapper = new ObjectMapper();
    public static String objectToJson(Object obj) throws Exception{
        String json = mapper.writeValueAsString(obj);
        return json;
    }

    public static String genInfoJsonStr(boolean success,String extInfo,Object dataArea){
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

    public static String genInfoJsonStr(boolean success, String extInfo){
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("success",success);
        map.put("msg",extInfo);
        String reJson = "";
        try{
            reJson = JsonUtil.objectToJson(map);
        }catch (Exception e){
            logger.error("ClientResUtil getResponseToClient 对象json转换异常: " + map);
        }
        return reJson;
    }

    public static String genInfoJsonStr(Object info){
        String reJson = "";
        try{
            reJson = JsonUtil.objectToJson(info);
        }catch (Exception e){
            logger.error("ClientResUtil getResponseToClient 对象json转换异常: " + info);
        }
        return reJson;
    }
}
