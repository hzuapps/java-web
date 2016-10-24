/**
 * 
 */
package edu.hzu.javaweb.bean;

/**
 * @author zengsn
 * @since 8.0
 */
public class UserData {
	private String name;
	private String email;
	private String birthday;
	private String birthplace;
	private String graduate;
	private String skill;
	private String workexp;
	private String telephone;
	private String education_bg;
	private String evaluate1;
	private String evaluate2;
	private String sex;
	private int age;

	public void setUsername(String value) {
		name = value;
	}

	public void setEmail(String value) {
		email = value;
	}

	public void setAge(int value) {
		age = value;
	}
	
	public void setbirthday(String value)
	{
		birthday = value;
	}
	public void setbirthplace(String value)
	{
		birthplace = value;
	}
	public void setgraduate(String value)
	{
		graduate = value;
	}
	public void setskill(String value)
	{
		skill = value;
	}
	public void setworkexp(String value)
	{
		workexp = value;
	}
	public void settelephone(String value)
	{
		telephone = value;
	}
	public void seteducation_bg(String value)
	{
		education_bg = value;
	}
	public void setevaluate1(String value)
	{
		evaluate1 = value;
	}
	public void setevaluate2(String value)
	{
		evaluate2  = value;
	}
	public void setsex(String value)
	{
		sex = value;
	}
	
	public String getUsername() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public int getAge() {
		return age;
	}
	public String getbirthday()
	{
		return birthday;
	}
	public String getbirthplace()
	{
		return birthplace;
	}
	public String getgraduate()
	{
		return graduate;
	}
	public String getskill()
	{
		return skill;
	}
	public String getworkexp()
	{
		return workexp;
	}
	public String gettelephone()
	{
		return telephone;
	}
	public String geteducation_bg()
	{
		return education_bg;
	}
	public String getevaluate1()
	{
		return evaluate1;
	}
	public String getevaluate2()
	{
		return evaluate2;
	}
	public String getsex()
	{
		return sex;
	}
}
