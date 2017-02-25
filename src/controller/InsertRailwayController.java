package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

@WebServlet("/insertRailway")
public class InsertRailwayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = (String) request.getParameter("action");
		request.setAttribute("Auth", "list");
		//ดึงรายการสถานีมาแสดงก่อนที่จะเพิ่มขบวน
		if (action == null) {
			StationDB sta = new StationDB();
			ArrayList<Station> list = new ArrayList<Station>();
			list = sta.getAllStation();
			request.setAttribute("stations", list);
			RequestDispatcher view = request.getRequestDispatcher("insertRailway.jsp");
			view.forward(request, response);
		//เพิ่มรถไฟ
		} else if (action.equals("insert")) {
			String rid = request.getParameter("rid");
			String sid = request.getParameter("sid");
			String did = request.getParameter("did");
			String arrTime = request.getParameter("arrTime");
			String depTime = request.getParameter("depTime");
			RailwayDB r = new RailwayDB();
			r.insertRailway(Integer.parseInt(rid), depTime, arrTime);
			SourceDestinationDB sd = new SourceDestinationDB();
			sd.insertSource(Integer.parseInt(rid), Integer.parseInt(sid));
			sd.insertDestination(Integer.parseInt(rid), Integer.parseInt(did));
			response.sendRedirect("insertRailway");
		} else {
			response.sendRedirect("insertRailway");
		}
	}
}
