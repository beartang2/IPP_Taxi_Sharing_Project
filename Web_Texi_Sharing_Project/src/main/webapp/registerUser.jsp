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
<title>회원 가입</title>
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
			<h1 class="display-5 fw-bold">회원 가입</h1>
			<p class="col-md-8 fs-4">User Register</p>
		</div>
	</div>
	
	<div class="row align-items-md-stretch">
		<form name="newUser" action="./processAddRegister.jsp" method="post" onsubmit="return false;">
			<div class="mb-3 row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="userId" name="userId" class="form-control">
					<small class="hint">영문자와 숫자 조합으로 4~10 입력</small>				<!-- 유효성 검사를 위한 힌트 -->
				</div>
			</div>	
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="password" name="password" class="form-control">
					<small class="hint">8~20자, 대소문자+숫자+특수문자 포함</small>			<!-- 유효성 검사를 위한 힌트 -->
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
					<small class="hint">한글 2~20자</small>								<!-- 유효성 검사를 위한 힌트 -->
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-3">
					<input type="radio" name="sex" value="남"> 남자		<!-- radio옵션 사용 -->
					<input type="radio" name="sex" value="여"> 여자
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-1">
					<select name="phone1" class="form-select">	<!-- select option 사용 -->
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
				<div class="col-sm-1">
					<input type="text" name="phone2" class="form-control" maxlength="4" placeholder="1234">
				</div>
				<div class="col-sm-1">
					<input type="text" name="phone3" class="form-control" maxlength="4" placeholder="5678">
				</div>
			</div>
			<div class="mb-3 row">
	<label class="col-sm-2">생년월일</label>
	<div class="col-sm-1">
		<select name="birthYear" class="form-select" id="birthYear">
			<%
				for (int y = 1980; y <= 2025; y++) {
			%>
				<option value="<%=y%>"><%=y%></option>
			<%
				}
			%>
		</select>
	</div>
	<div class="col-sm-1">
		<select name="birthMonth" class="form-select" id="birthMonth">	<!-- form태그 안에 select 옵션 사용 -->
			<%
				for (int m = 1; m <= 12; m++) {
			%>
				<option value="<%=m%>"><%=m%></option>
			<%
				}
			%>
		</select>
	</div>
	<div class="col-sm-1">
		<select name="birthDay" class="form-select" id="birthDay">
			<%
				for (int d = 1; d <= 31; d++) {
			%>
				<option value="<%=d%>"><%=d%></option>
			<%
				}
			%>
		</select>
	</div>
</div>
			<div class="mb-3 row">
				<label class="col-sm-2">나이</label>
				<div class="col-sm-3">
					<input type="text" id="age" name="age" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" onClick="CheckAddUser()">
				</div>
			</div>
		</form>	
		</div>
		<jsp:include page="./footer.jsp"/>
	</div>
</body>
</html>