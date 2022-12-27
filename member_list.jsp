<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "select * from tbl_vaccresv_202108";
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/nav.jsp"/>
<section class="section">
	<table class="table_line">
	<tr>
		<th>예약번호</th>
		<th>주민번호</th>
		<th>백신코드</th>
		<th>병원코드</th>
		<th>예약날짜</th>
		<th>예약시간</th>
	</tr>
	<%
		while(rs.next()){ 
	%>
	<tr class="center">
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
	<%
		}
	%>
		</tr>
	</table>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>