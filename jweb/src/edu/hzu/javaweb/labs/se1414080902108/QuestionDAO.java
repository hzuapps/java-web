package edu.hzu.javaweb.labs.se1414080902108;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
	protected static final String FIELDS_INSERT = "subject,question,answer1,answer2,answer3,answer4,answer";
	protected static String INSERT_SQL = "insert into question_info("
			+ FIELDS_INSERT + ")" + "values(?,?,?,?,?,?,?)";
	protected static String SELECT_ALL_SQL = "select * from question_info";
	protected static String SELECT_SUBJECT_SQL = "select * from subject_info";
	protected static String SELECT_EXAM_SQL = "select * from question_info where subject = ?";
	protected static String INSERT_GRADE_SQL = "insert into grade("
			+ "id,subject,name,grade" + ")" + "values(?,?,?,?)";
	protected static String SELECT_GRADE_SQL = "select * from grade where name = ? and subject = ?";
	
	public int create(Question que) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int n = -1;
		try {
			con = DbConnect.getDBconnection();
			pstmt = con.prepareStatement(INSERT_SQL);
			pstmt.setString(1, que.getSubject());
			pstmt.setString(2, que.getQuestion());
			pstmt.setString(3, que.getAnswer1());
			pstmt.setString(4, que.getAnswer2());
			pstmt.setString(5, que.getAnswer3());
			pstmt.setString(6, que.getAnswer4());
			pstmt.setString(7, que.getAnswer());
			n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(con, pstmt, rs);
		}
		return n;
	}

	public List<Question> findAll() throws Exception {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Question> question = new ArrayList<Question>();
		try {
			con = DbConnect.getDBconnection();
			pstm = con.prepareStatement(SELECT_ALL_SQL);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Question que = new Question();
				que.setSubject(rs.getString(1));
				que.setQuestion(rs.getString(2));
				que.setAnswer1(rs.getString(3));
				que.setAnswer2(rs.getString(4));
				que.setAnswer3(rs.getString(5));
				que.setAnswer4(rs.getString(6));
				que.setAnswer(rs.getString(7));
				question.add(que);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(con, pstm, rs);
		}
		return question;
	}
	
	public List<Question> findSubject() throws Exception {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Question> question = new ArrayList<Question>();
		try {
			con = DbConnect.getDBconnection();
			pstm = con.prepareStatement(SELECT_SUBJECT_SQL);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Question que = new Question();
				que.setSubject(rs.getString(2));
				question.add(que);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(con, pstm, rs);
		}
		return question;
	}
	
	public List<Question> findExam(Question que) throws Exception {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Question> question = new ArrayList<Question>();
		try {
			con = DbConnect.getDBconnection();
			pstm = con.prepareStatement(SELECT_EXAM_SQL);
			pstm.setString(1, que.getSubject());
			rs = pstm.executeQuery();
			while (rs.next()) {
				Question que2 = new Question();
				que2.setQuestion(rs.getString(2));
				que2.setAnswer1(rs.getString(3));
				que2.setAnswer2(rs.getString(4));
				que2.setAnswer3(rs.getString(5));
				que2.setAnswer4(rs.getString(6));
				que2.setAnswer(rs.getString(7));
				question.add(que2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(con, pstm, rs);
		}
		return question;
	}
	
	public int createGrade(String subject,String name,int Grade)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int n = -1;
		try {
			con = DbConnect.getDBconnection();
			pstmt = con.prepareStatement(INSERT_GRADE_SQL);
			pstmt.setInt(1, 1);
			pstmt.setString(2, subject);
			pstmt.setString(3, name);
			pstmt.setInt(4, Grade);
			n = pstmt.executeUpdate();
		} catch (Exception e) {
			
		} finally {
			DbConnect.closeDB(con, pstmt, rs);
		}
		return n;
	}
	
	public int select(String name,String subject) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int grade = 0;
		try {
			con = DbConnect.getDBconnection();
			pstmt = con.prepareStatement(SELECT_GRADE_SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, subject);
            rs = pstmt.executeQuery();
            while(rs.next()){
            	grade = rs.getInt(4);
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(con, pstmt, rs);
		}
		
		return grade;
	}
}
