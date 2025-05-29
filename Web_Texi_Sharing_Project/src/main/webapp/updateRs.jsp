<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
	// DB 형태 보내주면 DB샘플 만들어서 테스트
    request.setCharacterEncoding("UTF-8");
	//입력받은 파라매터들 변수로 저장
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String dept = request.getParameter("dept");
    String condition = request.getParameter("condition");
	//초기화
    String sql = "";
	
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb", "root", "0000");
		if(condition.equals("True")){
			sql = "UPDATE student SET people = people+1, condition = condition+1  WHERE id = ?";
		}
		else {
			sql = "UPDATE student SET people = people+1  WHERE id = ?";
			
		}
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, id);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            // 업데이트 성공
            response.sendRedirect("main.jsp");
        } else {
            out.println("업데이트 실패: 해당 ID가 존재하지 않습니다.");
        }
    } catch(Exception e) {
        e.printStackTrace(out);
    } finally {
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>