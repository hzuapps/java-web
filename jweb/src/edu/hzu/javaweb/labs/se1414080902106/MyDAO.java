package edu.hzu.javaweb.labs.se1414080902106;

import java.lang.reflect.*;
import java.sql.*;
import java.util.Vector;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

public class MyDAO<T> implements MyDAOInterface<T> {
  private Connection con = null;
  private CallableStatement call = null;
  private ResultSet res = null;

  //T模板类型，即JavaBean的类型
  private final Class TClass;

  public MyDAO(Class TCLASS) {
    TClass = TCLASS;
  }

  //使字符串的首字母大写
  private String firstUpper(String s) {
    return s.substring(0, 1).toUpperCase() + s.substring(1);
  }

  //使完整的类名简化
  private String SimpleTypeName(String Tname) {
    return Tname.substring(Tname.lastIndexOf(".") + 1);
  }

  //填充SQL语句
  private String FillSQL(String SQL, T param, int[] in) throws
  SecurityException,
  NoSuchMethodException,
  IllegalArgumentException,
  IllegalAccessException,
  InvocationTargetException {

    //需要填充的参数个数为0时直接返回
    if (in == null)
      return SQL;

    //获取JavaBean的属性集
    Field[] fs = TClass.getDeclaredFields();

    //填充开始

    String SQLa = null;
    String SQLb = SQL;
    int firstValueIndex;
    String currentSQL = "";
    for (int i = 0; i < in.length; i++) {
      //获取第in[i]个属性的名称，首字母大写
      String Aname = firstUpper(fs[in[i]].getName());
      //获取JavaBean的get方法
      Method get = TClass.getMethod("get" + Aname);
      //获取属性值
      Object value = get.invoke(param);
      //构建SQL语句
      firstValueIndex = SQLb.indexOf("?");
      //若没有?就结束
      if (firstValueIndex == -1)
        break;
      SQLa = SQLb.substring(0, firstValueIndex);
      SQLb = SQLb.substring(firstValueIndex + 1);
      currentSQL = currentSQL + SQLa + value;
    }
    currentSQL += SQLb;
    return currentSQL;
  }

  //简单的更新，更新所需数据在item里，更新所对应的语句是SQL，成功返回true
  public boolean SimpleUpdate(T item, String SQL) throws SQLException {
    int line = 0;
    try {
      //获取JavaBean的属性集
      Field[] fs = TClass.getDeclaredFields();
      //获取相关属性序号数组
      int[] in = (int[]) TClass.getField("in").get(item);
      //填充参数数据到SQL语句
      SQL = FillSQL(SQL, item, in);
      //获取对应数据库连接
      con = ((MyJavaBean) item).getDBConnection();
      //创建SQL执行体
      call = con.prepareCall(SQL);
      //执行更新语句
      line = call.executeUpdate();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SecurityException e) {
      e.printStackTrace();
    } catch (NoSuchMethodException e) {
      e.printStackTrace();
    } catch (IllegalArgumentException e) {
      e.printStackTrace();
    } catch (InvocationTargetException e) {
      e.printStackTrace();
    } catch (NoSuchFieldException e) {
      e.printStackTrace();
    } catch (InstantiationException e) {
      e.printStackTrace();
    } catch (IllegalAccessException e) {
      e.printStackTrace();
    }
    CloseDB();
    return line == 1;
  }

  @Override
  //执行第method号的get操作，所需参数是param
  public Vector<T> get(int method, T param) throws SQLException {
    Vector<T> result = null;
    try {
      //获取SQL语句
      String SQL = ((MyJavaBean) param).getGetSQL(method);
      //获取相关属性序号数组
      int[] in = (int[]) TClass.getField("in").get(param);
      int[] out = (int[]) TClass.getField("out").get(param);
      //填充参数数据到SQL语句
      SQL = FillSQL(SQL, param, in);
      //获取对应数据库连接
      con = ((MyJavaBean) param).getDBConnection();
      //创建SQL执行体
      call = con.prepareCall(SQL);
      //执行SQL语句
      res = call.executeQuery();
      //创建结果集对象
      result = new Vector<T>(0);
      //获取JavaBean的属性集
      Field[] fs = TClass.getDeclaredFields();
      //填充结果
      MyJavaBean current = null;
      while (res.next()) {
        //创建新的记录对象(JavaBean对象)
        current = (MyJavaBean) TClass.newInstance();
        //把结果集的当前记录写入current
        for (int i = 0; i < out.length; i++) {
          //获取第i个属性的类型
          Class Type = fs[out[i]].getType();
          //获取第i个属性的类型名，简洁且首字母大写的类名
          String Tname = firstUpper(SimpleTypeName(Type.getName()));
          //获取第i个属性的名称，首字母大写
          String Aname = firstUpper(fs[out[i]].getName());
          //获取JavaBean的set方法
          Method set = TClass.getMethod("set" + Aname, Type);
          //获取ResultSet的get方法
          Method get = null;
          if ("Date".equals(Tname)) {
            Timestamp ts = res.getTimestamp(i + 1);
            set.invoke(current, new Date(ts.getTime()));
          } else {
            get = ResultSet.class.getMethod("get" + Tname, int.class);
            //获取结果集并写入current里
            set.invoke(current, get.invoke(res, i + 1));
          }
        }
        //把写好的current加入结果集result
        result.add((T) current);
      }
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SecurityException e) {
      e.printStackTrace();
    } catch (NoSuchMethodException e) {
      e.printStackTrace();
    } catch (IllegalArgumentException e) {
      e.printStackTrace();
    } catch (InvocationTargetException e) {
      e.printStackTrace();
    } catch (NoSuchFieldException e) {
      e.printStackTrace();
    } catch (InstantiationException e1) {
      e1.printStackTrace();
    } catch (IllegalAccessException e1) {
      e1.printStackTrace();
    }
    CloseDB();
    return result;
  }

  //插入记录item
  public boolean Insert(T item) throws SQLException {
    return SimpleUpdate(item, ((MyJavaBean) item).getInsertSQL());
  }

  //删除记录item
  public boolean Remove(T item) throws SQLException {
    return SimpleUpdate(item, ((MyJavaBean) item).getDeleteSQL());
  }

  /*	@Override
	//执行第method号的普通操作，参数是param，返回执行结果代号
	public int Do(int method,T param) throws SQLException {
		int result = -1;
		try {
			//获取SQL语句
			String SQL = ((MyJavaBean)param).getDoSQL(method);
			//获取相关属性序号数组
			int[] in = (int[])TClass.getField("in").get(param);
			//填充参数数据到SQL语句
			SQL = FillSQL(SQL,param,in);
			//获取对应数据库连接
			con = ((MyJavaBean)param).getDBConnection();
			//创建SQL执行体
			call = con.prepareCall(SQL);
			call.registerOutParameter(1,Types.INTEGER);
			//执行SQL语句
			call.execute();
			//返回返回值
			result = call.getInt(1);
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		CloseDB();
		return result;
	}
   */
  @Override
  //关闭现有的数据库连接
  public void CloseDB() {
    try {
      MyJavaBean main = (MyJavaBean) TClass.newInstance();
      main.closeDB(con, call, res);
      con = null;
      call = null;
      res = null;
    } catch (SQLException e) {
      e.printStackTrace();
    } catch (InstantiationException e) {
      e.printStackTrace();
    } catch (IllegalAccessException e) {
      e.printStackTrace();
    }
  }

}
