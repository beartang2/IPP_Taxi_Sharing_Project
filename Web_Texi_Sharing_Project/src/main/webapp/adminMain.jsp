<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<style>
	body {
		font-family: Arial, sans-serif;
       	margin: 70px 0px 0px 0px;
       	background: #faf1a7;
   	}
	div {
   		min-height: 100%;
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
</style>
<title>Admin Database SQL</title>
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
    <%@ include file="dbconn.jsp" %>
    <h2>user 테이블</h2>
    <table width="700" border="1">
        <tr>
            <th>uniqueId</th>
            <th>userId</th>
            <th>password</th>
            <th>name</th>
            <th>sex</th>
            <th>phone</th>
            <th>birth</th>
            <th>age</th>
        </tr>
        <%
            ResultSet rs = null;
            Statement stmt = null;
            try {
                String sql = "SELECT * FROM user";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                while(rs.next()) {
        %>
        <tr>
            <td><%=rs.getInt("uniqueId") %></td>
            <td><%=rs.getString("userId") %></td>
            <td><%=rs.getString("password") %></td>
            <td><%=rs.getString("name") %></td>
            <td><%=rs.getString("sex") %></td>
            <td><%=rs.getString("phone") %></td>
            <td><%=rs.getString("birth") %></td>
            <td><%=rs.getInt("age") %></td>
        </tr>
        <%
                }
                rs.close(); // 첫 쿼리 resultSet 종료!
        %>
    </table>

    <h2>reservation 테이블</h2>
    <table width="900" border="1">
        <tr>
            <th>resId</th>
            <th>departure</th>
            <th>destination</th>
            <th>hour</th>
            <th>carType</th>
            <th>currentPeople</th>
            <th>maxPeople</th>
            <th>currentLuggage</th>
            <th>maxLuggage</th>
            <th>fare</th>
        </tr>
        <%
                // reservation 테이블도 이어서 조회
                sql = "SELECT * FROM reservation";
                rs = stmt.executeQuery(sql);

                while(rs.next()) {
        %>
        <tr>
            <td><%=rs.getInt("resId") %></td>
            <td><%=rs.getString("departure") %></td>
            <td><%=rs.getString("destination") %></td>
            <td><%=rs.getInt("hour") %></td>
            <td><%=rs.getString("carType") %></td>
            <td><%=rs.getInt("currentPeople") %></td>
            <td><%=rs.getInt("maxPeople") %></td>
            <td><%=rs.getInt("currentLuggage") %></td>
            <td><%=rs.getInt("maxLuggage") %></td>
            <td><%=rs.getInt("fare") %></td>
        </tr>
        <%
                }
            } catch (SQLException ex) {
                out.println("테이블 호출 실패<br>");
                out.println("SQLException: " + ex.getMessage());
            } finally {
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            }
        %>
    </table>
</body>
</html>
