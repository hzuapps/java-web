package bean;

public class Messay {
	private int essay_Id, click;
	private String essay_title, classify, user_name;

	public Messay() {
	}

	public Messay(int essay_Id, String essay_title, String classify, int click, String user_name) {
		this.essay_Id = essay_Id;
		this.essay_title = essay_title;
		this.classify = classify;
		this.click = click;
		this.user_name = user_name;
	}

	public int getEssay_Id() {
		return essay_Id;
	}

	public void setEssay_Id(int essay_Id) {
		this.essay_Id = essay_Id;
	}

	public String getEssay_title() {
		return essay_title;
	}

	public void setEssay_title(String essay_title) {
		this.essay_title = essay_title;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

}