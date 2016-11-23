package edu.hzu.javaweb.labs.se1414080902134;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

public class notesDao {
	private static String allFiled = "title,content,userid,lasttime,quickCode";
	public note fillNote(note n){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = (Connection) jdbcOne.getConnection();
			if (n.getQuickCode() == null) {
				return null;
			} else {
				ps = conn.prepareStatement("select id," + 
											allFiled + 
											" from notes where quickCode='"
											+ n.getQuickCode() + "'");
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					n.setId(rs.getInt(1));
					n.setTitle(rs.getString(2));
					n.setContent(rs.getString(3));
					n.setUserId(rs.getInt(4));
					n.setLastTime(rs.getDate(5));
					n.setQuickCode(rs.getString(6));
					n.isFill = true;
				}
				jdbcOne.free(rs, ps, conn);
				return n;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}
	public int insert(note n,int userId){
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		if (n == null && !n.isFill) {
			return 0;
		}
		try {
			conn = (Connection) jdbcOne.getConnection();
			ps = conn.prepareStatement("insert into notes (" + 
										allFiled + 
										") values (?,?,?,?,?);");
			ps.setString(1, n.getTitle());
			ps.setString(2, n.getContent());
			ps.setInt(3, userId);
			ps.setDate(4, new java.sql.Date(n.getLastTime().getTime()));
			ps.setString(5, n.getQuickCode());
			//ResultSet rs = ps.executeQuery();
			result = ps.executeUpdate();
			ps.clearBatch();
			ResultSet rs = ps.executeQuery("select max(id) from notes;");
			if (rs.next()) {
				result = rs.getInt(1);
			}
			jdbcOne.free(rs, ps, conn);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public int update(note n,int userId){
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		if (n == null && !n.isFill) {
			return result;
		}
		try {
			conn = (Connection) jdbcOne.getConnection();
			ps = conn.prepareStatement("update notes set " + 
										"title=?," + 
										"content=?," +
						                "userid=?," +
						                "lasttime=?," +
						                "quickCode=? " + 
						                "where id=?;");
			ps.setString(1, n.getTitle());
			ps.setString(2, n.getContent());
			ps.setInt(3, userId);
			ps.setDate(4, new java.sql.Date(n.getLastTime().getTime()));
			ps.setString(5, n.getQuickCode());
			ps.setInt(6, n.getId());
			result = ps.executeUpdate();
			jdbcOne.free(null, ps, conn);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public int delete(note n){
		List<note> notes = new ArrayList<note>();
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		try {
			conn = (Connection) jdbcOne.getConnection();
			ps = conn.prepareStatement("delete from notes where id='" + n.getId() + "';");
			result = ps.executeUpdate();
			jdbcOne.free(null, ps, conn);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public List<note> getAll(int userId){
		List<note> notes = new ArrayList<note>();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = (Connection) jdbcOne.getConnection();
			ps = conn.prepareStatement("select id," +
										allFiled + 
										" from notes order by id desc;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				note n = new note();
				n.setId(rs.getInt(1));
				n.setTitle(rs.getString(2));
				n.setContent(rs.getString(3));
				n.setUserId(rs.getInt(4));
				n.setLastTime(rs.getDate(5));
				n.setQuickCode(rs.getString(6));
				n.isFill = true;
				notes.add(n);
			}
			jdbcOne.free(rs, ps, conn);
			return notes;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notes;
	}
}
