package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TicketDB {
private Connection con;
	
	public TicketDB() {
		con = ConnectDatabase.getConnection();
	}
	
	public ArrayList<Ticket> getTicketList(String bookingID) {
		ArrayList<Ticket> ticketList = new ArrayList<Ticket>();
	
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM ticket WHERE BookingID = ?");
			pStatement.setString(1,bookingID);
			ResultSet resultSet = pStatement.executeQuery();
			 
			while (resultSet.next()) {	
				int ticketID = resultSet.getInt("TicketID");
			    int carNo = resultSet.getInt("CarNo");
			    int seat = resultSet.getInt("Seat");
			    
			    Ticket ticket = new Ticket();
			    ticket.setTicketID(ticketID);
			    ticket.setCarNo(carNo);
			    ticket.setSeat(seat);
			    ticketList.add(ticket);
			}
			
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		
		return ticketList;
	}	public ArrayList<Ticket> getTicketListByCarNO(String CarNo) {
		ArrayList<Ticket> ticketList = new ArrayList<Ticket>();
	
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM ticket WHERE CarNo = ?");
			pStatement.setString(1,CarNo);
			ResultSet resultSet = pStatement.executeQuery();
			 
			while (resultSet.next()) {	
				int ticketID = resultSet.getInt("TicketID");
			    int carNo = resultSet.getInt("CarNo");
			    int seat = resultSet.getInt("Seat");
			    
			    Ticket ticket = new Ticket();
			    ticket.setTicketID(ticketID);
			    ticket.setCarNo(carNo);
			    ticket.setSeat(seat);
			    ticketList.add(ticket);
			}
			
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		
		return ticketList;
	}
	public ArrayList<Ticket> getTicketList() {
		ArrayList<Ticket> ticketList = new ArrayList<Ticket>();
	
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM ticket");
			ResultSet resultSet = pStatement.executeQuery();
			 
			while (resultSet.next()) {	
				int ticketID = resultSet.getInt("TicketID");
			    int carNo = resultSet.getInt("CarNo");
			    int seat = resultSet.getInt("Seat");
			    
			    Ticket ticket = new Ticket();
			    ticket.setTicketID(ticketID);
			    ticket.setCarNo(carNo);
			    ticket.setSeat(seat);
			    ticketList.add(ticket);
			}
			
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		
		return ticketList;
	}
	public void addTicket(String carNo,String seat,int bookingID) {
		
		try {
			PreparedStatement pStatement = con.prepareStatement("INSERT INTO ticket (carNo, seat, bookingID) VALUES (?,?,?)");
			pStatement.setInt(1, Integer.parseInt(carNo));
			pStatement.setInt(2, Integer.parseInt(seat));
			pStatement.setInt(3,bookingID);
			pStatement.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	public void removeTicket(String id){
		try{
			PreparedStatement pStatement = con.prepareStatement("DELETE FROM ticket WHERE TicketID = ?");
			pStatement.setString(1,id);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}

}
