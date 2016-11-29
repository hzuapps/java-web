
public class Message {
	    //题目名称
		private String titleName;
		//题目年份
		private String age;
		//题目来源
		private String source;
		//所属教研室
		private String teachAndResearch;
		//指导教师
	    private String teacher;
	    //限选人数
	    private String num;

	    public Message(String titleName,String age,String source,String teachAndResearch,String teacher,String num)
	    {
	    	this.titleName = titleName;
	    	this.age = age;
	    	this.source = source;
	    	this.teachAndResearch = teachAndResearch;
	    	this.teacher = teacher;
	    	this.num = num;
	    }

		public void setTitleName(String titleName) {
			this.titleName = titleName;
		}

		public String getAge() {
			return age;
		}

		public void setAge(String age) {
			this.age = age;
		}

		public String getSource() {
			return source;
		}

		public void setSource(String source) {
			this.source = source;
		}

		public String getTeachAndResearch() {
			return teachAndResearch;
		}

		public void setTeachAndResearch(String teachAndResearch) {
			this.teachAndResearch = teachAndResearch;
		}

		public String getTeacher() {
			return teacher;
		}

		public void setTeacher(String teacher) {
			this.teacher = teacher;
		}

		public String getNum() {
			return num;
		}

		public void setNum(String num) {
			this.num = num;
		}

		public String getTitleName() {
			return titleName;
		}

}
