package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookingDetailDB {
	private Connection con;

	public BookingDetailDB() {
		con = ConnectDatabase.getConnection();
	}
	//เป้นการดึงรายละเอียดการจองตาม BookingID (Join with ticket table)
	public ArrayList<BookingDetail> getBookingDetailList(String bookingid) {
		ArrayList<BookingDetail> bookingDetailList = new ArrayList<BookingDetail>();
		BookingDetail bookingDetail = new BookingDetail();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM booking WHERE BookingID = ?");
			pStatement.setString(1, bookingid);
			ResultSet resultSet = pStatement.executeQuery();
			if (resultSet.next()) {
				int bookingID = resultSet.getInt("BookingID");
				String time = resultSet.getString("Time");
				String bookingDate = resultSet.getString("BookingDate");
				int status = resultSet.getInt("Status");
				int userID = resultSet.getInt("UserID");
				bookingDetail.setBookingID(bookingID);
				bookingDetail.setTime(time);
				bookingDetail.setBookingDate(bookingDate);
				bookingDetail.setStatus(status);
				bookingDetail.setUserID(userID);
				PreparedStatement subPStatementUser = con.prepareStatement("SELECT * FROM user WHERE UserID = ?");
				subPStatementUser.setInt(1, userID);
				ResultSet subReuultSet = subPStatementUser.executeQuery();
				if (subReuultSet.next()) {
					String fname = subReuultSet.getString("FName");
					String lname = subReuultSet.getString("LName");
					String tel = subReuultSet.getString("Tel");
					bookingDetail.setFName(fname);
					bookingDetail.setLName(lname);
					bookingDetail.setTel(tel);
				}
				PreparedStatement tPStatementUser = con.prepareStatement("SELECT SUM(Car.price)tprice FROM ticket,car "
						+ " WHERE ticket.CarNo=car.CarNo AND BookingID=?");
				tPStatementUser.setInt(1, bookingID);
				ResultSet tReuultSet = tPStatementUser.executeQuery();
				if (tReuultSet.next()) {
					bookingDetail.setPrice(tReuultSet.getInt("tprice"));
				}
				bookingDetailList.add(bookingDetail);
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return bookingDetailList;
	}
	//ดึงรายละเอียดการจองทั้งหมด
	public ArrayList<BookingDetail> getBookingDetailList() {
		ArrayList<BookingDetail> bookingDetailList = new ArrayList<BookingDetail>();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM booking");
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				BookingDetail bookingDetail = new BookingDetail();
				int bookingID = resultSet.getInt("BookingID");
				String time = resultSet.getString("Time");
				String bookingDate = resultSet.getString("BookingDate");
				int status = resultSet.getInt("Status");
				int userID = resultSet.getInt("UserID");
				bookingDetail.setBookingID(bookingID);
				bookingDetail.setTime(time);
				bookingDetail.setBookingDate(bookingDate);
				bookingDetail.setStatus(status);
				bookingDetail.setUserID(userID);
				PreparedStatement subPStatementUser = con.prepareStatement("SELECT * FROM user WHERE UserID = ?");
				subPStatementUser.setInt(1, userID);
				ResultSet subReuultSet = subPStatementUser.executeQuery();
				if (subReuultSet.next()) {
					String fname = subReuultSet.getString("FName");
					String lname = subReuultSet.getString("LName");
					String tel = subReuultSet.getString("Tel");
					bookingDetail.setFName(fname);
					bookingDetail.setLName(lname);
					bookingDetail.setTel(tel);
				}
				PreparedStatement tPStatementUser = con.prepareStatement("SELECT SUM(Car.price)tprice FROM ticket,car "
						+ " WHERE ticket.CarNo=car.CarNo AND BookingID=?");
				tPStatementUser.setInt(1, bookingID);
				ResultSet tReuultSet = tPStatementUser.executeQuery();
				if (tReuultSet.next()) {
					bookingDetail.setPrice(tReuultSet.getInt("tprice"));
				}
				bookingDetailList.add(bookingDetail);
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return bookingDetailList;
	}
	//ดึงหารจองตาม BookingID
	public BookingDetail getBookingDetail(String bookingid) {
		BookingDetail bookingDetail = new BookingDetail();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM booking WHERE BookingID = ?");
			pStatement.setString(1, bookingid);
			ResultSet resultSet = pStatement.executeQuery();
			if (resultSet.next()) {
				int bookingID = resultSet.getInt("BookingID");
				String time = resultSet.getString("Time");
				String bookingDate = resultSet.getString("BookingDate");
				int status = resultSet.getInt("Status");
				int userID = resultSet.getInt("UserID");
				bookingDetail.setBookingID(bookingID);
				bookingDetail.setTime(time);
				bookingDetail.setBookingDate(bookingDate);
				bookingDetail.setStatus(status);
				bookingDetail.setUserID(userID);
				PreparedStatement subPStatementUser = con.prepareStatement("SELECT * FROM user WHERE UserID = ?");
				subPStatementUser.setInt(1, userID);
				ResultSet subReuultSet = subPStatementUser.executeQuery();
				if (subReuultSet.next()) {
					String fname = subReuultSet.getString("FName");
					String lname = subReuultSet.getString("LName");
					String tel = subReuultSet.getString("Tel");
					bookingDetail.setFName(fname);
					bookingDetail.setLName(lname);
					bookingDetail.setTel(tel);
				}
				PreparedStatement tPStatementUser = con.prepareStatement("SELECT SUM(Car.price)tprice FROM ticket,car "
						+ " WHERE ticket.CarNo=car.CarNo AND BookingID=?");
				tPStatementUser.setInt(1, bookingID);
				ResultSet tReuultSet = tPStatementUser.executeQuery();
				if (tReuultSet.next()) {
					bookingDetail.setPrice(tReuultSet.getInt("tprice"));
				}
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return bookingDetail;
	}
	//ดึงรายการจองตาม UserID
	public ArrayList<BookingDetail> getBookingDetail2(String userid) {
		ArrayList<BookingDetail> bookingDetailList = new ArrayList<BookingDetail>();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM booking WHERE userid = ?");
			pStatement.setString(1, userid);
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				BookingDetail bookingDetail = new BookingDetail();
				int bookingID = resultSet.getInt("BookingID");
				String time = resultSet.getString("Time");
				String bookingDate = resultSet.getString("BookingDate");
				int status = resultSet.getInt("Status");
				int userID = resultSet.getInt("UserID");
				bookingDetail.setBookingID(bookingID);
				bookingDetail.setTime(time);
				bookingDetail.setBookingDate(bookingDate);
				bookingDetail.setStatus(status);
				bookingDetail.setUserID(userID);
				PreparedStatement subPStatementUser = con.prepareStatement("SELECT * FROM user WHERE UserID = ?");
				subPStatementUser.setInt(1, userID);
				ResultSet subReuultSet = subPStatementUser.executeQuery();
				if (subReuultSet.next()) {
					String fname = subReuultSet.getString("FName");
					String lname = subReuultSet.getString("LName");
					String tel = subReuultSet.getString("Tel");
					bookingDetail.setFName(fname);
					bookingDetail.setLName(lname);
					bookingDetail.setTel(tel);
				}
				PreparedStatement tPStatementUser = con.prepareStatement("SELECT SUM(Car.price)tprice FROM ticket,car "
						+ " WHERE ticket.CarNo=car.CarNo AND BookingID=?");
				tPStatementUser.setInt(1, bookingID);
				ResultSet tReuultSet = tPStatementUser.executeQuery();
				if (tReuultSet.next()) {
					bookingDetail.setPrice(tReuultSet.getInt("tprice"));
				}
				bookingDetailList.add(bookingDetail);
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return bookingDetailList;
	}
}
