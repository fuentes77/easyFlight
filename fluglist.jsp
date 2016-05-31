<%@ include file="header.jsp" %>

<h1 class="title">Flugliste</h1>
<div class="line"></div>

<%
String username=(String)session.getAttribute("session_username");

Connection conn=null;
Statement st=null;
try{
	Class.forName(driver).newInstance();
	conn=DriverManager.getConnection(dbUrl+dbName, dbUsername, dbPassword);
	st=conn.createStatement();

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
		
		int userid=-1;
		Statement st2=conn.createStatement();;
		ResultSet rs2=st2.executeQuery("SELECT * FROM user WHERE username='"+username+"'");
		while(rs2.next()){
			userid=rs2.getInt("id");
			
		}
		rs2.close();
		st2.close();
		
%>
		<table>
			<tr>
				<td>FlugID:</td>
				<td><%= flugid %></td>
			</tr>
			<tr>
				<td>Flug von:</td>
				<td><%= von %></td>
			</tr>
			<tr>
				<td>Flug nach:</td>
				<td><%= nach %></td>
			</tr>
			<tr>
				<td>Datum der Abfahrt:</td>
				<td><%= abfahrt %></td>
			</tr>
			<tr>
				<td>Preis:</td>
				<td><%= preis %></td>
			</tr>
			<tr>
				<td>Plätze:</td>
				<td><%= platz %></td>
			</tr>
			<tr>
				<td>Flugsteig:</td>
				<td><%= flugsteig %></td>
			</tr>
			<tr>
				<td>Terminal:</td>
				<td><%= terminal %></td>
			</tr>
			<tr>
				<td>Anbieter:</td>
				<td><%= user %></td>
			</tr>
			<tr>
				<td>Status:</td>
				<td><%= status %></td>
			</tr>
			
			<%
			//if(!(user.equals(username)))
			if(!(usertyp.equals("Benutzer")))
			{
			%>
			<form action="flugbuchen" method="POST">
			<tr>
				<td>Anzahl von Tickets:</td>
				<td><input type="text" name="platz"></td>
			</tr>
			<tr>
				<td colspan="2">
						<input type="hidden" value="<%= flugid %>" name="flugid">
						<input type="hidden" value="<%= userid %>" name="userid">
						<input type="submit" value="Flug buchen" name="submit">
				</td>
			</tr>
			</form>
		</table>
			<%
			}
			%>
<%
		
	}

	rs.close();
	st.close();
	conn.close();
}catch(Exception e){}

%>

<%@ include file="footer.jsp" %>