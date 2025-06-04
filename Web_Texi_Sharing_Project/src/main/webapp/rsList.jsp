<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>예약 가능 목록</title>

<script type ="text/javascript">
	
</script>

</head>
<body>
<div class="container py-4">
	<header class="pb-3 mb-4 border-bottom">
	<a href="./welcome.jsp" class="d-flex align-items-center text-darktext-decoration-none">
	<svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
	<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8
	2.207l6 .646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-
	1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
	<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2
	13 .5V9.29316-6Z"/>
	</svg>
	<span class="fs-4">Home</span>
	</a>
	</header>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">예약 목록</h1>
        </div>
    </div>
    
	<%-- 아이디 있는 DB만들고 실제로 테스트ㄱㄱ --%>
    <table class="table table-striped">
        <thead>
        <tr>
        	<%--속성값 이름 튜플--%>
            <th>출발지</th>
            <th>목적지</th>
            <th>시간</th>
            <th>차량 종류</th>
            <th>현재 인원</th>
            <th>최대 인원</th>
            <th>사용 짐용량</th>
            <th>최대 짐용량</th>
            <th>비용</th>
            <th>
        </tr>
        </thead>
        <tbody>
        <%
        	//DB 연결문
        	//조회 부분 확인해서 수정 + 실제 DB에 대응되게 DB샘플 만들고 수정 및 테스트
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            

            try {
            	String id= "id";
                Class.forName("com.mysql.cj.jdbc.Driver"); // DB 드라이버
                //연결할 DB (url, id, pw)
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tables_in_taxi_sharing", "root", "0000");
                //조건을 포함한 쿼리문 작성
                String sql = "SELECT * FROM reservations WHERE id LIKE ? OR id LIKE ?";
            	pstmt = conn.prepareStatement(sql);
            	
            	//%id*% 와 %id%가 포함되있는지 검색
            	pstmt.setString(1, "%" + id + "*%" );
            	pstmt.setString(2, "%" + id + "%");
            	
                rs = pstmt.executeQuery();
                
                //쿼리문으로 받아온 테이블 출력용 반복문
                while (rs.next()) {
                	
                	//포함되어 있는지 확인(id+*로 뒤에 별은 짐 소유를 의미)
                	String dbIds = rs.getString("id");
                    if(dbIds.contains(id + "*")) {
                        String checkLuggage = "true";
                    } else {
                    	String checkLuggage = "false";
                    }
        %>
        
        
        <tr>
        	<td><%= rs.getString("departure") %></td>
        	<td><%= rs.getString("destination") %></td>      	
        	<td><%= rs.getInt("hour") %></td>
        	<td><%= rs.getString("carType") %></td>
        	<td><%= rs.getInt("currentPeople") %></td>
        	<td><%= rs.getInt("maxPeople") %></td>
        	<td><%= rs.getInt("currentLuggage") %></td>
        	<td><%= rs.getInt("maxLuggage") %></td>
        	<td><%= rs.getInt("fare") %></td>
        	<td>
        		<form name = "check" action="checkRs.jsp" method = "post">
        			<input type="hidden" name="resId" value="<%= rs.getInt("resId") %>">
					<input type="hidden" name="departure" value="<%= rs.getString("departure") %>">
					<input type="hidden" name="destination" value="<%= rs.getString("destination") %>">
					<input type="hidden" name="hour" value="<%= rs.getInt("hour") %>">
					<input type="hidden" name="carType" value="<%= rs.getString("carType") %>">
					<input type="hidden" name="currentPeople" value="<%= rs.getInt("currentPeople") %>">
					<input type="hidden" name="maxPeople" value="<%= rs.getInt("maxPeople") %>">
					<input type="hidden" name="currentLuggage" value="<%= rs.getInt("currentLuggage") %>">
					<input type="hidden" name="maxLuggage" value="<%= rs.getInt("maxLuggage") %>">
					<input type="hidden" name="fare" value="<%= rs.getInt("fare") %>">
					<input type="hidden" name="checkLuggage" value="<%= rs.getString("checkLuggage") %>">
        			<button type="submit" class="btn btn-info">예약 확인</button>	
        		</form>
        	</td>
        </tr>
        
        <%
                }//여기까지 while문
                
            } catch (Exception e) {
                out.println("<tr><td colspan='10'>에러: " + e.getMessage() + "</td></tr>");
            } finally {
            	//DB 종료는 연순서의 역순으로
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
        </tbody>
    </table>
	
	<footer class = "pt-3 mt-4 text-body-secondatry border-top">
	 &copy; Texi_Sharing
</footer>
</div>
</body>
</html>