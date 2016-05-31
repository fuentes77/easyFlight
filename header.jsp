<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="ise.*" %>
<%@ page import="ise.servlets.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>


<%
String dbUrl="jdbc:mysql://localhost:3306/";
String dbName="ise";
String driver="com.mysql.jdbc.Driver";
String dbUsername="root"; 
String dbPassword="root";
%>

<!DOCTYPE HTML>
<html lang="en">
<head>
<title>ISE Test</title>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="style/images/favicon.png">
<link rel="stylesheet" type="text/css" href="style/css/style.css" media="all">
<link href='http://fonts.googleapis.com/css?family=Amaranth' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic' rel='stylesheet' type='text/css'>

<script src="style/js/jquery-1.6.4.min.js"></script>
<script src="style/js/ddsmoothmenu.js"></script>
<script src="style/js/jquery.jcarousel.js"></script>
<script src="style/js/jquery.prettyPhoto.js"></script>
<script src="style/js/carousel.js"></script>
<script src="style/js/jquery.flexslider-min.js"></script>
<script src="style/js/jquery.masonry.min.js"></script>
<script src="style/js/jquery.slickforms.js"></script>



</head>
<body>
<div id="wrapper">
  <div id="sidebar">
    <div id="logo"><a href="index.jsp"><img src="style/images/logo.png" alt=""></a></div>
    <div id="menu" class="menu-v">
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <%
		String sessionUsername=(String)session.getAttribute("session_username");
		String usertyp=null;
		if(sessionUsername==null){
		%>
			<li><a href="login.jsp">Einloggen</a></li>
			<li><a href="register.jsp">Registration</a></li>
		<%
		}
		else{
			Connection conn=null;
			Statement st=null;
			try{
				Class.forName(driver).newInstance();
				conn=DriverManager.getConnection(dbUrl+dbName, dbUsername, dbPassword);
				st=conn.createStatement();
				
				HttpSession session2=request.getSession();
				ResultSet rs=st.executeQuery("SELECT * FROM user WHERE username='"+sessionUsername+"'");
				while(rs.next()){
					usertyp=rs.getString("usertyp");
					session2.setAttribute("session_usertyp", usertyp);
				}
				rs.close();
				st.close();
				conn.close();
			}catch(Exception e){}

			if(usertyp.equals("Benutzer")){
		%>
				<li><a href="fluglist.jsp">Flugliste anzeigen</a></li>
		<%
			}
			else if(usertyp.equals("Reisebüro")){
		%>
				<li><a href="fluglist.jsp">Flugliste anzeigen</a></li>
				<li><a href="flugsuchen.jsp">Flug suchen</a></li>
				<li><a href="mybooking.jsp">Meine Buchungen</a></li>
				<li><a href="nachricht.jsp">Nachrichten</a></li>
		<%
			}
			else if(usertyp.equals("Admin")){
		%>
				<li><a href="flugcreate.jsp">Flug anbieten</a></li>
				<li><a href="myflug.jsp">Meine Flüge</a></li>
		<%
			}
		%>
			<li><a href="logout.jsp">Ausloggen</a></li>
		<%
			
		}
		%>
        
        
      </ul>
    </div>
   
  </div>
  <div id="content">