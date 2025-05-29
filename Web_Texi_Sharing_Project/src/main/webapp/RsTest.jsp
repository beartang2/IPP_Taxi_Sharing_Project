<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>도서 등록</title>
<script type ="text/javascript">
	funciton addTo(){
		if()
	}



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
    
    <div><%-- 드롭박스부분 --%> 
    	<from method="get" action"">
    		<label for="id">출발지:</label>
	    	<select name="departure" id="departure">
	        	<option value="배재대">배재대</option>
		        <option value="대전역">대전역</option>
		        <option value="서대전역">서대전역</option>
		    </select>
		
		    <label for="destination">목적지:</label>
		    <select name="destination" id="destination">
		    	<option value="배재대">배재대</option>
		        <option value="대전역">대전역</option>
		        <option value="서대전역">서대전역</option>
		    </select>
		    
			<%-- DB구성 확인하고 value값 수정 --%>
		    <label for="time">시간:</label>
		    <select name="time" id="time">
		        <option value="0">08:00</option>
		        <option value="">08:30</option>
		        <option value="">09:00</option>
		        <option value="">09:30</option>
		    </select>
		    
			<%-- 조회 클릭시 DB가져오는거 출발지 목적지 시간 비교하고 가져오게 수정 --%>
		    <button type="submit" class="btn btn-primary">조회</button>
	   	</from>
    </div>

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
            <th>현재 짐</th>
            <th>최대 짐</th>
            <th></th>
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
            	
                Class.forName("com.mysql.cj.jdbc.Driver"); // DB 드라이버
                //연결할 DB (url, id, pw)
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb", "root", "0000");
                //조건을 포함한 쿼리문 작성
                String sql = "SELECT * FROM student";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                //쿼리문으로 받아온 테이블 출력용 반복문
                while (rs.next()) {
        %>
        
        
        <tr>
        	<td><%= rs.getString("id") %></td>
        	<td><%= rs.getString("name") %></td>
        	<td><%= rs.getString("dept") %></td>
        	<td>
        		<form name = "update" action="addRs.jsp" method = "post">
        			<input type="hidden" name="id" value="<%= rs.getString("id") %>">
            		<input type="hidden" name="name" value="<%= rs.getString("name") %>">
            		<input type="hidden" name="dept" value="<%= rs.getString("dept") %>">
            		<%-- 예약 시 정보보낼거 출발지, 목적지, 시간, 차량종류, 현재짐, 최대짐 --%>
            		<%-- 보여주기 용이고 실제 업데이트 사용하는건 예약id로 조회해서 (인원수추가, 짐추가, 유저id추가) --%>
            		<%--
            		<input type="hidden" name="id" value="<%= rs.getString("id") %>">
            		<input type="hidden" name="id" value="<%= rs.getString("id") %>">
            		<input type="hidden" name="name" value="<%= rs.getString("name") %>">
            		<input type="hidden" name="dept" value="<%= rs.getString("dept") %>">
            		<input type="hidden" name="id" value="<%= rs.getString("id") %>">
            		<input type="hidden" name="name" value="<%= rs.getString("name") %>">
            		<input type="hidden" name="dept" value="<%= rs.getString("dept") %>">
            		 --%>
            		
            		
        			<button type="submit" class="btn btn-info"
        			<%= //인원수가 현재==최대 이면 예약못하게
        			"컴퓨터공학".equals(rs.getString("dept")) ? "disabled" : "" %>>예약하기</button>	
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