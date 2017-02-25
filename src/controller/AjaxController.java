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

@WebServlet("/ajax")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ใช้ในการแสดงเที่ยวรถจากการเลือก ต้นทางและปลายทาง
		String sid = request.getParameter("sid");
		String did = request.getParameter("did");
		RailwayTableDB a = new RailwayTableDB();
		ArrayList<RailwayTable> table = new ArrayList<RailwayTable>();
		if (sid.equals("0") && did.equals("0")) { // ไม่ได้ลือกสถานี
			table = a.getStationTableList();
			System.out.println(1);
		} else if (sid.equals("0")) {// เลือกแต่ Destination
			System.out.println(2);
			table = a.getStationTableList("did", Integer.parseInt(did));
		} else if (did.equals("0")) {// เลือกแต่ Source
			System.out.println(3);
			table = a.getStationTableList("sid", Integer.parseInt(sid));
		} else {// เลือกทั้งสอง
			System.out.println(4);
			table = a.getStationTableList(Integer.parseInt(sid), Integer.parseInt(did));
		}
		HttpSession sess = request.getSession();
		String t = String.valueOf(sess.getAttribute("type"));// ดึงชนิดของ user
																// มา
		// ส่งชนิดของ User ไปยัง ajax เพือแสดง Option
		request.setAttribute("type", t);
		request.setAttribute("lists", table);
		request.setAttribute("Auth", "list");
		StationDB sta = new StationDB();
		// ส่งข้อมูลตารางเดินรถ
		ArrayList<Station> list = new ArrayList<Station>();
		list = sta.getAllStation();
		request.setAttribute("stations", list);
		RequestDispatcher view = request.getRequestDispatcher("ajax.jsp");
		view.forward(request, response);
	}
}
