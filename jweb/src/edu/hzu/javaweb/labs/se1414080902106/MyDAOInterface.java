package edu.hzu.javaweb.labs.se1414080902106;

import java.sql.SQLException;
import java.util.Vector;

public interface MyDAOInterface<T> {
  public abstract boolean Insert(T item) throws SQLException;
  public abstract boolean Remove(T item) throws SQLException;
  public abstract Vector<T> get(int method, T param) throws SQLException;
  // public abstract int Do(int method, T param) throws SQLException;
  public abstract void CloseDB();
}
