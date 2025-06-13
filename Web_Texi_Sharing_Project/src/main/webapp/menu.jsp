<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>택시 예약 시스템</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
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
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
        }
        .logout-button {
            background-color: #e74c3c;
        }
        .logout-button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

    <h1>택시 예약 시스템</h1>

    <form action="reservation.jsp">
        <button class="menu-button" type="submit">🚕 예약하기</button>
    </form>

    <form action="confirmation.jsp">
        <button class="menu-button" type="submit">📄 예약 확인</button>
    </form>

    <form action="login.jsp">
        <button class="menu-button logout-button" type="submit">🔑 로그아웃</button>
    </form>

</body>
</html>