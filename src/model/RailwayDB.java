package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class RailwayDB {
private Connection con;
	public RailwayDB() {
		con = ConnectDatabase.getConnection();
	}
	//¥÷ß√“¬°“√‚∫°’È®“° RID
	public ArrayList<Railway> getCarList(String id) {
		ArrayList<Railway> railwayList = new ArrayList<Railway>();
	
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM railway WHERE RID = ?");
			pStatement.setString(1,id);
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {					
			    int rID = resultSet.getInt("RID");  
			    String deptime = resultSet.getString("Deptime");
			    String arrtime = resultSet.getString("Arrtime");
			    Railway railway = new Railway();
			    railway.setRID(rID);
			    railway.setArrtime(arrtime);
			    railway.setDeptime(deptime);
			    railwayList.add(railway);
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return railwayList;
	}
	//‡æ‘Ë¡¢∫«π√∂‰ø
	public void insertRailway(int rID,String deptime,String arrtime) {
		try {
			PreparedStatement pStatement = con.prepareStatement("INSERT INTO railway (RID, Deptime, Arrtime) VALUES (?,?,?)");
			pStatement.setInt(1,rID);
			pStatement.setString(2,deptime);
			pStatement.setString(3,arrtime);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	//≈∫¢∫«π√∂‰ø
	public void removeRailway(String id){
		try{
			PreparedStatement pStatement = con.prepareStatement("DELETE FROM railway WHERE RID = ?");
			pStatement.setString(1,id);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	//¥÷ß¢ÈÕ¡Ÿ≈√∂‰øº
	public ArrayList<Railway> editForm(String id) {
		ArrayList<Railway> railwayList = new ArrayList<Railway>();
	
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM railway WHERE RID = ?");
			pStatement.setString(1,id);
			ResultSet resultSet = pStatement.executeQuery(); 
			resultSet.next();				
			int rID = resultSet.getInt("RID");
			String deptime = resultSet.getString("Deptime");
			String arrtime = resultSet.getString("Arrtime");
			Railway railway = new Railway();
			railway.setRID(rID);
			railway.setDeptime(deptime);
			railway.setArrtime(arrtime);
			railwayList.add(railway);
		}catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return railwayList;
	}
	//·°È‰¢¢∫«π√∂‰ø
	public void editRailway(String rID,String deptime,String arrtime) {		
		try {
			PreparedStatement pStatement = con.prepareStatement("UPDATE railway SET Deptime = ?, Arrtime = ? WHERE RID = ?");
			pStatement.setString(1,deptime);
			pStatement.setString(2,arrtime);
			pStatement.setInt(3,Integer.parseInt(rID));
			pStatement.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
}