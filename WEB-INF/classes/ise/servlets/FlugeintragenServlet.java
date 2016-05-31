package ise.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.ArrayList;
import java.util.Date;
import java.text.*;
import ise.*;


public class FlugeintragenServlet extends HttpServlet{

	private static final long serialVersionUID = -2244732469487419265L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		ServiceManagement service=new ServiceManagement();
		HttpSession session=request.getSession();
		String submitValue=request.getParameter("submit");

		

		if(submitValue.equals("Flug erstellen")){
			String von=request.getParameter("von");
			String nach=request.getParameter("nach");
			String abfahrt=request.getParameter("abfahrt");

			SimpleDateFormat mask=new SimpleDateFormat("dd-MM-yyyy HH:mm");
			Date abfahrtDate=null;
			try{
				abfahrtDate=mask.parse(abfahrt);
			}
			catch(ParseException pe){}

			double preis=Double.parseDouble(request.getParameter("preis"));
			int platz=Integer.parseInt(request.getParameter("platz"));
			int flugsteig=Integer.parseInt(request.getParameter("flugsteig"));
			int terminal=Integer.parseInt(request.getParameter("terminal"));
			String status="active";
			String username=request.getParameter("username");
			
			boolean checkFlug=service.createFlug(von, nach, abfahrt, preis, platz, flugsteig, terminal, status, username);

			request.getRequestDispatcher("header.jsp").include(request, response);
			out.println("<h1 class='title'>Flug erstellen</h1><div class='line'></div>");
			if(checkFlug){
				out.println("<font color='green'>Flug erstellen war erfolgreich!</font>");
			}
			else{
				out.println("<font color='red'>Flug erstellen war nicht erfolgreich!</font>");
			}
			request.getRequestDispatcher("footer.jsp").include(request, response);
		}

		/*else if(submitValue.equals("Flug akzeptieren")){
			int anzeigeid=Integer.parseInt(request.getParameter("anzeigeid"));
			String status="active";
			service.updateAnzeigeStatus(anzeigeid, status);

			request.getRequestDispatcher("header.jsp").include(request, response);
			out.println("<h1 class='title'>Flug erstellen</h1><div class='line'></div>");
			out.println("<font color='green'>Flug akzeptieren war erfolgreich!</font>");
			request.getRequestDispatcher("footer.jsp").include(request, response);
		}
		else if(submitValue.equals("Flug nicht akzeptieren")){
			int anzeigeid=Integer.parseInt(request.getParameter("anzeigeid"));
			String status="request";
			service.updateAnzeigeStatus(anzeigeid, status);

			request.getRequestDispatcher("header.jsp").include(request, response);
			out.println("<h1 class='title'>Flug erstellen</h1><div class='line'></div>");
			out.println("<font color='green'>Flug wurde nicht akzeptiert!</font>");
			request.getRequestDispatcher("footer.jsp").include(request, response);
		}
		else if(submitValue.equals("Flug stornieren")){
			int anzeigeid=Integer.parseInt(request.getParameter("anzeigeid"));
			String status="cancel";
			service.updateAnzeigeStatus(anzeigeid, status);

			request.getRequestDispatcher("header.jsp").include(request, response);
			out.println("<h1 class='title'>Flug erstellen</h1><div class='line'></div>");
			out.println("<font color='green'>Flug stornieren war erfolgreich!</font>");
			request.getRequestDispatcher("footer.jsp").include(request, response);
		}*/


	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

	}
}