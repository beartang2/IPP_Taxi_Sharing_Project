<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp"  %> <%--dbconn.jsp데이터 연동(DB연동) --%>
<%
	request.setCharacterEncoding("UTF-8"); //
	
	String userId=request.getParameter("userId");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	//전화번호 조합
	String phone = request.getParameter("phone1") + "-" + 
          		  request.getParameter("phone2") + "-" + 
          		  request.getParameter("phone3");
	// 생년월일 조합 (yyyy-mm-dd)
	String birth = request.getParameter("birthYear") + "-" + 
	               request.getParameter("birthMonth") + "-" + 
	               request.getParameter("birthDay");
	
	int age = Integer.parseInt(request.getParameter("age"));
	
	
	String sql="insert into user (userId, password, name, sex, phone, birth, age) values(?, ?, ?, ?, ?, ?, ?)";
	//DB에 보낼 쿼리문, 쿼리문에 정해지지 않은 값을 ?로 표시하고 값을 할당하기 위해 아래set()메소드를 사용.
	
	PreparedStatement pstmt=null;   //PreparedStatement 객체 사용.
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, sex);
	pstmt.setString(5, phone);
	pstmt.setString(6, birth);
	pstmt.setInt(7, age);
	
	pstmt.executeUpdate(); //executeUpdate()메소드는 삽입, 수정, 삭제할 때 사용됨.
	
	if(pstmt!=null) pstmt.close();
	if(conn !=null) conn.close(); //close()문을 적절히 사용하여 페이지가 다른 작업을 수행하는 동안 멈춤.
	
	response.sendRedirect("loginUser.jsp"); //데이터 삽입 작업이 끝난 후 로그인 화면으로 이동.
%>

