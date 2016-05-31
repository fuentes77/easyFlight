<%@ include file="header.jsp" %>

<h1 class="title">Flug erstellen</h1>
<div class="line"></div>


<form action="flugcreate" method="POST" name="flugCreateForm">
	<table>
		<tr>
			<td>Flug von:</td>
			<td><input type="text" name="von"></td>
		</tr>
		<tr>
			<td>Flug nach:</td>
			<td><input type="text" name="nach"></td>
		</tr>
		<tr>
			<td>Datum der Abfahrt:</td>
			<td><input type="text" name="abfahrt">(dd-MM-yyyy HH:mm)</td>
		</tr>
		<tr>
			<td>Preis:</td>
			<td><input type="text" name="preis">(Bsp.: 250.50)</td>
		</tr>
		<tr>
			<td>Plätze:</td>
			<td><input type="text" name="platz"></td>
		</tr>
		<tr>
			<td>Flugsteig:</td>
			<td><input type="text" name="flugsteig"></td>
		</tr>
		<tr>
			<td>Terminal:</td>
			<td><input type="text" name="terminal"></td>
		</tr>
	</table>
	<input type="hidden" name="username" value="<%= (String)session.getAttribute("session_username") %>">
	<input type="submit" value="Flug erstellen" name="submit"><br><br>
</form>


<%@ include file="footer.jsp" %>