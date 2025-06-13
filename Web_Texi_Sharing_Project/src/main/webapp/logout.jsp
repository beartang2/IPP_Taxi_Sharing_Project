<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    session.invalidate();
    response.sendRedirect("welcome.jsp");
%>