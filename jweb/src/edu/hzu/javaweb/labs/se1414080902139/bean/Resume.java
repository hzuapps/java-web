package edu.hzu.javaweb.labs.se1414080902139.bean;

public class Resume {

	private String name;
	private String sex;
	private String profession;
	private String education;
	private String tel;
	private String email;
	private String hobby;
	private String experience;
	private String skill;
	private String honor;
	
	public Resume() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Resume(String name, String sex, String profession, String education,
			String tel, String email, String hobby, String experience,
			String skill, String honor) {
		super();
		this.name = name;
		this.sex = sex;
		this.profession = profession;
		this.education = education;
		this.tel = tel;
		this.email = email;
		this.hobby = hobby;
		this.experience = experience;
		this.skill = skill;
		this.honor = honor;
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

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getHonor() {
		return honor;
	}

	public void setHonor(String honor) {
		this.honor = honor;
	}

	
}
