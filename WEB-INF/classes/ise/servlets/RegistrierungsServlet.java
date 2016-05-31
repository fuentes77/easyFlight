package ise.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.ArrayList;
import java.util.Date;
import java.text.*;
import ise.*;


public class RegistrierungsServlet extends HttpServlet{

	private static final long serialVersionUID = -2244732469487419265L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		ServiceManagement service=new ServiceManagement();
		HttpSession session=request.getSession();
		String submitValue=request.getParameter("registertyp");


		if(submitValue.equals("benutzer")){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String email=request.getParameter("email");
			
			boolean checkRegister=service.registerUser(username, password, email);
			
			request.getRequestDispatcher("header.jsp").include(request, response);
			out.println("<h1 class='title'>Registration</h1><div class='line'></div>");
	
			if(checkRegister){
				out.println("<font color='green'>Registration war erfolgreich!</font>");
			}
			else{
				out.println("<font color='red'>Registration war nicht erfolgreich!</font>");
			}
			request.getRequestDispatcher("footer.jsp").include(request, response);
		}

	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

	}
}