<%@ page contentType="text/html; charset=UTF-8" %>
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
        pstmt.setString(2, password); // 실제론 비밀번호는 해시화 해야 합니다.
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
            // 로그인 성공: 세션에 사용자 정보 저장
            session.setAttribute("userId", userId);
            session.setAttribute("userName", rs.getString("name")); // 예: 이름 저장
            
            // 메인 페이지로 이동, 메인 화면 필요 이건 샘플.
            response.sendRedirect("main.jsp");
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
