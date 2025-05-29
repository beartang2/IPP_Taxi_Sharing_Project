<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>예약 최종 확인</title>
<script type = "text/javascript">
	function updateToRs(){
		//콘솔로 내용 출력
		const form = document.updateRs;
	    const id = form.id.value;
	    const name = form.name.value;
	    const condition = form.condition.value;
	    console.log("id:", id);
	    console.log("name:", name);
	    console.log("짐 유무:", condition);
	    
	    //현재 짐 == 최대 짐 && 짐 유무 == "True" 일경우로 수정
	    if(condition == "True") {
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
		<%
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String dept = request.getParameter("dept");
		
		%>
		<div class ="mb-3 row">
			<label class ="col-sm-2">출발지</label>
			<div class ="col-sm-3">
				<p><%= id %></p>
			</div>
		</div>
		
		<div class ="mb-3 row">
			<label class ="col-sm-2">목적지</label>
			<div class ="col-sm-3">
				<p><%= request.getParameter("name") %></p>
			</div>
		</div>
		
		<div class ="mb-3 row">
			<label class ="col-sm-2">시간</label>
			<div class ="col-sm-3">
				<p><%= request.getParameter("dept") %></p>
			</div>
		</div>
		<%-- 예약내용 보내기 --%>
		<form name="updateRs" action="updateRs.jsp" method = "post">
			<div class ="mb-3 row">
				<label class ="col-sm-2">짐 유무</label>
				<div class ="col-sm-5">
					<input type = "radio" name= "condition" value = "True"> Yes
					<input type = "radio" name= "condition" value = "False" checked> No
				</div>
			</div>
			
			<div class ="mb-3 row">
				<div class ="col-sm-offset-2 col-sm-10">
						<input type="hidden" name="id" value = "<%=id%>">
	            		<input type="hidden" name="name" value = "<%=name%>">
	            		<input type="hidden" name="dept" value = "<%=dept%>">
	            		<button type="button" class="btn btn-info" onclick ="updateToRs()">예약하기</button>
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