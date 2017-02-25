package model;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
public class RailwayTableDB {
	private Connection con;
	public RailwayTableDB() {
		con = ConnectDatabase.getConnection();
	}
	public ArrayList<RailwayTable> getStationTableList() {
		ArrayList<RailwayTable> list = new ArrayList<RailwayTable>();
		String sql = "SELECT * FROM Railway,SourceDestination,Station " + "WHERE Railway.RID=SourceDestination.RID "
				+ "AND SourceDestination.SID=Station.SID " + "AND SourceDestination.SDSelect=1";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				RailwayTable a = new RailwayTable();
				a.setRID(result.getInt("Railway.RID"));
				a.setArrtime(result.getString("Arrtime"));
				a.setDeptime(result.getString("Deptime"));
				a.setSNameTha(result.getString("SNameTha"));
				a.setSNameEng(result.getString("SNameEng"));
				String subSql = "SELECT * FROM Railway,SourceDestination,Station "
						+ "WHERE Railway.RID=SourceDestination.RID " + " AND SourceDestination.SID=Station.SID"
						+ " AND SourceDestination.SDSelect=2 " + " AND Railway.RID=? ORDER BY Railway.RID";
				PreparedStatement subStatement = con.prepareStatement(subSql);
				subStatement.setInt(1, a.getRID());
				ResultSet subResult = subStatement.executeQuery();
				if (subResult.next()) {
					a.setDNameTha(subResult.getString("SNameTha"));
					a.setDNameEng(subResult.getString("SNameEng"));
				}
				list.add(a);
			}
		} catch (SQLException e) {
			System.err.println("Error Select data :" + e);
		}
		return list;
	}
	public ArrayList<RailwayTable> getStationTableList(String va, int id) 
	{
		System.out.println("gg"+id);
		ArrayList<RailwayTable> list = new ArrayList<RailwayTable>();
		String sql;
		if (va.equals("sid")) {
			sql = "SELECT * FROM Railway,SourceDestination,Station " + "WHERE Railway.RID=SourceDestination.RID "
					+ "AND SourceDestination.SID=Station.SID " + "AND SourceDestination.SDSelect=1 "
					+ "AND Station.SID=?";
		} else {
			sql = "SELECT * FROM Railway,SourceDestination,Station " + "WHERE Railway.RID=SourceDestination.RID "
					+ "AND SourceDestination.SID=Station.SID " + "AND SourceDestination.SDSelect=2 "
					+ "AND Station.SID=?";
		}
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				RailwayTable a = new RailwayTable();
				a.setRID(result.getInt("railway.RID"));
				a.setArrtime(result.getString("Arrtime"));
				a.setDeptime(result.getString("Deptime"));
				if (va.equals("sid")) {
					a.setSNameTha(result.getString("SNameTha"));
					a.setSNameEng(result.getString("SNameEng"));
				} else {
					a.setDNameTha(result.getString("SNameTha"));
					a.setDNameEng(result.getString("SNameEng"));
				}
				String subSql;
				if (va.equals("sid")) {
				subSql = "SELECT * FROM Railway,SourceDestination,Station "
						+ "WHERE Railway.RID=SourceDestination.RID " + " AND SourceDestination.SID=Station.SID"
						+ " AND SourceDestination.SDSelect=2 " + " AND Railway.RID=?";
				}else{
					subSql = "SELECT * FROM Railway,SourceDestination,Station "
							+ "WHERE Railway.RID=SourceDestination.RID " + " AND SourceDestination.SID=Station.SID"
							+ " AND SourceDestination.SDSelect=1 " + " AND Railway.RID=?";
				}
				PreparedStatement subStatement = con.prepareStatement(subSql);
				subStatement.setInt(1, a.getRID());
				ResultSet subResult = subStatement.executeQuery();
				if (subResult.next()) {
					if (va.equals("sid")) {
						a.setDNameTha(subResult.getString("SNameTha"));
						a.setDNameEng(subResult.getString("SNameEng"));
					} else {			
						a.setSNameTha(subResult.getString("SNameTha"));
						a.setSNameEng(subResult.getString("SNameEng"));
					}
				}
				list.add(a);
			}
		} catch (SQLException e) {
			System.err.println("Error Select data :" + e);
		}
		return list;
	}
	public ArrayList<RailwayTable> getStationTableList(int sid, int did) {	
		boolean add = false;
		ArrayList<RailwayTable> list = new ArrayList<RailwayTable>();
		String sql = "SELECT * FROM Railway,SourceDestination,Station " + "WHERE Railway.RID=SourceDestination.RID "
				+ "AND SourceDestination.SID=Station.SID " + "AND SourceDestination.SDSelect=1 " + "AND Station.SID=?";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, sid);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				RailwayTable a = new RailwayTable();
				a.setRID(result.getInt("Railway.RID"));
				a.setArrtime(result.getString("Arrtime"));
				a.setDeptime(result.getString("Deptime"));
				a.setSNameTha(result.getString("SNameTha"));
				a.setSNameEng(result.getString("SNameEng"));
				String subSql = "SELECT * FROM Railway,SourceDestination,Station "
						+ "WHERE Railway.RID=SourceDestination.RID " + " AND SourceDestination.SID=Station.SID"
						+ " AND SourceDestination.SDSelect=2 " + " AND Railway.RID=?";
				PreparedStatement subStatement = con.prepareStatement(subSql);
				subStatement.setInt(1, a.getRID());
				ResultSet subResult = subStatement.executeQuery();
				if (subResult.next()) {
					a.setDNameTha(subResult.getString("SNameTha"));
					a.setDNameEng(subResult.getString("SNameEng"));
					if (subResult.getInt("SID") == did) {
						add = true;
					}
				}
				if (add) {
					list.add(a);
					add = false;
				}
			}
		} catch (SQLException e) {
			System.err.println("Error Select data :" + e);
		}
		return list;
	}
	public RailwayTable getStationDetailByRID(int rid) {
		RailwayTable a = new RailwayTable();
		String sql = "SELECT * FROM Railway,SourceDestination,Station " + "WHERE Railway.RID=SourceDestination.RID "
				+ "AND SourceDestination.SID=Station.SID " + "AND SourceDestination.SDSelect=1 " + "AND Railway.RID=?";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, rid);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				a.setRID(result.getInt("Railway.RID"));
				a.setArrtime(result.getString("Arrtime"));
				a.setDeptime(result.getString("Deptime"));
				a.setSNameTha(result.getString("SNameTha"));
				a.setSNameEng(result.getString("SNameEng"));
				String subSql = "SELECT * FROM Railway,SourceDestination,Station "
						+ "WHERE Railway.RID=SourceDestination.RID " + " AND SourceDestination.SID=Station.SID"
						+ " AND SourceDestination.SDSelect=2 " + " AND Railway.RID=?";
				PreparedStatement subStatement = con.prepareStatement(subSql);
				subStatement.setInt(1, a.getRID());
				ResultSet subResult = subStatement.executeQuery();
				if (subResult.next()) {
					a.setDNameTha(subResult.getString("SNameTha"));
					a.setDNameEng(subResult.getString("SNameEng"));}
				}
		} catch (SQLException e) {
			System.err.println("Error Select data :" + e);
		}
		return a;
	}
	public void deleteRailwayTableById(int rid){
		String sql="DELETE FROM sourcedestination Where rid=?";
		try{
			PreparedStatement statement =con.prepareStatement(sql);
			statement.setInt(1,rid);
			statement.executeUpdate();
		}catch(SQLException e){
			System.err.println("Error Select data :"+e);
		}	
	}
}