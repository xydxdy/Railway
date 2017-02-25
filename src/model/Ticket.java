package model;

public class Ticket {

	private int TicketID;
	private int CarNo;
	private int Seat;
	private int BookingID;
	public int getTicketID() {
		return TicketID;
	}
	public void setTicketID(int ticketID) {
		TicketID = ticketID;
	}
	public int getCarNo() {
		return CarNo;
	}
	public void setCarNo(int carNo) {
		CarNo = carNo;
	}
	public int getSeat() {
		return Seat;
	}
	public void setSeat(int seat) {
		Seat = seat;
	}
	public int getBookingID() {
		return BookingID;
	}
	public void setBookingID(int bookingID) {
		BookingID = bookingID;
	}
	
}