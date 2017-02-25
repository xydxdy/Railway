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
@WebServlet("/EDRailwaytable")
public class EditDelRailwaytableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		request.setAttribute("Auth", "list");
		RailwayTableDB rtdb = new RailwayTableDB();
		//ลบเที่ยวรถไฟ
		if (action.equals("delete")) {
			int rid = Integer.parseInt(request.getParameter("rid"));
			response.sendRedirect("stationlist");
			rtdb.deleteRailwayTableById(rid);
		//ดึงข้อมูลเที่ยวรถ เพื่อนำไปแก้ไข
		} else if (action.equals("editForm")) {
			int rid = Integer.parseInt(request.getParameter("rid"));
			RailwayTableDB a = new RailwayTableDB();
			ArrayList<RailwayTable> table = new ArrayList<RailwayTable>();
			table = a.getStationTableList();
			request.setAttribute("lists", table);
			StationDB sta = new StationDB();
			ArrayList<Station> list = new ArrayList<Station>();
			list = sta.getAllStation();
			request.setAttribute("stations", list);
			RailwayTableDB rt = new RailwayTableDB();
			RailwayTable railway = new RailwayTable();
			railway = rt.getStationDetailByRID(rid);
			request.setAttribute("railway", railway);
			RequestDispatcher view = request.getRequestDispatcher("editFormRWTable" + ".jsp");
			view.forward(request, response);
		//ทำการอัพเเดตข้อมุลเที่ยวรถไฟ
		} else if (action.equals("edit")) {
			String rid = request.getParameter("rid");
			String sourceID = request.getParameter("sourceID");
			String destID = request.getParameter("destID");
			String deptime = request.getParameter("deptime");
			String arrtime = request.getParameter("arrtime");
			SourceDestinationDB sddb = new SourceDestinationDB();
			sddb.editSourceDest(sourceID, rid, "1");
			sddb.editSourceDest(destID, rid, "2");
			RailwayDB rwdb = new RailwayDB();
			rwdb.editRailway(rid, deptime, arrtime);
			response.sendRedirect("main");
		}
	}
}