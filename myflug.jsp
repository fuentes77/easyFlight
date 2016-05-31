<%@ include file="header.jsp" %>

<h1 class="title">Meine Flüge</h1>
<div class="line"></div>

<%
String username=(String)session.getAttribute("session_username");

Connection conn=null;
Statement st=null;
try{
	Class.forName(driver).newInstance();
	conn=DriverManager.getConnection(dbUrl+dbName, dbUsername, dbPassword);
	st=conn.createStatement();

	ResultSet rs=st.executeQuery("SELECT * FROM flug WHERE user='"+username+"'");
	while(rs.next()){
		int id=rs.getInt("id");
		String von=rs.getString("von");
		String nach=rs.getString("nach");
		String abfahrt=rs.getString("abfahrt");
		double preis=rs.getDouble("preis");
		int platz=rs.getInt("platz");
		int flugsteig=rs.getInt("flugsteig");
		int terminal=rs.getInt("terminal");
		String user=rs.getString("user");
		String status=rs.getString("status");
		
%>
		<table>
			<tr>
				<td>FlugID:</td>
				<td><%= id %></td>
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
		</table>

<%
	
	}

	rs.close();
	st.close();
	conn.close();
}catch(Exception e){}

%>

<%@ include file="footer.jsp" %>