package com.dao;

import java.util.List;
import stu_info.Student;

public interface IStudentDAO {
	
	public abstract Student create(Student stu) throws Exception;//��Ӽ�¼
	public abstract void remove(Student stu) throws Exception;//ɾ����¼
	public abstract Student find(Student stu) throws Exception;//��ѯ��¼
	public abstract List<Student> findAll() throws Exception; //�г���¼
	public abstract void update(Student stu) throws Exception; //�޸ļ�¼
	
}
