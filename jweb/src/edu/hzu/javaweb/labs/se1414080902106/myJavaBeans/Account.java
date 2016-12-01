package edu.hzu.javaweb.labs.se1414080902106.myJavaBeans;

//负责提供注册、登录、注销操作的相关内容
public class Account extends MyJavaBean {
  private int id;
  private String username;
  private String password;
  private String name;
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public String getUsername() {
    return username;
  }
  public void setUsername(String username) {
    this.username = username;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  @Override
  public String getGetSQL(int method) {
    switch (method) {
    case 0:
      in = new int[2];
      in[0] = 1;
      in[1] = 2;
      out = new int[2];
      out[0] = 0;
      out[1] = 3;
      return "Login @username='?',@password='?'";
    case 1:
      in = new int[1];
      in[0] = 0;
      out = new int[1];
      out[0] = 3;
      return "GetAccount @id=?";
    }
    return null;
  }
  @Override
  public String getInsertSQL() {
    in = new int[3];
    in[0] = 1;
    in[1] = 2;
    in[2] = 3;
    return "CreateAccount @username='?',@password='?',@name='?'";
  }
  @Override
  public String getDeleteSQL() {
    in = new int[1];
    in[0] = 1;
    return "DeleteAccount @username='?'";
  }
  @Override
  public String toString() {
    return "{" +
        "\"id\" : \"" + id + "\", " +
        "\"username\" : \"" + username + "\", " +
        "\"password\" : \"" + password + "\", " +
        "\"name\" : \"" + name + "\"}";
  }
}
