package edu.hzu.javaweb.labs.se1414080902134;

import java.util.Iterator;
import java.util.List;

public class toJson {
	public static String buildToJson(List<note> nd,String op){
		StringBuilder sb  = new StringBuilder();
		Iterator<note> ind = nd.iterator();
		sb.delete(0, sb.length());
		sb.append("{\"op\":\"" + op + "\",\"note\":[");
		while (ind.hasNext()) {
			sb.append(noteToJson(ind.next()) + ",");
		}
		sb.deleteCharAt(sb.length() - 1);
		sb.append("]}");
		return sb.toString();
	}
	public static String noteToJson(note n){
		StringBuilder sb = new StringBuilder();
		sb.delete(0,sb.length());
		sb.append("{\"id\":\"" + n.getId() + "\",");
		sb.append("\"title\":\"" + n.getTitle() + "\",");
		sb.append("\"content\":\"" + n.getContent() + "\",");
		sb.append("\"QCode\":\"" + n.getQuickCode() + "\",");
		sb.append("\"time\":\"" + n.getLastTime().toLocaleString() + "\"}");
		return sb.toString();
	}
}
