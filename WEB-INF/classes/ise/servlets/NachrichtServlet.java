package ise.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.ArrayList;
import java.util.Date;
import java.text.*;
import ise.*;


public class NachrichtServlet extends HttpServlet{

	private static final long serialVersionUID = -2244732469487419265L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		ServiceManagement service=new ServiceManagement();
		HttpSession session=request.getSession();
		String submitValue=request.getParameter("submit");


		if(submitValue.equals("Nachricht senden")){
			String text=request.getParameter("text");
			String von=request.getParameter("von");
			
			
			boolean checkNachricht=service.nachrichtSenden(von, text);
			
			/*request.getRequestDispatcher("header.jsp").include(request, response);
			out.println("<h1 class='title'>Nachrichten</h1><div class='line'></div>");
	
			if(checkNachricht){
				out.println("<font color='green'>Nachricht war erfolgreich!</font>");
			}
			else{
				out.println("<font color='red'>Nachricht war nicht erfolgreich!</font>");
			}
			request.getRequestDispatcher("footer.jsp").include(request, response);*/
			request.getRequestDispatcher("nachricht.jsp").include(request, response);
		}

	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

	}
}