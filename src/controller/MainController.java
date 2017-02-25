package controller;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		// นำข้อมูลตารางเดินรถมาแสดงในหน้า main
		RailwayTableDB a = new RailwayTableDB();
		ArrayList<RailwayTable> table = new ArrayList<RailwayTable>();
		table = a.getStationTableList();
		HttpSession sess = request.getSession();
		String t = String.valueOf(sess.getAttribute("type"));
		request.setAttribute("type", t);
		request.setAttribute("lists", table);
		request.setAttribute("Auth", "list");
		StationDB sta = new StationDB();
		ArrayList<Station> list = new ArrayList<Station>();
		list = sta.getAllStation();
		request.setAttribute("stations", list);
		if (action == null) {
			RequestDispatcher view = request.getRequestDispatcher("index" + ".jsp");
			view.forward(request, response);
		//สำหรับ Admin ซื้อตั๋ว
		} else if (action.equals("send")) {
			RequestDispatcher view = request.getRequestDispatcher("buySta" + ".jsp");
			view.forward(request, response);
		}
	}
}