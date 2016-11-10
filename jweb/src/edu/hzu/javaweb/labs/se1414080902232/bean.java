package jweb;

public class bean {
	public bean(String cls,double age){
		this.cls = cls;
		this.age = age;
	}
    public String getCls() {
		return cls;
	}
	public double getAge() {
		return age;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(String cls,double age) {
		if(cls == "pig")
		this.height = 10*age+5+age/2;
		if(cls == "chicken")
			this.height = 5*age+5+age/2;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(String cls,double age) {
		if(cls == "pig")
		this.weight = 20*age+5+age/2;
		if(cls == "chicken")
		this.weight = 15*age+5+age/2;
	}
	private String cls;
    private double age;
    private double height;
    private double weight;
    
}
