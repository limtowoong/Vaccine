<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "select max(resvno) from tbl_vaccresv_202108";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	int num = rs.getInt(1)+1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
<script type="text/javascript">
	function checkValue() {
		if(!document.data.resvno.value) {
			data.resvno.focus();
			return false;
		} else if(!document.data.jumin.value) {
			data.jumin.focus();
			return false;
		} else if(!document.data.vcode.value) {
			data.vcode.focus();
			return false;
		} else if(!document.data.hospcode.value) {
			data.hospcode.focus();
			return false;
		} else if(!document.data.resvdate.value) {
			data.resvdate.focus();
			return false;
		} else if(!document.data.resvtime.value) {
			data.resvtime.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/nav.jsp"/>
<section class="section">
	<h2>백신 예약</h2>
<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
	<table class="table_line">
		<tr>
			<th>예약번호</th>
			<td><input type="text" name="resvno" value="<%= num %>" readonly> 예)20210011</td>
		</tr>
		<tr>
			<th>주민번호</th>
			<td><input type="text" name="jumin"> 예)790101-1111111</td>
		</tr>
		<tr>
			<th>백신코드</th>
			<td>
				<select name="vcode">
				    <option value="V001">A백신</option>
				    <option value="V002">B백신</option>
				    <option value="V003">C백신</option>
				</select>
				예)V001, V002, V003
			</td>
		</tr>
		<tr>
			<th>병원코드</th>
			<td>
			<label><input type="radio" name="hospcode" value="H001"> 가_병원</label>
			<label><input type="radio" name="hospcode" value="H002"> 나_병원</label>
			<label><input type="radio" name="hospcode" value="H003"> 다_병원</label>
			<label><input type="radio" name="hospcode" value="H004"> 라_병원</label>
			예)H001, H002, H003, H004
			</td>
		</tr>
		<tr>
			<th>예약날짜</th>
			<td><input type="text" name="resvdate"> 예)20210101</td>
		</tr>
		<tr>
			<th>예약시간</th>
			<td><input type="text" name="resvtime"> 예)0930, 1130</td>
		</tr>
		<tr class="center">
			<td colspan="2">
				<input type="submit" value="등록">
				<input type="button" value="취소" onclick="location.href='join.jsp'">
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>