package edu.hzu.javaweb.labs.se1414080902106.myJavaBeans;

import java.sql.*;

//负责发帖、删帖、看帖操作的相关内容
public class Posts extends MyJavaBean{
  private int id;
  private int aid;
  private String title;
  private String text;
  private Date createDateTime;
  private int replyCount;   //回复数
  private String name;      //作者昵称
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public int getAid() {
    return aid;
  }
  public void setAid(int aid) {
    this.aid = aid;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getText() {
    return text;
  }
  public void setText(String text) {
    this.text = text;
  }
  public Date getCreateDateTime() {
    return createDateTime;
  }
  public void setCreateDateTime(Date createDateTime) {
    this.createDateTime = createDateTime;
  }
  public int getReplyCount() {
    return replyCount;
  }
  public void setReplyCount(int replyCount) {
    this.replyCount = replyCount;
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
      in = new int[1];
      in[0] = 0;
      out = new int[7];
      out[0] = 0;
      out[1] = 1;
      out[2] = 2;
      out[3] = 3;
      out[4] = 4;
      out[5] = 5;
      out[6] = 6;
      return "GetPosts @id=?";
    case 1:
      in = null;
      out = new int[6];
      out[0] = 0;
      out[1] = 2;
      out[2] = 1;
      out[3] = 6;
      out[4] = 4;
      out[5] = 5;
      return "GetAllPosts";
    case 2:
      in = new int[1];
      in[0] = 1;
      out = new int[4];
      out[0] = 0;
      out[1] = 2;
      out[2] = 4;
      out[3] = 5;
      return "GetSomePosts @aid=?";
    }
    return null;
  }
  @Override
  public String getInsertSQL() {
    in = new int[3];
    in[0] = 1;
    in[1] = 2;
    in[2] = 3;
    return "CreatePosts @aid=?,@title='?',@text='?'";
  }
  @Override
  public String getDeleteSQL() {
    in = new int[1];
    in[0] = 0;
    return "DeletePosts @id=?";
  }
  @Override
  public String toString() {
    return "{" +
        "\"id\" : \"" + id + "\", " +
        "\"aid\" : \"" + aid + "\", " +
        "\"title\" : \"" + title + "\", " +
        "\"text\" : \"" + text + "\", " +
        "\"createDateTime\" : \"" + formatDT(createDateTime) + "\", " +
        "\"name\" : \"" + name + "\", " +
        "\"replyCount\" : \"" + replyCount + "\"}";
  }
}
