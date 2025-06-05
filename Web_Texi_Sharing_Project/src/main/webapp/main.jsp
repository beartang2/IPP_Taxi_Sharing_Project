<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if(session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h2>환영합니다, <%= session.getAttribute("userName") %>님!</h2>
<a href="logout.jsp">로그아웃</a>
