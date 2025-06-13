<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>택시 쉐어링 시스템</title>
	<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #faf1a7;
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
        /* 이용 방법 본문 내용 */
        .pamphlet {
        	margin-top: 70px;
            height: 80vh;
            color: black;
        	padding: 25px;
        	font-size: 25px;
        	text-align: center;
        }
        footer {
        	bottom: 0px;
			position: absolute;
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
	
	<div class="pamphlet">
		<h1>이용 방법</h1><br>
		<p>쉐어 택시 찾기를 누르고<br>
		출발지, 목적지, 출발 시간을 입력합니다.<br>
		예약 가능한 목록에서 원하는 차량의 종류와 조건에 맞는 항목을 선택하세요!</p>
	</div>	
	
</body>
	<footer>
	Copyright ©JSPBook
	</footer>
</html>