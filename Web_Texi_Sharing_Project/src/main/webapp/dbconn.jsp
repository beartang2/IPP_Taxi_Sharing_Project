<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%
	Connection conn=null;
	
	try{
		String url="jdbc:mysql://localhost:3306/taxi_sharing";
		String user="root";
		String password="1234";
	
		Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버 인터페이스를 구현하는 작업
		conn=DriverManager.getConnection(url, user, password);
		//JDBC드라이버에서 DB와 연결된 커넥션을 가져오기 위해 DriverManager 클래스의 getConnetion() 메소드 이용.
		
	} catch (SQLException ex){
		out.println("데이터베이스 연결이 실패되었습니다.<br>"); //웹 브라우저에 데이터를 전송하는 출력스트림 객체 사용(out)
		out.println("SQLException: " + ex.getMessage());
	}
%>
