<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	html, body {
		font-family: Arial, sans-serif;
       	margin: auto;
       	padding: auto;
       	background: #faf1a7;
   	}
	div {
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
        margin-top: 20px;
        height: auto;
        color: black;
        padding: 80px;
        background: #faf1a7;
    }
    .cta-button {
        background-color: #fbb512;
        color: black;
        padding: 5px 15px;
        border-radius: 15px;
        font-size: 16px;
        text-decoration: none;
    }
    .cta-button:hover {
        cursor: pointer;
        background-color: #de9c02;
        transform: scale(1.05);
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/
css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>로그인</title>
</head>
<!-- 로그인이 되어있습니다 알림창 띄우기 -->
<%
    if (session.getAttribute("userId") != null) {
        response.sendRedirect("welcome_redirection.jsp?msg=already_logged_in");
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
	<div class="container py-4">
		
		<div>
			<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">로그인</h1>
			<p class="col-md-8 fs-4">Login</p>
		</div>
	</div>
	
	<div class="row align-items-md-stretch">
		<form name="login" action="./processLogin.jsp" method="post">
			<div class="mb-3 row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="userId" name="userId" class="form-control">
				</div>
			</div>	
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="password" name="password" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="cta-button" value="로그인">
				</div>
			</div>
		</form>	
		</div>
	</div>
</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>