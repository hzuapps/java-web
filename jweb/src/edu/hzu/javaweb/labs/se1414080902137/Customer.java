package javaBean;

public class Customer {
	private long idcard;
	private String name;
	private Room room;
	private float bill;
	public long getIdcard() {
		return idcard;
	}
	public void setIdcard(long idcard) {
		this.idcard = idcard;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public float getBill() {
		return bill;
	}
	public void setBill(float bill) {
		this.bill = bill;
	}

}
