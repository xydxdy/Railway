package controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/calender")
public class CalenderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// ดึงหน้า Calendar มาแสดง
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("calendar.jsp");
		request.setAttribute("Auth", "calender");
		view.forward(request, response);
	}
}
