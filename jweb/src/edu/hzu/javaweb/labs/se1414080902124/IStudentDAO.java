package edu.hzu.javaweb.labs.se1414080902124;

import java.util.List;

/**
 * Created by Administrator on 2016/11/22.
 */
public interface IStudentDAO {
    /**
     * 添加记录的方法
     * */
    public abstract Student insert(Student stu) throws Exception;
    /**
     * 删除记录的方法
     * */
    public abstract void remove(Student stu) throws Exception;
    /**
     * 修改记录的方法
     * */
    public abstract void update(Student stu) throws Exception;
}
