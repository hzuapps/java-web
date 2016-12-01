package edu.hzu.javaweb.labs.se1414080902134;

import java.util.Date;

public class Labels {
	private String title;
	private String content;
	private String time;
	private String quickCode;
	public String getQuickCode() {
		return quickCode;
	}
	public void setQuickCode(String quickCode) {
		this.quickCode = quickCode;
	}
	private Object other;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Object getOther() {
		return other;
	}
	public void setOther(Object other) {
		this.other = other;
	}
}
