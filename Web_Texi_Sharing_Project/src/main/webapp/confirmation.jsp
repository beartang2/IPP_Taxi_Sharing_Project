<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 확인</title>
    <style>
        body {
			font-family: Arial, sans-serif;
	       	margin: 0;
	       	padding: 0;
	       	background: #faf1a7;
	       	height: auto;
	   	}
		div {
	   		min-height: 100%;
			position: relative;
		}
	       
	    /* 네비게이션 바 */
	    nav {
	        background-color: #ffffff;
	        padding: 15px 30px;
	        display: flex;
	        justify-content: space-between;
	        align-items: center;
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
	    /* 아래 꾸미기 */
	    .banner {
	        margin-top: 50px;
	        height: auto;
	        color: black;
	        text-align: center;
	        padding-top: 100px;
	    }
	
	    .banner h1 {
	        font-size: 50px;
	    }
	
	    .banner p {
	        font-size: 25px;
	    }
        .info-box {
            width: 400px;
            padding: 15px;
            margin: 10px auto;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #f8f9fa;
        }
        .back-button {
            padding: 12px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }
        .back-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<!-- 로그인이 필요합니다 알림창 띄우기 -->
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("welcome.jsp?msg=not_logged_in");
        return;
    }
%>
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
    
	<div class="banner">
	    <h1>📄 예약 확인</h1>
	    <div class="info-box">
	        <p><strong>이름:</strong> <%= session.getAttribute("userName")%></p>
	        <p><strong>전화번호:</strong> <%= session.getAttribute("phone")%></p>
	        <p><strong>출발지:</strong><%= session.getAttribute("departure")%></p>
	        <p><strong>목적지:</strong> <%= session.getAttribute("destination")%></p>
	        <p><strong>출발 시간:</strong> <%= session.getAttribute("hour")%>:00</p>
	        <!-- 단톡에 세션 key 이름을 동일해야해서 정보를 저장하고 출력할 Key 이름을 s_~~~ 이런 이름으로 하기로 했던 것 같았는데 혹시 몰라서   
         	processLogin.jsp 그리고 updateRs.jsp 찾아가서 확인했을때 원래 사용했던 이름이여서 우선 동일한 Key 이름으로 맞췄습니답 -->
	        <p><strong>인당 금액:</strong> <%= session.getAttribute("perPerson")%></p>
	    </div>
	    
    	<button class="back-button" onclick="history.back();">돌아가기</button>
	</div>


</body>
</html>