package train;

import java.sql.Time;

public class Train {
    private String trainID,despartPlace,destination;
    private String despartTime,arrivalTime;
    private int businessSeat,firstSeat,secondSeat,nullSeat;
	public String getTrainID() {
		return trainID;
	}
	public void setTrainID(String trainID) {
		this.trainID = trainID;
	}
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
	public int getBusinessSeat() {
		return businessSeat;
	}
	public void setBusinessSeat(int businessSeat) {
		this.businessSeat = businessSeat;
	}
	public int getFirstSeat() {
		return firstSeat;
	}
	public void setFirstSeat(int firstSeat) {
		this.firstSeat = firstSeat;
	}
	public int getSecondSeat() {
		return secondSeat;
	}
	public void setSecondSeat(int secondSeat) {
		this.secondSeat = secondSeat;
	}
	public int getNullSeat() {
		return nullSeat;
	}
	public void setNullSeat(int nullSeat) {
		this.nullSeat = nullSeat;
	}
}