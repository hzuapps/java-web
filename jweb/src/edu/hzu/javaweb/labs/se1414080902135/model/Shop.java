package model;

public class Shop {
	private String shop_name=null;
	
	private String shop_id=null;
	
	private String price=null;
	private String descript=null;
	private Integer num=null;
	private String brand=null;
	@Override
	public String toString() {
		return "Shop [shop_name=" + shop_name + ", shop_id=" + shop_id + ", price=" + price + ", descript=" + descript
				+ ", num=" + num + ", brand=" + brand + "]";
	}
	
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getShop_id() {
		return shop_id;
	}

	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
}
