package edu.hzu.javaweb.labs.se1414080902223;

import java.util.List;
import edu.hzu.javaweb.labs.se1414080902223.Score;

public interface IStudentDAO {
	
	public abstract Score create(Score stu) throws Exception;//添加记录
	public abstract void remove(Score stu) throws Exception;//删除记录
	public abstract Score find(Score stu) throws Exception;//查询记录
	public abstract List<Score> findAll() throws Exception; //列出记录
	public abstract void update(Score stu) throws Exception; //修改记录
	
}