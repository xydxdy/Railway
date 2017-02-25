package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Station;
import model.StationDB;

@WebServlet("/stationlist")
public class StationList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ใช้ในการดึงสถานีมาแสดงทั้งหมด เพื่อลบ
		StationDB stationDB = new StationDB();
		ArrayList<Station> table = new ArrayList<Station>();
		table= stationDB.getAllStation();
		request.setAttribute("list", table);
		RequestDispatcher view=request.getRequestDispatcher("insertstation.jsp");
		view.forward(request, response);
	}

}
