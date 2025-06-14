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
<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="utf-8">
<title>예약 최종 확인</title>
<script type = "text/javascript">

	//짐 공간 확인하는 유효성 검사
	function updateToRs(){
	    var form = document.updateRs;
	    
	    // 현재 짐 == 최대 짐 && 짐 유무 == "True" 조건 검사
	    if(form.currentLuggage.value == form.maxLuggage.value && form.hasLuggage.value == "True") {
	        alert("짐 공간이 부족합니다!");
	    } else {
	        if(confirm("최종 예약하시겠습니까?")){
	            document.updateRs.submit();
	        }
	    }
	}
</script>
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

<div class="banner">
<div class="container py-4">
	<h1 class = "display-5 fw-bold" style="margin-bottom: 50px;">예약 최종 확인</h1>

	
	<div class = "row align-items-md-stretch">
		<% //파라매터들 가져와서 변수로 저장 (보여주기용이니까 타입변환은 굳이)
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
		
		<%-- 짐 유무 선택 후 예약하는 기능 --%>
		<form name="updateRs" action="updateRs.jsp" method = "post">
			<div class ="mb-3 row">
				<label class ="col-sm-2">짐 유무</label>
				<div class ="col-sm-5">
					<input type = "radio" name= "hasLuggage" value = "True"> Yes
					<input type = "radio" name= "hasLuggage" value = "False" checked> No
				</div>
			</div>
			
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
	            		<button type="button" class="cta-button" onclick ="updateToRs()">예약하기</button>
				</div>
			</div>
		</form>
	</div>
</div>
</div>
	<jsp:include page="./footer.jsp"/>
</body>
</html>