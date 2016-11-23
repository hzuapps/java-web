package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Bean.Student;
public  class StudentDao {
      protected final static String str="sno,name,sex,age,weight,hight,longRun,shortRun,pulmonary";
       protected static String insertSql="insert into stu_info("+str+")"+"values(?,?,?,?,?,?,?,?,?)";
	   protected static String selectSql="select "+str+" from stu_info where sno=?";
	   protected static String updateSql="update stu_info set "+"sno=?,name=?,sex=?,age=? ,weight=?,hight=?,longRun=?,shortRun=?,pulmonary=?";
		protected static String deleteSql="delete from stu_info where sno=?";
		public int create(Student stu) throws Exception{
			 Connection con=null;
		      PreparedStatement ps=null;
		      ResultSet rs=null;
		      int n=-1;
		      try{
		    	  con=JdbcUtil.getConnection();
		    	  ps =con.prepareStatement(insertSql); 
		    	  ps.setInt(1,stu.getSno());
		    	  ps.setString(2,stu.getName());
		    	  ps.setString(3,stu.getSex());
		    	  ps.setInt(4,stu.getAge());
		    	  ps.setDouble(5,stu.getWeight());
		    	  ps.setDouble(6,stu.getHight()); 
		    	  ps.setDouble(7, stu.getLongRun());
		    	  ps.setDouble(8,stu.getShortRun());
		    	  ps.setInt(9,stu.getPulmonary());
		          n = ps.executeUpdate();
		          
		      } catch(Exception e){
		    	  e.printStackTrace(); 
		      } finally{
		    	    JdbcUtil.close(rs, ps, con);
		      }
		     return n;
		}
	
		public Student find(Student stu) throws Exception {
		    Connection con=null;
		    PreparedStatement ps=null;
		    ResultSet rs=null;
		    Student stu2 = null;
		    int n=-1;
		    try {
		       con=JdbcUtil.getConnection();
	            ps = con.prepareStatement(selectSql);
	            ps.setInt(1,stu.getSno());
	            rs = ps.executeQuery();
	            if (rs.next()){
	            	stu2 = new Student();
	                stu2.setSno(rs.getInt(1)); 
	                stu2.setName(rs.getString(2));
	                stu2.setSex(rs.getString(3));
	                stu2.setAge(rs.getInt(4)); 
	                stu2.setWeight(rs.getDouble(5));
	                stu2.setHight(rs.getDouble(6)); 
	                stu2.setLongRun(rs.getDouble(7));
	                stu2.setShortRun(rs.getDouble(8));
	                stu2.setPulmonary(rs.getInt(9));
	           }
	      } catch (Exception e) {
	    	  e.printStackTrace(); 
	      } finally {
	    	     JdbcUtil.close(rs, ps, con);
	      }
	     return stu2;
		}
	   
		public List<Student> findAll() throws Exception {
			Connection con=null;
		    PreparedStatement ps=null;
		    ResultSet rs=null;	
		    List<Student> student = new ArrayList<Student>();
		    con=JdbcUtil.getConnection();
		    ps = con.prepareStatement("select * from stu_info");
	        rs = ps.executeQuery();
	        while(rs.next()) {
	        	Student stu2 = new Student();
	            stu2.setSno(rs.getInt(1)); 
	            stu2.setName(rs.getString(2));
	            stu2.setSex(rs.getString(3));
	            stu2.setAge(rs.getInt(4)); 
	            stu2.setWeight(rs.getDouble(5));
	            stu2.setHight(rs.getDouble(6)); 
	            stu2.setLongRun(rs.getDouble(7));
	            stu2.setShortRun(rs.getDouble(8));
	            stu2.setPulmonary(rs.getInt(9));
	            student.add(stu2);
	        }
	        JdbcUtil.close(rs, ps, con); 
	        return student;
		}
	
		public int remove(Student stu) throws Exception {
			Connection con=null;
		    PreparedStatement ps=null;
		    ResultSet rs=null;
		    int n=-1;
		    try {
		    	con=JdbcUtil.getConnection();
		    	ps = con.prepareStatement(deleteSql);
		        ps.setInt(1,stu.getSno());
		        
		        n = ps.executeUpdate();
		    }catch(Exception e) {
		    	e.printStackTrace(); 
		    } finally{
		    	 JdbcUtil.close(rs, ps, con);
		    }
		    return n;
		}
	
		public void update(Student stu) throws Exception {
			Connection con=null;
		    PreparedStatement ps=null;
		    ResultSet rs=null;
		    try {
		    	con=JdbcUtil.getConnection();
	         ps = con.prepareStatement(updateSql);
	         ps.setInt(1,stu.getSno());
		    	ps.setString(2,stu.getName());
		    	ps.setString(3,stu.getSex());
		    	ps.setInt(4,stu.getAge());
		    	ps.setDouble(5,stu.getWeight());
		    	ps.setDouble(6,stu.getHight());
		    	ps.setDouble(7, stu.getLongRun());
		    	ps.setDouble(8, stu.getShortRun());
		    	ps.setInt(9, stu.getPulmonary());
		    	int rowCount=ps.executeUpdate();
	            if (rowCount == 0) {
	                   throw new Exception("Update Error:Student sno:" + stu.getSno());
	            }
	        } catch (Exception e) {
	               e.printStackTrace(); 
	        } finally {
	        	 JdbcUtil.close(rs, ps, con);
	        }
	    }
	}
				
		

