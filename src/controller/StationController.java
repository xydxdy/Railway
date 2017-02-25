package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

@WebServlet("/Station")
public class StationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		StationDB sdb = new StationDB();
		//เพิ่มสถานีใหม่
		if (action.equals("insert_station")) {
			String SID = request.getParameter("SID");
			String SNameTha = new String(request.getParameter("SNameTha").getBytes("ISO8859_1"), "utf-8");
			String SNameEng = request.getParameter("SNameEng");
			sdb.insertStation(SID, SNameTha, SNameEng);
			response.sendRedirect("stationlist");
		//ลบสถานี
		} else if (action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			response.sendRedirect("stationlist");
			sdb.deleteStationById(id);
		}
	}

}
