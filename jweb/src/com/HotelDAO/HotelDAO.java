package com.HotelDAO;
import javaBean.Customer;
public interface HotelDAO {
	public abstract int create(Customer cus)throws Exception;
	public abstract void remove(Customer cus)throws Exception;
	public abstract Customer find(Customer cus)throws Exception;

}
