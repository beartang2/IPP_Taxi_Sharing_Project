<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .input-box {
            width: 300px;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .login-button {
            padding: 12px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }
        .login-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h1>🔐 로그인</h1>

    <form action="index.jsp" method="post">
        <input type="text" name="username" placeholder="아이디" class="input-box" required><br>
        <input type="password" name="password" placeholder="비밀번호" class="input-box" required><br>
        <button type="submit" class="login-button">로그인</button>
    </form>

</body>
</html>