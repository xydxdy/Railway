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

@WebServlet({ "/login", "/logout", "/register", "/profile" })
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDB userDB = new UserDB();
		BookingDetailDB bookingDtailDB = new BookingDetailDB();
		String action = request.getParameter("action");
		request.setAttribute("Au", "user");
		//หากไม่ส่ง action มาจะเด้งไปหน้า login
		if (action == null) {
			RequestDispatcher login = request.getRequestDispatcher("login.jsp");
			login.forward(request, response);
		//เมื่อกด login 
		} else if (action.equals("doLogin")) {
			String username = new String(request.getParameter("username"));
			String password = new String(request.getParameter("password"));
			User check = userDB.doLogin(username);
			//เชคว่ามี Username นี้หรือไม่
			if (check.getCheck() == true) {
				//เชค Password
				if (check.getPassword().equals(password)) {
					response.sendRedirect("main");
					HttpSession sess = request.getSession();
					//เก็บ Session
					sess.setAttribute("name", check.getFname());
					sess.setAttribute("type", check.getType());
					sess.setAttribute("uid", check.getUserID());
					sess.setAttribute("idno", check.getIDNo());
				} else {
					RequestDispatcher login = request.getRequestDispatcher("login.jsp");
					request.setAttribute("Auth", "error");
					login.forward(request, response);
				}
			//ไม่พบ username
			} else {
				RequestDispatcher login = request.getRequestDispatcher("login.jsp");
				request.setAttribute("Auth", "error");
				login.forward(request, response);
			}
		//log out Clear Session
		} else if (action.equals("logout")) {
			HttpSession sess = request.getSession();
			sess.setAttribute("name", null);
			sess.setAttribute("type", null);
			sess.invalidate();
			response.sendRedirect("main");
		//Register
		} else if (action.equals("register")) {
			UserDB user = new UserDB();
			String email = request.getParameter("myemail");
			String password = request.getParameter("password");
			String cpassword = request.getParameter("cpassword");
			String fName = new String(request.getParameter("fname").getBytes("ISO8859_1"), "utf-8");
			String lName = new String(request.getParameter("lname").getBytes("ISO8859_1"), "utf-8");
			String idNo = request.getParameter("idNo");
			String address = new String(request.getParameter("address").getBytes("ISO8859_1"), "utf-8");
			String tel = request.getParameter("tel");
			//เชคว่า Password ตรงกันไหม
			if (cpassword.equals(password)) {
				user.insertUser(email, password, fName, lName, idNo, address, tel, "user");
				User s = new User();
				s = user.doLogin(email);
				if (s.getCheck()) {
					HttpSession sess = request.getSession();
					sess.setAttribute("name", s.getFname());
					sess.setAttribute("type", s.getType());
					sess.setAttribute("uid", s.getUserID());
					sess.setAttribute("idno", s.getIDNo());
					response.sendRedirect("main");
				}
			}
		//ดึงข้อมูลตั๋วววววไปแสดงในหน้า Profile
		} else if (action.equals("profile")) {
			HttpSession sess = request.getSession();
			String idno = sess.getAttribute("idno").toString();
			String userid = sess.getAttribute("uid").toString();
			User prof = userDB.doProfile(idno);
			ArrayList<BookingDetail> booklist = bookingDtailDB.getBookingDetail2(userid);
			ArrayList<TicketDetail> tic = new ArrayList<TicketDetail>();
			TicketDetailDB ticketDB = new TicketDetailDB();
			for (int i = 0; i < booklist.size(); i++) {
				TicketDetail a = new TicketDetail();
				a = ticketDB.getOneTicketByBookingID(booklist.get(i).getBookingID());
				tic.add(a);
			}
			request.setAttribute("tic", tic);
			request.setAttribute("profile", prof);
			request.setAttribute("booklist", booklist);
			RequestDispatcher profile = request.getRequestDispatcher("profile.jsp");
			profile.forward(request, response);
			//แก้ไขข้อมูล User
		} else if (action.equals("edit")) {
			UserDB user = new UserDB();
			String userID = request.getParameter("userID");
			String idNo = request.getParameter("idNo");
			String email = request.getParameter("email");
			String fName = new String(request.getParameter("fname").getBytes("ISO8859_1"), "utf-8");
			String lName = new String(request.getParameter("lname").getBytes("ISO8859_1"), "utf-8");
			String address = new String(request.getParameter("address").getBytes("ISO8859_1"), "utf-8");
			String tel = request.getParameter("tel");
			user.updateUser(email, fName, lName, address, tel, idNo, userID);
			RequestDispatcher profile = request.getRequestDispatcher("login.jsp");
			profile.forward(request, response);
		}
	}
}
