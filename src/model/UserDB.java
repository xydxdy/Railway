package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class UserDB {
	private Connection con;

	public UserDB() {
		con = ConnectDatabase.getConnection();
	}

	public User doLogin(String username) {
		User user = new User();
		String sql = "SELECT * FROM User WHERE Email=?";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, username);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				user.setCheck(true);
				user.setUserID(result.getInt("UserID"));
				user.setPassword(result.getString("password"));
				user.setEmail(result.getString("Email"));
				user.setFname(result.getString("FName"));
				user.setLname(result.getString("LName"));
				user.setIDNo(result.getString("IDNo"));
				user.setAddress(result.getString("Address"));
				user.setTel(result.getString("Tel"));
				user.setDate(result.getDate("Date"));
				user.setType(result.getString("Type"));
			} else {
				user.setCheck(false);
			}
			con.close();
		} catch (SQLException e) {
			System.err.println("Error Select data :" + e);
		}
		return user;
	}

	public void insertUser(String email, String password, String fName, String lName, String idNo, String address,

			String tel, String type) {
		String sql = "INSERT INTO User(IDNo, Email, Password,FName,LName,Address,Tel,Date,Type) "
				+ "VALUES (?,?,?,?,?,?,?,now(),?)";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, idNo);
			statement.setString(2, email);
			statement.setString(3, password);
			statement.setString(4, fName);
			statement.setString(5, lName);
			statement.setString(6, address);
			statement.setString(7, tel);
			statement.setString(8, type);
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error Insert data :" + e);
		}
	}

	public void updateUser(String email, String fName, String lName, String address, String tel, String idNo,
			String userID) {
		String sql = "UPDATE User SET  Email=?,FName=?,LName=?,Address=?,Tel=?,IDNo=? WHERE UserID=? ";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, email);
			statement.setString(2, fName);
			statement.setString(3, lName);
			statement.setString(4, address);
			statement.setString(5, tel);
			statement.setString(6, idNo);
			statement.setString(7, userID);
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error Insert data :" + e);
		}
	}

	public User doProfile(String idno) {
		User user = new User();
		String sql = "SELECT * FROM User WHERE IDNo=?";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, idno);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				user.setUserID(result.getInt("UserID"));
				user.setPassword(result.getString("password"));
				user.setEmail(result.getString("Email"));
				user.setFname(result.getString("FName"));
				user.setLname(result.getString("LName"));
				user.setIDNo(result.getString("IDNo"));
				user.setAddress(result.getString("Address"));
				user.setTel(result.getString("Tel"));
				user.setDate(result.getDate("Date"));
				user.setType(result.getString("Type"));
			}
			con.close();
		} catch (SQLException e) {
			System.err.println("Error Select data :" + e);
		}
		return user;
	}

	public void deleteUserById(int userId) {
		String sql = "DELETE FROM User Where UserID=?";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, userId);
			statement.executeUpdate();
			con.close();
		} catch (SQLException e) {
			System.err.println("Error Select data :" + e);
		}
	}

}