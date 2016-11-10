package indi.xiao.app.databaseDef;

import java.util.List;

/**
 * Created by Administrator on 2016/8/25.
 */
public class OrganizationPojo implements Comparable<OrganizationPojo>{

    /**
     * 业务无关主键
     */
    private String id;

    /**
     * 组织代码
     */
    private String code;

    /**
     * 组织名称
     */
    private String name;

    /**
     * 说明
     */
    private String description;

    /**
     * 父节点代码
     */
    private String pcode;

    /**
     * 节点排序序号
     */
    private Integer sort;

    /**
     * 逻辑删除标志
     */
    private String disable;

    /**
     * 是否已递归标志，默认false
     */
    private boolean dfsVis = false;

    /**
     * 子组织树（递归）
     */
    private List<OrganizationPojo> children;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public Integer getSort() { return sort; }

    public void setSort(Integer sort) { this.sort = sort; }

    public boolean getDfsVis(){
        return dfsVis;
    }

    public void setDfsVis(boolean dfsVis){
        this.dfsVis = dfsVis;
    }

    public List<OrganizationPojo> getChildren() {
        return children;
    }

    public void setChildren(List<OrganizationPojo> children) {
        this.children = children;
    }

    public void setDisable(String disable){
        this.disable = disable;
    }

    public String getDisable(){
        return this.disable;
    }
    /**
     * 重载排序规则
     */
    public int compareTo(OrganizationPojo nb){
        if(this.sort<nb.sort){
            return -1;
        }else{
            return 1;
        }
    }
}
