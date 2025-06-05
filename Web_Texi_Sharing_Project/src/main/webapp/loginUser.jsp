<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/
css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>로그인</title>
</head>
<body>
	<div class="container py-4">
		 <%@ include file="menu.jsp" %>
		
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