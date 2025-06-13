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
    
    /* 아래 꾸미기 */
    .banner {
        margin-top: 50px;
        height: auto;
        color: black;
        text-align: center;
        padding-top: 150px;
    }

    .banner h1 {
        font-size: 50px;
    }

    .banner p {
        font-size: 25px;
    }

    .cta-button {
        background-color: #fbb512;
        color: black;
        padding: 20px 35px;
        border-radius: 15px;
        font-size: 16px;
        text-decoration: none;
    }
    .cta-button:hover {
        cursor: pointer;
        background-color: #de9c02;
        transform: scale(1.05);
    }
    .lgo-button {
    	background-color: #ff5512;
        color: black;
        padding: 15px 25px;
        border-radius: 15px;
        font-size: 14px;
        text-decoration: none;
    }
    .lgo-button:hover{
    	cursor: pointer;
        background-color: #de9c02;
        transform: scale(1.05);
    }
    .dateInfo {
   	  	font-size: 16px;
   		padding-top: 50px;
   		color: slategray;
    }
</style>
</head>

<%
    if(session.getAttribute("userId") == null) {
        response.sendRedirect("welcome.jsp");
        return;
    }
%>

<%!
	int pageCnt = 0;
	void addCount()
	{
		pageCnt++;
	}
%>
<%
	addCount();
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
	
	<div class="dateInfo">
    	<p>현재 날짜와 시각은 <%=new java.util.Date() %> 입니다.<br>
        이 사이트 방문은 <%=pageCnt %>번째 입니다.</p>
    </div>
	
    <div class="banner">
        <h1>함께 공유하는 택시</h1>
        <p>비싼 비용 걱정? No! 함께 타요!</p>
        <h2>환영합니다, <%= session.getAttribute("userName") %>님!</h2><br>
        <a href="./menu.jsp" class="cta-button">쉐어링 시작하기</a><br><br><br><br>
		<a href="./logout.jsp" class="lgo-button">로그아웃</a>    <!-- 종료 후 시작 페이지로 -->
    </div>
	<jsp:include page="./footer.jsp"/>
</body>
</html>