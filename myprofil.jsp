<%@ include file="header.jsp" %>

<h1 class="title">Mein Profil</h1>
<div class="line"></div>

<%
ServiceManagement service=new ServiceManagement();
String usertyp=(String)session.getAttribute("session_usertyp");
String username=(String)session.getAttribute("session_username");


if(usertyp.equals("Benutzer")){
	Benutzer user=(Benutzer)service.getUser(username);
	SimpleDateFormat mask=new SimpleDateFormat("dd-MM-yyyy"); 
	String stringGeburtsDatum=mask.format(user.getGeburtsDatum());
%>
	<table>
		<tr>
			<td>Usertyp:</td>
			<td><%= usertyp %></td>
		</tr>
		<tr>
			<td>Username:</td>
			<td><%= user.getUsername() %></td>
		</tr>
		<tr>
			<td>E-Mail:</td>
			<td><%= user.getEmail() %></td>
		</tr>
		<tr>
			<td>Vorname:</td>
			<td><%= user.getVorname() %></td>
		</tr>
		<tr>
			<td>Nachname:</td>
			<td><%= user.getNachname() %></td>
		</tr>
		<tr>
			<td>Geburtsdatum:</td>
			<td><%= stringGeburtsDatum %></td>
		</tr>
	</table>
<%
}
else if(usertyp.equals("Fluggesellschaft")){
	Fluggesellschaft user=(Fluggesellschaft)service.getUser(username);
%>
	<table>
		<tr>
			<td>Usertyp:</td>
			<td><%= usertyp %></td>
		</tr>
		<tr>
			<td>Username:</td>
			<td><%= user.getUsername() %></td>
		</tr>
		<tr>
			<td>E-Mail:</td>
			<td><%= user.getEmail() %></td>
		</tr>
		<tr>
			<td>Name der Fluggesellschaft:</td>
			<td><%= user.getName() %></td>
		</tr>
		<tr>
			<td>Adresse:</td>
			<td><%= user.getAdresse() %></td>
		</tr>
		<tr>
			<td>Telefon:</td>
			<td><%= user.getTelefon() %></td>
		</tr>
	</table>

<%
}
else if(usertyp.equals("Statistiker")){
	Statistiker user=(Statistiker)service.getUser(username);
%>
	<table>
		<tr>
			<td>Usertyp:</td>
			<td><%= usertyp %></td>
		</tr>
		<tr>
			<td>Username:</td>
			<td><%= user.getUsername() %></td>
		</tr>
		<tr>
			<td>E-Mail:</td>
			<td><%= user.getEmail() %></td>
		</tr>
		<tr>
			<td>Telefon:</td>
			<td><%= user.getTelefon() %></td>
		</tr>
	</table>
<%
}
%>




<%@ include file="footer.jsp" %>