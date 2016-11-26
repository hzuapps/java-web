package train;

import java.sql.Date;
import java.sql.Time;

public class Train_ticket 
{
    private String despartPlace,destination,seatID,seatType,seatStatus;
    private int carriageID;
    private float seatPrize;
    private String despartDate,returnDate;
    private String despartTime,arrivalTime;
	public String getDespartPlace() {
		return despartPlace;
	}
	public void setDespartPlace(String despartPlace) {
		this.despartPlace = despartPlace;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getSeatID() {
		return seatID;
	}
	public void setSeatID(String seatID) {
		this.seatID = seatID;
	}
	public String getSeatType() {
		return seatType;
	}
	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	public String getSeatStatus() {
		return seatStatus;
	}
	public void setSeatStatus(String seatStatus) {
		this.seatStatus = seatStatus;
	}
	public int getCarriageID() {
		return carriageID;
	}
	public void setCarriageID(int carriageID) {
		this.carriageID = carriageID;
	}
	public float getSeatPrize() {
		return seatPrize;
	}
	public void setSeatPrize(float seatPrize) {
		this.seatPrize = seatPrize;
	}
	public String getDespartDate() {
		return despartDate;
	}
	public void setDespartDate(String despartDate) {
		this.despartDate = despartDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getDespartTime() {
		return despartTime;
	}
	public void setDespartTime(String despartTime) {
		this.despartTime = despartTime;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
}
