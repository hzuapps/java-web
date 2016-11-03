package edu.hzu.javaweb.labs.se1414080902226;

public class ReturnInfo {
	private String isSuccess;
	private String zhanghao ;
	public String getIsSuccess() {
		return isSuccess;
	}
	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}
	public String getZhanghao() {
		return zhanghao;
	}
	public void setZhanghao(String zhanghao) {
		this.zhanghao = zhanghao;
	}
	@Override
	public String toString() {
		return "ReturnInfo [isSuccess=" + isSuccess + ", zhanghao=" + zhanghao
				+ "]";
	}
	
}
