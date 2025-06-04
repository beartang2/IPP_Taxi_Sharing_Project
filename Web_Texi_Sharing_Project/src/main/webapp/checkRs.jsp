<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>예약 최종 확인</title>
<script type = "text/javascript">

	//짐 공간 확인하는 유효성 검사
	function deleteToRs(){
		if(confirm("정말 취소하시겠습니까?")){
			document.deleteRs.submit();
		}
	}
	
</script>
</head>
<body>
<div class="container py-4">
	<header class="pb-3 mb-4 border-bottom">
		<a href="./welcome.jsp" class="d-flex align-items-center text-dark
		text-decoration-none">
			<svg width="32" height="32" fill="currentColor" class="bi bi-house
			-fill" viewBox="0 0 16 16">
			<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8
			2.207l6 .646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
			<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 213 .5V9.29316-6Z"/>
			</svg>
			<span class="fs-4">Home</span>
		</a>
	</header>
	
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class = "display-5 fw-bold">예약 최종 확인</h1>
		</div>
	</div>
	
	
	
	<div class = "row align-items-md-stretch">
		<% //파라매터들 가져와서 변수로 저장 (보여주기용이니까 타입변환은 굳이)
			String checkLuggage= request.getParameter("checkLuggage");
			String resId = request.getParameter("resId");
			String departure = request.getParameter("departure");
			String destination = request.getParameter("destination");
			String hour = request.getParameter("hour");
			String carType = request.getParameter("carType");
			String currentPeople = request.getParameter("currentPeople");
			String maxPeople = request.getParameter("maxPeople");
			String currentLuggage = request.getParameter("currentLuggage");
			String maxLuggage = request.getParameter("maxLuggage");
			String fare = request.getParameter("fare");
			String allId = request.getParameter("ids");
		%>
		<%-- 예약정보들 출력 --%>
		<div class="mb-3 row">
		    <label class="col-sm-2">출발지</label>
		    <div class="col-sm-3">
		        <p><%= departure %></p>
		    </div>
		</div>
		
		<div class="mb-3 row">
		    <label class="col-sm-2">도착지</label>
		    <div class="col-sm-3">
		        <p><%= destination %></p>
		    </div>
		</div>
		
		<div class="mb-3 row">
		    <label class="col-sm-2">시간</label>
		    <div class="col-sm-3">
		        <p><%= hour %></p>
		    </div>
		</div>
		
		<div class="mb-3 row">
		    <label class="col-sm-2">차종</label>
		    <div class="col-sm-3">
		        <p><%= carType %></p>
		    </div>
		</div>
		
		<div class="mb-3 row">
		    <label class="col-sm-2">현재 인원</label>
		    <div class="col-sm-3">
		        <p><%= currentPeople %></p>
		    </div>
		</div>
		
		<div class="mb-3 row">
		    <label class="col-sm-2">최대 인원</label>
		    <div class="col-sm-3">
		        <p><%= maxPeople %></p>
		    </div>
		</div>
		
		<div class="mb-3 row">
		    <label class="col-sm-2">사용 짐용량</label>
		    <div class="col-sm-3">
		        <p><%= currentLuggage %></p>
		    </div>
		</div>
		
		<div class="mb-3 row">
		    <label class="col-sm-2">최대 짐용량</label>
		    <div class="col-sm-3">
		        <p><%= maxLuggage %></p>
		    </div>
		</div>
		
		<div class="mb-3 row">
		    <label class="col-sm-2">요금</label>
		    <div class="col-sm-3">
		        <p><%= fare %></p>
		    </div>
		</div>
		
		
		<div class ="mb-3 row">
			<label class ="col-sm-2">짐 유무</label>
			<div class ="col-sm-5">
				 <input type="radio" name="condition" value="True" <%= "True".equals(checkLuggage) ? "checked" : "" %> disabled> Yes
        <input type="radio" name="condition" value="False" <%= "False".equals(checkLuggage) ? "checked" : "" %> disabled> No
			</div>
		</div>
		<%-- 예약취소하는 버튼 --%>
		<form name="deleteRs" action="deleteRs.jsp" method = "post">
			<div class ="mb-3 row">
				<div class ="col-sm-offset-2 col-sm-10">
	            		<input type="hidden" name="resId" value="<%=resId%>">
						<input type="hidden" name="departure" value="<%=departure%>">
						<input type="hidden" name="destination" value="<%=destination%>">
						<input type="hidden" name="hour" value="<%=hour%>">
						<input type="hidden" name="carType" value="<%=carType%>">
						<input type="hidden" name="currentPeople" value="<%=currentPeople%>">
						<input type="hidden" name="maxPeople" value="<%=maxPeople%>">
						<input type="hidden" name="currentLuggage" value="<%=currentLuggage%>">
						<input type="hidden" name="maxLuggage" value="<%=maxLuggage%>">
						<input type="hidden" name="fare" value="<%=fare%>">
	            		<button type="button" class="btn btn-info" onclick ="deleteToRs()">예약 취소하기</button>
				</div>
			</div>
		</form>
	</div>
	<footer class = "pt-3 mt-4 text-body-secondatry border-top">
	 &copy; Texi_Sharing
</footer>
</div>
</body>
</html>