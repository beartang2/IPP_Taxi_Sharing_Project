<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 확인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .info-box {
            width: 400px;
            padding: 15px;
            margin: 10px auto;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #f8f9fa;
        }
        .back-button {
            padding: 12px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }
        .back-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <h1>📄 예약 확인</h1>

    <div class="info-box">
        <p><strong>이름:</strong> <%= session.getAttribute("userName") %></p>   
        <p><strong>전화번호:</strong> <%= session.getAttribute("phone") %> </p> 
        <p><strong>출발지:</strong> <%= session.getAttribute("departure") %> </p> 
        <p><strong>목적지:</strong><%= session.getAttribute("destination") %></p> 
        <p><strong>출발 시간:</strong> <%= session.getAttribute("hour") %> </p> 
        <!-- 단톡에 세션 key 이름을 동일해야해서 정보를 저장하고 출력할 Key 이름을 s_~~~ 이런 이름으로 하기로 했던 것 같았는데 혹시 몰라서   
         processLogin.jsp 그리고 updateRs.jsp 찾아가서 확인했을때 원래 사용했던 이름이여서 우선 동일한 Key 이름으로 맞췄습니답 -->
    </div>

    <button class="back-button" onclick="history.back();">🔙 돌아가기</button>

</body>
</html>