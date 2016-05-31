<%@ include file="header.jsp" %>

<h1 class="title">Meine Buchungen</h1>
<div class="line"></div>

<%
String username=(String)session.getAttribute("session_username");

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

	ResultSet rs=st.executeQuery("SELECT * FROM buchung where userid="+userid);
	while(rs.next()){
		int flugid=rs.getInt("flugid");
		int platz=rs.getInt("platz");

		Statement st3=conn.createStatement();;
		ResultSet rs3=st3.executeQuery("SELECT * FROM flug WHERE id="+flugid);
		while(rs3.next()){
			
			
			String von=rs3.getString("von");
			String nach=rs3.getString("nach");
			String abfahrt=rs3.getString("abfahrt");
			double preis=rs3.getDouble("preis");
			int flugsteig=rs3.getInt("flugsteig");
			int terminal=rs3.getInt("terminal");
			String user=rs3.getString("user");
			String status=rs3.getString("status");
		
		
		
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
			</form>
		</table>
			
<%
		}
		rs3.close();
		st3.close();
		
	}

	rs.close();
	st.close();
	conn.close();
}catch(Exception e){}

%>

<%@ include file="footer.jsp" %>