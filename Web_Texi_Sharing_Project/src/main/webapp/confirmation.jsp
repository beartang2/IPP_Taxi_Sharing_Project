<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 확인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
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
    
    <h1>📄 예약 확인</h1>

    <div class="info-box">
        <p><strong>이름:</strong> ${param.name}</p>
        <p><strong>전화번호:</strong> ${param.phone}</p>
        <p><strong>출발지:</strong> ${param.pickup_location}</p>
        <p><strong>목적지:</strong> ${param.destination}</p>
        <p><strong>출발 시간:</strong> ${param.pickup_time}</p>
    </div>

    <button class="back-button" onclick="history.back();">🔙 돌아가기</button>

</body>
</html>