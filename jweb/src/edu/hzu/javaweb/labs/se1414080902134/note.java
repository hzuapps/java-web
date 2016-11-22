package edu.hzu.javaweb.labs.se1414080902134;

import java.util.Date;

public class note {
	private int id;
	private String title;
	private String Content;
	private int userId;
	private Date lastTime;
	private String quickCode;
	public boolean isFill;
	public final int titleMaxLength = 15;
	public final int contentMaxLength = 300;
	public final int quickCodeLength = 6;
	public note() {
		title = null;
		Content = null;
		userId = 0;
		lastTime = null;
		quickCode = null;
		isFill = false;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getLastTime() {
		return lastTime;
	}
	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}
	public String getQuickCode() {
		return quickCode;
	}
	public void setQuickCode(String quickCode) {
		this.quickCode = quickCode;
	}
}
