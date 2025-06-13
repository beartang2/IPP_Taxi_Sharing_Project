<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
	// DB 형태 보내주면 DB샘플 만들어서 테스트
    request.setCharacterEncoding("UTF-8");
	//입력받은 파라매터들 변수로 저장 (어차피 resID만 확인하지 않나?)
    Integer resId = Integer.parseInt(request.getParameter("resId"));
	
    String departure = request.getParameter("departure");
	String destination = request.getParameter("destination");
	String hour = request.getParameter("hour");
	
	String condition = request.getParameter("condition");
	
    //초기화
    String sql = "";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
    	
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tables_in_taxi_sharing", "root", "0000");
		if(condition.equals("True")){
			sql = "UPDATE reservations SET currentPeople = currentPeople+1, currentLuggage = currentLuggage+1 WHERE resId = ?";
		}
		else {
			sql = "UPDATE reservations SET currentPeople = currentPeople+1 WHERE resId = ?";
			
		}
        pstmt = conn.prepareStatement(sql);
		
        pstmt.setInt(1, resId);

        int result = pstmt.executeUpdate();

        if (result > 0) {
        	//업데이트 성공하면 세션에 저장
        	session.setAttribute("departure", departure);
            session.setAttribute("destination", destination);
            session.setAttribute("hour", hour);
            // 업데이트 성공, 이후 표시하는 페이지 jsp
            response.sendRedirect("main.jsp");
        } else {
            out.println("업데이트 실패: 해당 ID가 존재하지 않습니다.");
        }
    } catch(Exception e) {
        e.printStackTrace();
        out.println("오류발생 : " + e.getMessage());
    } finally {
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>