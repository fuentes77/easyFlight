package ise.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.ArrayList;
import java.util.Date;
import java.text.*;
import ise.*;



public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = -2244732469487419265L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		ServiceManagement service=new ServiceManagement();
		HttpSession session=request.getSession();
		String submitValue=request.getParameter("submit");

		

		if(submitValue.equals("Einloggen")){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
		
			boolean checkLogin=service.login(username, password);

			if(checkLogin){
				session.setAttribute("session_username", username);
				
				response.sendRedirect("index.jsp");
			}
			else{
				request.getRequestDispatcher("header.jsp").include(request, response);
				out.println("<h1 class='title'>Einloggen</h1><div class='line'></div>");
				out.println("<font color='red'>Login war nicht erfolgreich!</font>");
				request.getRequestDispatcher("footer.jsp").include(request, response);	
			}
		}


	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

	}
}