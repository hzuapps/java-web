package JDBC_package;
import java.sql.*;
public class JDBC_package {
	private static Connection conn=null;
	private static String url;
	private static int sql_result;
	public static ResultSet result =null;
	public static Statement stmt = null;
	public static String account;
	public static String password;
	
	public static String name="";
	public static String birthplace="";
	public static String birthday="";
	public static String sex="";
	public static String email="";
	public static String graduate="";
	public static String personimg="";
	public static String skill="";
	public static String work_exp="";
	public static String education_bg="";
	public static String evaluate1="";
	public static String evaluate2="";
	public static int age=0;
	public static String telephone="";
	
	public static void getstmt() throws SQLException
	{ 
		stmt = conn.createStatement();
	}
	
	/*���������ݿ�ĵ�ַ���г�ʼ������*/
	public static void getUrl(String Port,String Database,String Uid,String Pwd)
	{
		url = "jdbc:mysql://localhost:"+Port+"/"+Database+"?user="+Uid+"&password="+Pwd+"&userUnicode=true&charterEncoding=UTF-8";
	}
	
	/*���ݿ����ӷ���*/
	public static void SqlConnection() throws SQLException
	{
		new com.mysql.jdbc.Driver();
		conn = DriverManager.getConnection(url);
	}
	
	/*�������ݿ����*/
	public static void create_table(String create_table_sql) throws SQLException
	{
		//stmt = conn.createStatement();
		sql_result = stmt.executeUpdate(create_table_sql);
	}
	
	/*�������ݿ��ķ���*/
	public static void update_table(String update_table_sql) throws SQLException
	{
		sql_result = stmt.executeUpdate(update_table_sql);
	}
	
	/*�������ݵ����ݿ�ķ���*/
	public static void insert_table(String insert_table_sql) throws SQLException
	{
		//stmt = conn.createStatement();
		sql_result = stmt.executeUpdate(insert_table_sql);
	}
	
	/*��ѯ���ݿ�ķ���*/
	public static void select_table(String select_table_sql) throws SQLException
	{
		//stmt = conn.createStatement();
		result = stmt.executeQuery(select_table_sql);
	}
	
	/*�ر����ݿ�����*/
	public static void sql_close() throws SQLException
	{
			result.close();
			conn.close();
	}
	
	/*��ȡ�˺���Ϣ*/
	public static void user_get(String Account,String Password)
	{
			account = Account;
			password = Password;
	}
}
