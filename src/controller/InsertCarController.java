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
@WebServlet("/insertCar")
public class InsertCarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = (String) request.getParameter("action");
		//เป็นการดึงชื่อรายการขบวนรถไฟมาก่อนเพือไปแสดงในหน้า insertCar
		if (action == null) {
			RailwayTableDB a=new RailwayTableDB();
			ArrayList<RailwayTable> table = new ArrayList<RailwayTable>();
			table=a.getStationTableList();
			request.setAttribute("railways", table);
			RequestDispatcher view=request.getRequestDispatcher("insertCar.jsp");
			view.forward(request, response);
		//เพิ่มตู้รถไฟ
		} else if (action.equals("insert")) {
			CarDB db = new CarDB();
			String carType=request.getParameter("carType");
			String price=request.getParameter("price");
			String rid=request.getParameter("rid");
			db.insertCar(carType, price, rid);
			response.sendRedirect("insertCar");
		} else {
			response.sendRedirect("insertCar");
		}
	}
}
