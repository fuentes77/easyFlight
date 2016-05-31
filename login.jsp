<%@ include file="header.jsp" %>

<h1 class="title">Einloggen</h1>
<div class="line"></div>

<form action="einloggen" method="POST">
	<table>
		<tr>
			<td>Username:</td>
			<td><input type="text" name="username"></td>
		</tr>
		<tr>
			<td>Passwort:</td>
			<td><input type="password" name="password"></td>
		</tr>
	</table><br>
	<input type="submit" value="Einloggen" name="submit">
</form>


<%@ include file="footer.jsp" %>