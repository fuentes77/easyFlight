<%@ include file="header.jsp" %>

<h1 class="title">Welcome</h1>
<div class="line"></div>

<%
if(session.getAttribute("session_username")!=null){
out.println("Welcome "+session.getAttribute("session_username"));
}
else{
out.println("Startseite");
}
%>


<%@ include file="footer.jsp" %>