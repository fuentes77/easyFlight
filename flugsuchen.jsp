<%@ include file="header.jsp" %>

<h1 class="title">Flug suchen</h1>
<div class="line"></div>

<%
String username=(String)session.getAttribute("session_username");
%>

<form action="flugsuchen" method="POST">
<table>
	<tr>
		<td>Flug von:</td>
		<td><input type="text" name="von"></td>
		<td>nach:</td>
		<td><input type="text" name="nach"></td>
	</tr>
	<tr>
		<td>Preis von:</td>
		<td><input type="text" name="min"></td>
		<td>nach:</td>
		<td><input type="text" name="max"></td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="submit" value="Suchen" name="submit">
		</td>
	</tr>
</table>
<input type="hidden" value="<%= username %>" name="username">
</form>







<%@ include file="footer.jsp" %>