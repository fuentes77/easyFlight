<%@ include file="header.jsp" %>

<h1 class="title">Registration</h1>
<div class="line"></div>


<div class="tabbed-content">
      <div class="tab_container">
        <div style="display: none;" id="tab1" class="tab_content">
          <h4>Benutzer</h4>
				<form action="register_benutzer" method="POST" name="registerForm1" onSubmit="return registerSubmit1()">
					<table>
						<tr>
							<td>Username:</td>
							<td><input type="text" name="username"></td>
						</tr>
						<tr>
							<td>Passwort:</td>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td>E-Mail:</td>
							<td><input type="text" name="email"></td>
						</tr>
					</table>
					<input type="hidden" name="registertyp" value="benutzer">
					<input type="submit" value="Registration" name="submit"><br><br>
				</form>
        </div>
       
  
	</div>
</div>




<%@ include file="footer.jsp" %>