<%@ include file="header.jsp" %>

<%
session.invalidate();
response.sendRedirect("index.jsp");
%>

<%@ include file="footer.jsp" %>