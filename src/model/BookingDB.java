package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookingDB {
	private Connection con;

	public BookingDB() {
		con = ConnectDatabase.getConnection();
	}

	// ดึงการจองล่าสุด
	public Booking getLastInsert() {
		Booking book = new Booking();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM booking ORDER BY BookingID DESC");
			ResultSet resultSet = pStatement.executeQuery();
			if (resultSet.next()) {
				int bookingID = resultSet.getInt("BookingID");
				String time = resultSet.getString("Time");
				String bookingDate = resultSet.getString("BookingDate");
				int status = resultSet.getInt("Status");
				int userID = resultSet.getInt("UserID");
				book.setBookingID(bookingID);
				book.setTime(time);
				book.setBookingDate(bookingDate);
				book.setStatus(status);
				book.setUserID(userID);
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return book;
	}

	// ดึงรายการตั๋วตาม BookingID
	public ArrayList<Booking> getBookingList(String id) {
		ArrayList<Booking> bookingList = new ArrayList<Booking>();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM booking WHERE BookingID = ?");
			pStatement.setString(1, id);
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				int bookingID = resultSet.getInt("BookingID");
				String time = resultSet.getString("Time");
				String bookingDate = resultSet.getString("BookingDate");
				int status = resultSet.getInt("Status");
				int userID = resultSet.getInt("UserID");
				Booking booking = new Booking();
				booking.setBookingID(bookingID);
				booking.setTime(time);
				booking.setBookingDate(bookingDate);
				booking.setStatus(status);
				booking.setUserID(userID);
				bookingList.add(booking);
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return bookingList;
	}
	//เพิ่มการจองงใหม่
	public void addBooking(String bookingDate, String status, String userID) {
		try {
			PreparedStatement pStatement = con
					.prepareStatement("INSERT INTO booking ( Time, BookingDate, Status, UserID) VALUES (now(),?,?,?)");
			pStatement.setString(1, bookingDate);
			pStatement.setInt(2, Integer.parseInt(status));
			pStatement.setInt(3, Integer.parseInt(userID));
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	//ดึงข้อมูลที่นั่งทั้งหมดที่ถูกจองไปแล้ว ตามหมายเลขตู้ และวันที่
	public String getAllSeatByDate(String date, String carNo) {
		String allSeat = "";

		try {
			PreparedStatement pStatement = con.prepareStatement(
					"SELECT ticket.Seat FROM booking,ticket WHERE booking.BookingID=ticket.BookingID AND ticket.CarNo=? AND booking.BookingDate=?");
			pStatement.setString(1, carNo);
			pStatement.setString(2, date);
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				allSeat += resultSet.getString("Seat") + ",";
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return allSeat;
	}
	//ลบตัวตาม BookingID
	public void removeBooking(String id) {
		try {
			PreparedStatement pStatement = con.prepareStatement("DELETE FROM booking WHERE BookingID = ?");
			pStatement.setString(1, id);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	//เป็นการดึงข้อมูลตั๋วจาก bookingID
	public ArrayList<Booking> editForm(String id) {
		ArrayList<Booking> bookingList = new ArrayList<Booking>();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM booking WHERE BookingID = ?");
			pStatement.setString(1, id);
			ResultSet resultSet = pStatement.executeQuery();
			resultSet.next();
			int bookingID = resultSet.getInt("BookingID");
			String time = resultSet.getString("Time");
			String bookingDate = resultSet.getString("BookingDate");
			int status = resultSet.getInt("Status");
			int userID = resultSet.getInt("UserID");
			Booking booking = new Booking();
			booking.setBookingID(bookingID);
			booking.setBookingDate(bookingDate);
			booking.setTime(time);
			booking.setStatus(status);
			booking.setUserID(userID);
			bookingList.add(booking);
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return bookingList;
	}
	//แก้ไขการจองตาม BookingID
	public void editBooking(String bookingID, String time, String bookingDate, String status, String userID) {
		try {
			PreparedStatement pStatement = con.prepareStatement(
					"UPDATE booking SET Time = ?, BookingDate = ?, Status = ?, UserID = ?  WHERE BookingID = ?");
			pStatement.setString(1, time);
			pStatement.setString(2, bookingDate);
			pStatement.setInt(3, Integer.parseInt(status));
			pStatement.setInt(4, Integer.parseInt(userID));
			pStatement.setInt(5, Integer.parseInt(bookingID));
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	//อัพเดตสถานะ Booking
	public void updateStatus(String bookingID) {
		try {
			PreparedStatement pStatement = con.prepareStatement("UPDATE booking SET Status = 1 WHERE BookingID = ?");
			pStatement.setString(1, bookingID);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	//ดึงข้้อมูลการจองตาม UserID
	public ArrayList<Booking> getBookingListByUserID(String userid) {
		ArrayList<Booking> bookingList = new ArrayList<Booking>();

		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM booking WHERE UserID = ?");
			pStatement.setString(1, userid);
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				int bookingID = resultSet.getInt("BookingID");
				String time = resultSet.getString("Time");
				String bookingDate = resultSet.getString("BookingDate");
				int status = resultSet.getInt("Status");
				int userID = resultSet.getInt("UserID");
				Booking booking = new Booking();
				booking.setBookingID(bookingID);
				booking.setTime(time);
				booking.setBookingDate(bookingDate);
				booking.setStatus(status);
				booking.setUserID(userID);
				bookingList.add(booking);
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return bookingList;
	}
}