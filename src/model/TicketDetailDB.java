package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public class TicketDetailDB {
	private Connection con;

	public TicketDetailDB() {
		con = ConnectDatabase.getConnection();
	}

	public ArrayList<TicketDetail> getTicketByBookingID(int bid) {
		ArrayList<TicketDetail> list = new ArrayList<TicketDetail>();

		String sql = "SELECT * FROM ticket,car WHERE ticket.CarNo=car.CarNo" + " AND ticket.BookingID=?";
		try {
			
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, bid);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				TicketDetail a = new TicketDetail();
				a.setTicketID(result.getInt("TicketID"));
				a.setSeat(result.getInt("Seat"));
				a.setCarNo(result.getInt("Car.CarNo"));
				a.setBookingID(result.getInt("Ticket.BookingID"));
				a.setCarType(result.getInt("CarType"));
				a.setPrice(result.getInt("Price"));
				a.setRID(result.getInt("Car.RID"));
				RailwayTable b=new RailwayTable();
				RailwayTableDB db=new RailwayTableDB();
				b=db.getStationDetailByRID(result.getInt("Car.RID"));
				a.setDeptime(b.getDeptime());
				a.setArrtime(b.getArrtime());
				a.setSNameEng(b.getSNameEng());
				a.setSNameTha(b.getSNameTha());
				a.setDNameEng(b.getDNameEng());
				a.setDNameTha(b.getDNameTha());
				list.add(a);
			}
			con.close();
		} catch (SQLException e) {
			System.err.println("Error Select data :" + e);
		}
		return list;
	}
	
	public TicketDetail getOneTicketByBookingID(int bid) {
		TicketDetail  a= new TicketDetail();

		String sql = "SELECT * FROM ticket,car WHERE ticket.CarNo=car.CarNo" + " AND ticket.BookingID=?";
		try {
			
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, bid);
			ResultSet result = statement.executeQuery();
			if(result.next()) {
			
				a.setTicketID(result.getInt("TicketID"));
				a.setSeat(result.getInt("Seat"));
				a.setCarNo(result.getInt("Car.CarNo"));
				a.setBookingID(result.getInt("Ticket.BookingID"));
				a.setCarType(result.getInt("CarType"));
				a.setPrice(result.getInt("Price"));
				a.setRID(result.getInt("Car.RID"));
				RailwayTable b=new RailwayTable();
				RailwayTableDB db=new RailwayTableDB();
				b=db.getStationDetailByRID(result.getInt("Car.RID"));
				a.setDeptime(b.getDeptime());
				a.setArrtime(b.getArrtime());
				a.setSNameEng(b.getSNameEng());
				a.setSNameTha(b.getSNameTha());
				a.setDNameEng(b.getDNameEng());
				a.setDNameTha(b.getDNameTha());
				
			}

		} catch (SQLException e) {
			System.err.println("Error Select data :" + e);
		}
		return a;
	}

	
}