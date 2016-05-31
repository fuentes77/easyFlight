package ise.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.ArrayList;
import java.util.Date;
import java.text.*;
import ise.*;


public class FlugbuchenServlet extends HttpServlet{

	private static final long serialVersionUID = -2244732469487419265L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		ServiceManagement service=new ServiceManagement();
		HttpSession session=request.getSession();
		String submitValue=request.getParameter("submit");

		

		if(submitValue.equals("Flug buchen")){
			int flugid=Integer.parseInt(request.getParameter("flugid"));
			int userid=Integer.parseInt(request.getParameter("userid"));
			
			
			
			int platz=-1;
			try{
				platz=Integer.parseInt(request.getParameter("platz"));
			}catch(NumberFormatException e){}
			
			
			boolean checkBuchung=service.createBuchung(flugid, userid, platz);

			request.getRequestDispatcher("header.jsp").include(request, response);
			out.println("<h1 class='title'>Flug buchen</h1><div class='line'></div>");
			
					if(checkBuchung){
						out.println("<font color='green'>Flug buchen war erfolgreich!</font>");
					}
					else{
						out.println("<font color='red'>Flug buchen war nicht erfolgreich!</font>");
					}
			
			request.getRequestDispatcher("footer.jsp").include(request, response);
		}


	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

	}
}