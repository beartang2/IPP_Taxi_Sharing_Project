<%@ page contentType="text/html; charset=utf-8"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/
css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>로그인</title>
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

	<div class="container py-4">
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
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
					<input type="submit" class="btn btn-primary" value="로그인">
				</div>
			</div>
		</form>	
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>