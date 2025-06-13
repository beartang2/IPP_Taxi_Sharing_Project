<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
/* 네비게이션 바 */
	nav {
	    background-color: #ffffff;
	    padding: 15px 30px;
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    position: fixed;
	    width: 100%;
	    top: 0;
	    z-index: 999;
	    box-sizing: border-box;
	}
	
	nav .Main {
	    font-size: 25px;
	    font-weight: bold;
	    color: #fbb512;
	}
	
	nav .menu a {
	    background-color : #ffffff;
	    margin-right: 20px;
	    text-decoration: none;
	    color: black;
	    white-space: nowrap; /*줄바꿈 금지 */
	}
	nav .menu a:hover {
	    background-color: #e8e8e7;
	    transform: scale(1.05);
	}
</style>
<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>쉐어 택시 찾기</title>

<script type ="text/javascript">
	function checkDD(){
	    var form = document.checkDd;
	    
	    // 출발지 == 목적지 일경우 경고문 전달
	    if(form.searchDeparture.value == form.searchDestination.value) {
	        alert("출발지와 목적지를 다르게 지정 해주세요!");
	    } else {
	    	form.submit();
	    }
	}
</script>

</head>
<%-- <%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("welcome.jsp?msg=not_logged_in");
        return;
    }
%> --%>
<body>
	<nav>
        <div class="Main">🚕 택시쉐어링</div>
        <div class="menu">
            <a href="./welcome_redirection.jsp">홈</a>
            <a href="./menu.jsp">쉐어 택시 찾기</a>	<!-- 예약 페이지로 -->
            <a href="./pamphlet.jsp">이용 방법</a>
            <a href="./confirmation.jsp">마이페이지</a>	<!-- 예약 확인 페이지로 -->
            <a href="./loginUser.jsp">로그인</a>		<!-- 로그인 페이지로 -->
        </div>
    </nav>

