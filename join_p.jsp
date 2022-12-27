<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "insert into tbl_vaccresv_202108 values(?, ?, ?, ?, ?, ?)";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	request.setCharacterEncoding("UTF-8");
	
	pstmt.setInt(1, Integer.parseInt(request.getParameter("resvno")));
	pstmt.setString(2, request.getParameter("jumin"));
	pstmt.setString(3, request.getParameter("hospcode"));
	pstmt.setString(4, request.getParameter("resvdate"));
	pstmt.setInt(5, Integer.parseInt(request.getParameter("resvtime")));
	pstmt.setString(6, request.getParameter("vcode"));
	
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="index.jsp"/>
</body>
</html>