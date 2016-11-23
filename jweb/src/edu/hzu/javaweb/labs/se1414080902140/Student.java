package Bean;

public class Student {
	private int sno;
	private String name;
	private String sex;
	private int age;
	private double weight;
	private double hight;
	private double longRun;
	private double shortRun;
	private int pulmonary;

	public Student(int sno, String name, String sex, int age, double weight,
			double hight, double longRun, double shortRun, int pulmonary) {
		super();
		this.sno = sno;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.weight = weight;
		this.hight = hight;
		this.longRun = longRun;
		this.shortRun = shortRun;
		this.pulmonary = pulmonary;
	}

	public Student(String name, String sex, int sno, int age, double hight,
			double weight, int pulmonary, double longRun, double shortRun) {
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

	public Student() {

	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getHight() {
		return hight;
	}

	public void setHight(double hight) {
		this.hight = hight;
	}

	public double getLongRun() {
		return longRun;
	}

	public void setLongRun(double longRun) {
		this.longRun = longRun;
	}

	public double getShortRun() {
		return shortRun;
	}

	public void setShortRun(double shortRun) {
		this.shortRun = shortRun;
	}

	public int getPulmonary() {
		return pulmonary;
	}

	public void setPulmonary(int pulmonary) {
		this.pulmonary = pulmonary;
	}

}
