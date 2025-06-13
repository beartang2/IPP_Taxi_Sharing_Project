<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>택시 예약하기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .input-box {
            width: 300px;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .submit-button, .back-button {
            padding: 12px 20px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            margin-top: 10px;
        }
        .submit-button {
            background-color: #4CAF50;
        }
        .submit-button:hover {
            background-color: #45a049;
        }
        .back-button {
            background-color: #3498db;
        }
        .back-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
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

</body>
</html>