package ise.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


import java.util.ArrayList;
import java.util.Date;
import java.text.*;
import ise.*;


public class FlugsuchenServlet extends HttpServlet{

	private static final long serialVersionUID = -2244732469487419265L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		ServiceManagement service=new ServiceManagement();
		HttpSession session=request.getSession();
		String submitValue=request.getParameter("submit");

		

		if(submitValue.equals("Suchen")){
			String username=request.getParameter("username");
			String vonPar=request.getParameter("von");
			String nachPar=request.getParameter("nach");
			double min=Double.parseDouble(request.getParameter("min"));
			double max=Double.parseDouble(request.getParameter("max"));

			String dbUrl="jdbc:mysql://localhost:3306/";
			String dbName="ise";
			String driver="com.mysql.jdbc.Driver";
			String dbUsername="root"; 
			String dbPassword="root";
			
			
			request.getRequestDispatcher("header.jsp").include(request, response);
			out.println("<h1 class='title'>Flug suchen</h1>");
			out.println("<div class='line'></div>");
			

			Connection conn=null;
			Statement st=null;
			try{
				Class.forName(driver).newInstance();
				conn=DriverManager.getConnection(dbUrl+dbName, dbUsername, dbPassword);
				st=conn.createStatement();

				int userid=-1;
				Statement st2=conn.createStatement();;
				ResultSet rs2=st2.executeQuery("SELECT * FROM user WHERE username='"+username+"'");
				while(rs2.next()){
					userid=rs2.getInt("id");
				}
				rs2.close();
				st2.close();

				ResultSet rs=st.executeQuery("SELECT * FROM flug");
				while(rs.next()){
					int flugid=rs.getInt("id");
					String von=rs.getString("von");
					String nach=rs.getString("nach");
					String abfahrt=rs.getString("abfahrt");
					double preis=rs.getDouble("preis");
					int platz=rs.getInt("platz");
					int flugsteig=rs.getInt("flugsteig");
					int terminal=rs.getInt("terminal");
					String user=rs.getString("user");
					String status=rs.getString("status");

				
					if(vonPar.equals(von) && nachPar.equals(nach)){
						if(preis>=min && preis<=max){
						
							out.println("<table>");
								out.println("<tr>");
									out.println("<td>FlugID:</td>");
									out.println("<td>"+flugid+"</td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>Flug von:</td>");
									out.println("<td>"+von+"</td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>Flug nach:</td>");
									out.println("<td>"+nach+"</td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>Datum der Abfahrt:</td>");
									out.println("<td>"+abfahrt+"</td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>Preis:</td>");
									out.println("<td>"+preis+"</td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>Plätze:</td>");
									out.println("<td>"+platz+"</td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>Flugsteig:</td>");
									out.println("<td>"+flugsteig+"</td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>Terminal:</td>");
									out.println("<td>"+terminal+"</td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>Anbieter:</td>");
									out.println("<td>"+user+"</td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>Status:</td>");
									out.println("<td>"+status+"</td>");
								out.println("</tr>");
								if(!(user.equals(username)))
								{	
									out.println("<form action='flugbuchen' method='POST'>");
									out.println("<tr>");
										out.println("<td>Anzahl von Tickets:</td>");
										out.println("<td><input type='text' name='platz'></td>");
									out.println("</tr>");
									out.println("<tr>");
										out.println("<td colspan='2'>");
												out.println("<input type='hidden' value='"+flugid+"' name='flugid'>");
												out.println("<input type='hidden' value='"+userid+"' name='userid'>");
												out.println("<input type='submit' value='Flug buchen' name='submit'>");
										out.println("</td>");
									out.println("</tr>");
									out.println("</form>");
								}
							out.println("</table>");
						}
					}


				}
			
		
				rs.close();
				st.close();
				conn.close();
			}catch(Exception e){}
			
			
				
			
			request.getRequestDispatcher("footer.jsp").include(request, response);
		}
		

	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

	}
}