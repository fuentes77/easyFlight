<%@ include file="header.jsp" %>

<h1 class="title">Nachrichten</h1>
<div class="line"></div>


<%
String username=(String)session.getAttribute("session_username");

Connection conn=null;
Statement st=null;
try{
	Class.forName(driver).newInstance();
	conn=DriverManager.getConnection(dbUrl+dbName, dbUsername, dbPassword);
	st=conn.createStatement();

	ResultSet rs=st.executeQuery("SELECT * FROM nachricht");
	while(rs.next()){
		String von=rs.getString("von");
		String text=rs.getString("text");
		String datum=rs.getString("datum");
%>
		<table>
			<tr>
				<td>Von: <%= von %></td>
				<td>Datum: <%= datum %></td>
			</tr>
			<tr>
				<td colspan="2">Text: <%= text %></td>
			</tr>
		</table>
<%
	}
	rs.close();
	st.close();
	conn.close();
}catch(Exception e){}
%>
<div class="tabbed-content">
      <div class="tab_container">
        <div style="display: none;" id="tab1" class="tab_content">
          <h4>Nachricht</h4>
				<form action="nachricht" method="POST">
					<table>
						<tr>
							<textarea cols="50" rows="10" name="text"></textarea> 
						</tr>
						
					</table>
					<input type="hidden" value="<%= username %>" name="von">
					<input type="submit" value="Nachricht senden" name="submit"><br><br>
				</form>
        </div>
       
  
	</div>
</div>




<%@ include file="footer.jsp" %>