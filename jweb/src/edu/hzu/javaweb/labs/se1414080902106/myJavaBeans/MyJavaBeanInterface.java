package edu.hzu.javaweb.labs.se1414080902106.myJavaBeans;

import java.sql.*;

public interface MyJavaBeanInterface {
  public abstract String getGetSQL(int method);
  public abstract String getInsertSQL();
  public abstract String getDeleteSQL();
  //public abstract String getDoSQL(int method);
  public abstract Connection getDBConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException;
  public abstract void closeDB(Connection con, CallableStatement call, ResultSet rs) throws SQLException;
  public abstract void closeDB(Connection con, PreparedStatement ps, ResultSet rs) throws SQLException;
  public abstract void closeDB(Connection con, Statement stmt, ResultSet rs) throws SQLException;
}
