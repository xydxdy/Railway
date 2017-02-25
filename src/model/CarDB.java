package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarDB {
	private Connection con;
	public CarDB() {
		con = ConnectDatabase.getConnection();
	}
	//¥÷ßµŸÈ√∂‰øµ“¡ CarNo
	public Car getCarList(String id) {
		Car carList = new Car();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM car WHERE CarNo = ?");
			pStatement.setString(1, id);
			ResultSet resultSet = pStatement.executeQuery();
			if (resultSet.next()) {
				int carNo = resultSet.getInt("CarNo");
				int carType = resultSet.getInt("CarType");
				int price = resultSet.getInt("Price");
				int rID = resultSet.getInt("RID");
				Car car = new Car();
				car.setCarNo(carNo);
				car.setCarType(carType);
				car.setPrice(price);
				car.setPrice(price);
				car.setRID(rID);
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return carList;
	}
	//¥÷ß√“¬°“√µŸÈ√∂‰ø µ“¡¢∫«π√∂‰ø
	public ArrayList<Car> getCarListByRID(String id) {
		ArrayList<Car> carList = new ArrayList<Car>();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM car WHERE RID = ?");
			pStatement.setString(1, id);
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				int carNo = resultSet.getInt("CarNo");
				int carType = resultSet.getInt("CarType");
				int price = resultSet.getInt("Price");
				int rID = resultSet.getInt("RID");

				Car car = new Car();
				car.setCarNo(carNo);
				car.setCarType(carType);
				car.setPrice(price);
				car.setPrice(price);
				car.setRID(rID);
				carList.add(car);
			}
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return carList;
	}
	//‡æ‘Ë¡µŸÈ√∂‰ø
	public void insertCar(String carType, String price, String rID) {
		try {
			PreparedStatement pStatement = con
					.prepareStatement("INSERT INTO car ( CarType, Price, RID) VALUES (?,?,?)");
			pStatement.setInt(1, Integer.parseInt(carType));
			pStatement.setInt(2, Integer.parseInt(price));
			pStatement.setInt(3, Integer.parseInt(rID));
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	//≈∫µŸÈ√∂‰ø
	public void removeCar(String id) {
		try {
			PreparedStatement pStatement = con.prepareStatement("DELETE FROM car WHERE CarNo = ?");
			pStatement.setString(1, id);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
	//¥÷ß√“¬≈–‡¥’¬¥µŸÈ√∂‰ø‰ª·°È‰¢
	public ArrayList<Car> editForm(String id) {
		ArrayList<Car> carList = new ArrayList<Car>();
		try {
			PreparedStatement pStatement = con.prepareStatement("SELECT * FROM car WHERE CarNo = ?");
			pStatement.setString(1, id);
			ResultSet resultSet = pStatement.executeQuery();
			resultSet.next();
			int carNo = resultSet.getInt("CarNo");
			int carType = resultSet.getInt("CarType");
			int price = resultSet.getInt("Price");
			int rID = resultSet.getInt("RID");
			Car car = new Car();
			car.setCarNo(carNo);
			car.setCarType(carType);
			car.setPrice(price);
			car.setRID(rID);
			carList.add(car);
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
		return carList;
	}
	//·°È‰¢µŸÈ√∂‰ø
	public void editCar(String carNo, String carType, String price, String rID) {
		try {
			PreparedStatement pStatement = con
					.prepareStatement("UPDATE car SET CarType = ?, Price = ?, RID = ? WHERE CarNo = ?");
			pStatement.setInt(1, Integer.parseInt(carType));
			pStatement.setInt(2, Integer.parseInt(price));
			pStatement.setInt(3, Integer.parseInt(rID));
			pStatement.setInt(4, Integer.parseInt(carNo));
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error: " + e);
		}
	}
}
