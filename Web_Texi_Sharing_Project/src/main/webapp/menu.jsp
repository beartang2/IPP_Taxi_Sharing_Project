<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>택시 예약 시스템</title>
<style>
	body {
       	background: #faf1a7;
	    font-family: 'Arial', sans-serif;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    height: 100vh;
	    margin: 0;
	    align-items: center;
	}
	div {
   		min-height: 100%;
		position: relative;	
	}
	h1 {
	    font-size: 2.5rem;
	    margin-bottom: 40px;
	    color: #333;
	}
	.menu-button {
	    width: 250px;
	    padding: 20px;
	    margin: 15px;
	    font-size: 1.2rem;
	    border: none;
	    border-radius: 12px;
	    background-color: #4CAF50;
	    color: white;
	    transition: 0.3s ease;
	    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
	    cursor: pointer;
	}
	.menu-button:hover {
	    background-color: #45a049;
	    box-shadow: 0 8px 16px rgba(0,0,0,0.15);
	}
	.logout-button {
	    background-color: #e74c3c;
	}
	.logout-button:hover {
	    background-color: #c0392b;
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
    

    <h1>택시 예약 시스템</h1>

    <form action="./RsTest.jsp">
        <button class="menu-button" type="submit">🚕 예약하기</button>
    </form>

    <form action="./confirmation.jsp">
        <button class="menu-button" type="submit">📄 예약 확인</button>
    </form>

    <form action="./welcome.jsp">
        <button class="menu-button logout-button" type="submit">❗ 종료</button>
    </form>

	<jsp:include page="./footer.jsp"/>
</body>
</html>