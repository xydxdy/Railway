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

@WebServlet("/pay")
public class UpdateBookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = (String) request.getParameter("action");
		//นำรายการตั๋วไปแสดง
		if (action == null) {
			BookingDetailDB a = new BookingDetailDB();
			ArrayList<BookingDetail> booking = new ArrayList<BookingDetail>();
			booking = a.getBookingDetailList();
			request.setAttribute("booking", booking);
			RequestDispatcher view = request.getRequestDispatcher("updateBooking.jsp");
			view.forward(request, response);
		//ค้นหาจาก TicketID
		} else if (action.equals("search")) {
			String ticketID = (String) request.getParameter("bookingID");
			BookingDetailDB a = new BookingDetailDB();
			ArrayList<BookingDetail> booking = new ArrayList<BookingDetail>();
			booking = a.getBookingDetailList(ticketID);
			request.setAttribute("booking", booking);
			RequestDispatcher view = request.getRequestDispatcher("updateBooking.jsp");
			view.forward(request, response);
		//Update Status Ticket
		} else if (action.equals("update")) {
			String bookingID = (String) request.getParameter("bookingID");
			BookingDB b = new BookingDB();
			b.updateStatus(bookingID);
			BookingDetailDB a = new BookingDetailDB();
			ArrayList<BookingDetail> booking = new ArrayList<BookingDetail>();
			booking = a.getBookingDetailList(bookingID);
			request.setAttribute("booking", booking);
			RequestDispatcher view = request.getRequestDispatcher("updateBooking.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("main");
		}

	}
}
