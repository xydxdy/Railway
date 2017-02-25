package model;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
public class StationDB {
	private Connection con;
	public StationDB(){
		con=ConnectDatabase.getConnection();
	}
	public ArrayList<Station> getAllStation(){
		String sql="SELECT * FROM Station";
		ArrayList<Station>  a = new ArrayList<Station>();
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			ResultSet  result=statement.executeQuery();
			while(result.next()){
				Station st=new Station();
				st.setSID(result.getInt("SID"));
				st.setSNameEng(result.getString("SNameEng"));
				st.setSNameTha(result.getString("SNameTha"));
				a.add(st);
			}
			con.close();
			
		}catch(SQLException e){
			System.err.println("Error Select data :"+e);
		}	
		return a;	
	}
	public void insertStation(String SID,String nameTha,String nameEng) {
		String sql="INSERT INTO Station(SID,SNameTha,SNameEng) "
				+ "VALUES (?,?,?)";
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			statement.setString(1, SID);
			statement.setString(2, nameTha);
			statement.setString(3, nameEng);
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
	
	
}