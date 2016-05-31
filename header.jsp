<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="ise.*" %>
<%@ page import="ise.servlets.*" %>
<%@ page import="java.sql.*" %>

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


<script language="javascript">
	function registerSubmit1(){
		if(document.registerForm1.username.value=="" || document.registerForm1.password.value=="" || document.registerForm1.email.value==""){
			alert("Sie müssen alle Informationen eingeben!");
			return false;
		}
		else{
			var password=document.registerForm1.password.value;
			if(!(password.length>4)){
				alert("Die Laenge von Passwort muss mindestens 5 sein!");
				return false;
			}
			else if((password.indexOf(" ")!=-1)){
				alert("Passwort darf nicht Leerzeichen enthalten!");
				return false;
			}
			
		}
		return true;
	}
</script>

</head>
<body>
<div id="wrapper">
  <div id="sidebar">
    <div id="logo"><a href="index.jsp"><img src="style/images/logo.png" alt=""></a></div>
    <div id="menu" class="menu-v">
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <%
		if(session.getAttribute("session_username")==null){
		%>
			<li><a href="login.jsp">Einloggen</a></li>
			<li><a href="register.jsp">Registration</a></li>
		<%
		}
		else{
		%>
			<li><a href="flugcreate.jsp">Flug anbieten</a></li>
			<li><a href="myflug.jsp">Meine Flüge</a></li>
			<li><a href="fluglist.jsp">Flugliste anzeigen</a></li>
			<li><a href="flugsuchen.jsp">Flug suchen</a></li>
			<li><a href="mybooking.jsp">Meine Buchungen</a></li>
			<li><a href="logout.jsp">Ausloggen</a></li>
		<%
			
		}
		%>
        
        
      </ul>
    </div>
   
  </div>
  <div id="content">