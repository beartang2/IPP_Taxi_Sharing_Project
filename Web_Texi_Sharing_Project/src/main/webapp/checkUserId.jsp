<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String userId = request.getParameter("userId");
	String result = "OK";

	try {
		String sql = "SELECT userId FROM user WHERE userId = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			result = "DUPLICATE"; // 이미 존재하는 아이디
		}

		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		result = "ERROR";
	}

	out.print(result); // OK or DUPLICATE or ERROR
%>
