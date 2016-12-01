package edu.hzu.javaweb.labs.se1414080902210;

import java.util.List;
import edu.hzu.javaweb.labs.se1414080902210.Student;

public interface IStudent  {
	public abstract Student create(Student stu)throws Exception;//增加记录
	public abstract int remove(Student stu)throws Exception;//删除记录
	public abstract Student find(Student stu)throws Exception;//查找记录
	public abstract List<Student> findAll()throws Exception;//列出全部记录的方法
	public abstract int update(Student stu)throws Exception;//修改记录
	
}
