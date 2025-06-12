<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Admin Database SQL</title>
</head>
<body>
<%@ include file="menu.jsp" %>
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
