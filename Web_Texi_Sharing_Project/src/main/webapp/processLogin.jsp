<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");
    
    String sql = "SELECT * FROM user WHERE userId = ? AND password = ?";
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, password); 
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
            // 로그인 성공
            session.setAttribute("userId", userId);
            session.setAttribute("userName", rs.getString("name"));

            if("admin".equals(userId)) {
                // 관리자면 adminMain.jsp로
                response.sendRedirect("adminMain.jsp");
            } else {
                // 일반 유저는 메인으로
                response.sendRedirect("welcome_redirection.jsp");
            }
        } else {
            // 로그인 실패
            out.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); history.back();</script>");
        }
    } catch(Exception e) {
        out.println("DB 오류: " + e.getMessage());
    } finally {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>