<div class="container py-4">
	<header class="pb-3 mb-4 border-bottom">
	<a href="./welcome.jsp" class="d-flex align-items-center text-darktext-decoration-none">
	<span class="fs-4">🚖 홈</span>
	</a>
	</header>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">예약 목록</h1>
        </div>
    </div>
    
    <div><%-- 드롭박스부분 --%> 
    	<%
	    	//dropBox로 정한 값들 변수로 저장
	        String searchDeparture = request.getParameter("searchDeparture");
	        String searchDestination = request.getParameter("searchDestination");
	        String searchTime = request.getParameter("searchTime");
    	%>
    
    	<form name="checkDd" method="get">
    		<label for="searchDeparture">출발지:</label>
	    	<select name="searchDeparture" id="searchDeparture">
	    	<%-- 선택후 조회시 사이트를 새로 조회하기 때문에 기본값으로 바뀌어 헷갈리는 문제발생
	    	     이 문제를 해결하기위해 앞서 정한값을 select로 선택되도록 설정 --%>
	    		<option value="배재대학교" <%= "배재대학교".equals(searchDeparture) ? "selected" : "" %>>배재대학교</option>
			    <option value="대전역" <%= "대전역".equals(searchDeparture) ? "selected" : "" %>>대전역</option>
			    <option value="서대전역" <%= "서대전역".equals(searchDeparture) ? "selected" : "" %>>서대전역</option>
			    <option value="대전복합터미널" <%= "대전복합터미널".equals(searchDeparture) ? "selected" : "" %>>대전복합터미널</option>
		    </select>
		
		    <label for="searchDestination">목적지:</label>
		    <select name="searchDestination" id="searchDestination">
			    <option value="대전역" <%= "대전역".equals(searchDestination) ? "selected" : "" %>>대전역</option>
			    <option value="배재대" <%= "배재대".equals(searchDestination) ? "selected" : "" %>>배재대</option>
			    <option value="서대전역" <%= "서대전역".equals(searchDestination) ? "selected" : "" %>>서대전역</option>
			    <option value="대전복합터미널" <%= "대전복합터미널".equals(searchDeparture) ? "selected" : "" %>>대전복합터미널</option>
		    </select>
		    
			<%-- DB구성 확인하고 value값 수정 --%>
		    <label for="searchTime">시간:</label>
		    <select name="searchTime" id="searchTime">
		        <option value="1" <%= "1".equals(searchTime) ? "selected" : "" %>>01:00</option>
			<option value="2" <%= "2".equals(searchTime) ? "selected" : "" %>>02:00</option>
			<option value="3" <%= "3".equals(searchTime) ? "selected" : "" %>>03:00</option>
			<option value="4" <%= "4".equals(searchTime) ? "selected" : "" %>>04:00</option>
			<option value="5" <%= "5".equals(searchTime) ? "selected" : "" %>>05:00</option>
			<option value="6" <%= "6".equals(searchTime) ? "selected" : "" %>>06:00</option>
			<option value="7" <%= "7".equals(searchTime) ? "selected" : "" %>>07:00</option>
		        <option value="8" <%= "8".equals(searchTime) ? "selected" : "" %>>08:00</option>
			<option value="9" <%= "9".equals(searchTime) ? "selected" : "" %>>09:00</option>
			<option value="10" <%= "10".equals(searchTime) ? "selected" : "" %>>10:00</option>
			<option value="11" <%= "11".equals(searchTime) ? "selected" : "" %>>11:00</option>
			<option value="12" <%= "12".equals(searchTime) ? "selected" : "" %>>12:00</option>
			<option value="13" <%= "13".equals(searchTime) ? "selected" : "" %>>13:00</option>
			<option value="14" <%= "14".equals(searchTime) ? "selected" : "" %>>14:00</option>
			<option value="15" <%= "15".equals(searchTime) ? "selected" : "" %>>15:00</option>
			<option value="16" <%= "16".equals(searchTime) ? "selected" : "" %>>16:00</option>
			<option value="17" <%= "17".equals(searchTime) ? "selected" : "" %>>17:00</option>
			<option value="18" <%= "18".equals(searchTime) ? "selected" : "" %>>18:00</option>
			<option value="19" <%= "19".equals(searchTime) ? "selected" : "" %>>19:00</option>
			<option value="20" <%= "20".equals(searchTime) ? "selected" : "" %>>20:00</option>
			<option value="21" <%= "21".equals(searchTime) ? "selected" : "" %>>21:00</option>
			<option value="22" <%= "19".equals(searchTime) ? "selected" : "" %>>22:00</option>
			<option value="23" <%= "20".equals(searchTime) ? "selected" : "" %>>23:00</option>
			<option value="24" <%= "21".equals(searchTime) ? "selected" : "" %>>24:00</option>			
		    </select>
		    
			<%-- 조회 클릭시 DB가져오는거 출발지 목적지 시간 비교하고 가져오게 수정 --%>
		    <button type="button" class="btn btn-primary" onclick = "checkDD()">조회</button>
	   	</form>
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
            	
                Class.forName("com.mysql.cj.jdbc.Driver"); // DB 드라이버
                //연결할 DB (url, id, pw)
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tables_in_taxi_sharing", "root", "0000");
                //조건을 포함한 쿼리문 작성
                String sql = "SELECT * FROM reservations WHERE departure = ? AND destination = ? AND hour >= ?";
            	pstmt = conn.prepareStatement(sql);
            	pstmt.setString(1, searchDeparture);
            	pstmt.setString(2, searchDestination);
            	pstmt.setInt(3, Integer.parseInt(searchTime));
            	
                rs = pstmt.executeQuery();

                //쿼리문으로 받아온 테이블 출력용 반복문
                while (rs.next()) {
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
        		<form name = "update" action="addRs.jsp" method = "post">
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
            		
        			<button type="submit" class="btn btn-info"
        			<%= //인원수가 현재==최대 이면 예약못하게
        			(rs.getInt("currentPeople") == rs.getInt("maxPeople")) ? "disabled" : "" %>>예약하기</button>	
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
	
	<jsp:include page="./footer.jsp"/>
</div>
</body>
</html>
