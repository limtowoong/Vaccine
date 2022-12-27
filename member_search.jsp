<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
<script type="text/javascript">
	function checkValue2() {
		if(!document.data1.resvno.value) {
			data1.resvno.focuse()
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
	<h2>백신예약조회</h2>
<form name="data1" action="member_search_list.jsp" method="post" onsubmit="return checkValue2()">
	<table class="table_line">
		<tr>
			<th>예약번호</th>
			<td><input type="text" name="resvno">
		</tr>
		<tr class="center">
			<td colspan="2">
				<input type="submit" value="조회하기">
				<input type="button" value="홈으로" onclick="location.href='index.jsp'">
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>