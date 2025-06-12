<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
	// DB 형태 보내주면 DB샘플 만들어서 테스트
    request.setCharacterEncoding("UTF-8");
	//입력받은 파라매터들 변수로 저장 (어차피 resID만 확인하지 않나?)
    Integer resId = Integer.parseInt(request.getParameter("resId"));
	String condition = request.getParameter("condition");
	String allId = request.getParameter("allId");
	String myId = request.getParameter("myId");
	
	
	
	//나의 id를 제거한 id를 update할 문장 생성
	//'&'를 기준으로 분해해서 Array로 저장
	String[] idArray = allId.split("&");
	List<String> idList = new ArrayList<>();
	//Array에서 내 id를 제외한 다른 id 들을 저장
	for (String id : idArray) {
	    if (!id.equals(myId) && !id.equals(myId + "*") && !id.isEmpty()) {
	        idList.add(id);
	    }
	}
	
	//아이디& 형태로 업데이트할id목록 저장
	String updateId = String.join("&", idList) + "&"; // 다시 조립하면서 중복 & 방지
	
	
    //초기화
    String sql = "";
    Connection conn = null;
    PreparedStatement pstmt = null;
    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tables_in_taxi_sharing", "root", "0000");
		if(condition.equals("True")){
			sql = "UPDATE reservations SET currentPeople = currentPeople-1, currentLuggage = currentLuggage-1, id = ? WHERE resId = ?";
		}
		else {
			sql = "UPDATE reservations SET currentPeople = currentPeople+1, id = ? WHERE resId = ?";
			
		}
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, updateId);
        pstmt.setInt(2, resId);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            // 업데이트 성공
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