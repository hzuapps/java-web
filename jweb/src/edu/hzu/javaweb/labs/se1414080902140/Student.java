package edu.hzu.javaweb.labs.se1414080902140;

public class Student {
	private String name, sex,
	 sno, age, hight, weight, pulmonary,
	 longRun, shortRun;

	public Student(String name, String sex, String sno, String age,
			String hight, String weight, String pulmonary, String longRun,
			String shortRun) {
		super();
		this.name = name;
		this.sex = sex;
		this.sno = sno;
		this.age = age;
		this.hight = hight;
		this.weight = weight;
		this.pulmonary = pulmonary;
		this.longRun = longRun;
		this.shortRun = shortRun;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getHight() {
		return hight;
	}

	public void setHight(String hight) {
		this.hight = hight;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getPulmonary() {
		return pulmonary;
	}

	public void setPulmonary(String pulmonary) {
		this.pulmonary = pulmonary;
	}

	public String getLongRun() {
		return longRun;
	}

	public void setLongRun(String longRun) {
		this.longRun = longRun;
	}

	public String getShortRun() {
		return shortRun;
	}

	public void setShortRun(String shortRun) {
		this.shortRun = shortRun;
	}


	

}

