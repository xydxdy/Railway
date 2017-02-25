package model;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
public class SourceDestinationDB {
	private Connection con;
	public SourceDestinationDB(){
		con=ConnectDatabase.getConnection();
	}
	public SourceDestination getSourceDestination(int sid,int rid){
		SourceDestination sd= new SourceDestination();
		String sql="SELECT * FROM SourceDestination WHERE SID=? AND RID=?";
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			statement.setInt(1, sid);
			statement.setInt(2, rid);
			ResultSet  result=statement.executeQuery();
			if(result.next()){
			sd.setSID(result.getInt("SID"));
			sd.setRID(result.getInt("RID"));
			sd.setSDSelect(result.getInt("SDSelect"));
			}
			con.close();
			
		}catch(SQLException e){
			System.err.println("Error Select data :"+e);
		}	
		return sd;	
	}
	public ArrayList<SourceDestination> getSourceDestinationBySid(int sid){
		ArrayList<SourceDestination> list= new ArrayList<SourceDestination>();
		String sql="SELECT * FROM SourceDestination WHERE SID=?";
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			statement.setInt(1, sid);
			ResultSet  result=statement.executeQuery();
			while(result.next()){
				SourceDestination sd= new SourceDestination();
			sd.setSID(result.getInt("SID"));
			sd.setRID(result.getInt("RID"));
			sd.setSDSelect(result.getInt("SDSelect"));
			list.add(sd);
			}
			con.close();
		}catch(SQLException e){
			System.err.println("Error Select data :"+e);
		}	
		return list;	
	}
	public ArrayList<SourceDestination> getSourceDestinationByRid(int rid){
		ArrayList<SourceDestination> list= new ArrayList<SourceDestination>();
		String sql="SELECT * FROM SourceDestination WHERE RID=?";
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			statement.setInt(1, rid);
			ResultSet  result=statement.executeQuery();
			while(result.next()){
				SourceDestination sd= new SourceDestination();
			sd.setSID(result.getInt("SID"));
			sd.setRID(result.getInt("RID"));
			sd.setSDSelect(result.getInt("SDSelect"));
			list.add(sd);
			}
			con.close();
		}catch(SQLException e){
			System.err.println("Error Select data :"+e);
		}	
		return list;	
	}
	public SourceDestination getSourceDestination(int sid,int rid,int select){
		SourceDestination sd= new SourceDestination();
		String sql="SELECT * FROM SourceDestination WHERE SID=? AND RID=? AND Select=?" ;
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			statement.setInt(1, sid);
			statement.setInt(2, rid);
			statement.setInt(3, select);
			ResultSet  result=statement.executeQuery();
			if(result.next()){
			sd.setSID(result.getInt("SID"));
			sd.setRID(result.getInt("RID"));
			sd.setSDSelect(result.getInt("SDSelect"));
			}
			con.close();
		}catch(SQLException e){
			System.err.println("Error Select data :"+e);
		}	
		return sd;	
	}
	public void insertSource(int rid ,int sid) {
		String sql="INSERT INTO SourceDestination(RID,SID,SDSelect) "
				+ "VALUES (?,?,1)";
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			statement.setInt(1, rid);
			statement.setInt(2, sid);
			statement.executeUpdate();
		}catch(SQLException e){
			System.err.println("Error Select data :"+e);
		}	
	}
	public void insertDestination(int rid ,int sid) {
		String sql="INSERT INTO SourceDestination(RID,SID,SDSelect) "
				+ "VALUES (?,?,2)";
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			statement.setInt(1, rid);
			statement.setInt(2, sid);
			statement.executeUpdate();
			con.close();
		}catch(SQLException e){
			System.err.println("Error Select data :"+e);
		}	
	}
	public void deleteStationById(int sid){
		String sql="DELETE FROM Station Where SID=?";
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			statement.setInt(1,sid);
			statement.executeUpdate();
			con.close();
		}catch(SQLException e){
			System.err.println("Error Select data :"+e);
		}	
	}
	public void editSourceDest(String sid, String rid, String sd_select) {

		try {
			if (sd_select.equals("1")) {
				PreparedStatement pStatement = con.prepareStatement(
						"UPDATE SourceDestination SET sid = ? WHERE rid = ? AND sdselect = 1");
				pStatement.setString(1, sid);
				pStatement.setInt(2, Integer.parseInt(rid));
				pStatement.executeUpdate();
			} else if (sd_select.equals("2")) {
				PreparedStatement pStatement = con.prepareStatement(
						"UPDATE SourceDestination SET sid = ? WHERE rid = ? AND sdselect = 2");
				pStatement.setString(1, sid);
				pStatement.setInt(2, Integer.parseInt(rid));
				pStatement.executeUpdate();
			}

		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	
	
}