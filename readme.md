<br>

백신 예약 프로그램
=

<br>

![image](https://user-images.githubusercontent.com/104752202/201843405-84f42f2d-c130-4271-a49f-05cbb1d81a9d.png)

### header, nav, section, footer로 화면을 구성하였습니다.

<br><br><br>

![image](https://user-images.githubusercontent.com/104752202/201843465-9f168484-97fd-4764-9daa-1ce3dd3cc1f1.png)

<br>

```javascript
String sql =" select max(RESVNO) from TBL_VACCRESV_202108 " ;

Connection conn = DBConnect.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

rs.next();
int num = rs.getInt(1)+1;
```

### 테이블에 있는 마지막 예약번호에 +1 한 값을 num에 넣어줍니다.

<br><br><br>

```html
<tr>
  <th>예약번호</th>
  <td><input type="text" name="RESVNO" readonly="readonly" value="<%=num%>"> 예)20210011</td>
</tr>
```
### readonly를 사용하여 읽기전용으로 바꾸고   
### value에는 위 스크립트문에 있는 num값을 가져와서 자동발생을 시켜줍니다.

<br><br><br>

![image](https://user-images.githubusercontent.com/104752202/201843540-f581f8ef-6d04-4dd9-9f7b-29a2e77a345f.png)

<br>

```javascript
String sql = "insert into TBL_VACCRESV_202108 values(?,?,?,?,?,?)";

Connection conn = DBConnect.getConnection();
PreparedStatement ps = conn.prepareStatement(sql);

request.setCharacterEncoding("UTF-8");

ps.setString(1, request.getParameter("RESVNO"));
ps.setString(2, request.getParameter("JUMIN"));
ps.setString(3, request.getParameter("HOSPCODE"));
ps.setString(4, request.getParameter("RESVDATE"));
ps.setString(5, request.getParameter("RESVTIME"));
ps.setString(6, request.getParameter("VCODE"));

ps.executeUpdate();
```

### 입력받은 값을 데이터에 맞게 테이블에 저장시켜줍니다.

<br><br><br>

![image](https://user-images.githubusercontent.com/104752202/201843629-c8d0aab8-5ee1-46e8-ba23-75aa8a400778.png)

### 입력된 데이터를 볼 수 있는 리스트입니다.

<br><br><br>

![image](https://user-images.githubusercontent.com/104752202/201843713-d0d0475f-ff61-47b7-98f9-a455c091e788.png)

### 예약번호를 입력하는 페이지입니다.

<br><br><br>

![image](https://user-images.githubusercontent.com/104752202/201843784-fb4f4f49-20fe-4c5b-ae58-c0dc91ff7537.png)

### 예약번호를 입력하고 조회버튼을 누룹니다.

<br><br><br>

![image](https://user-images.githubusercontent.com/104752202/201843858-ea53b62b-af50-4deb-81b4-4e2c173d50d2.png)

```javascript
int RESVNO = Integer.parseInt(request.getParameter("RESVNO"));

StringBuffer sb = new StringBuffer();

sb.append(" select v.RESVNO                                                                 ")
.append(" ,j.NAME                                                                       ")
.append(" ,case substr(v.JUMIN, 8, 1)                                                   ")
.append(" 	when '1' then '남'                                                          ")
.append(" 	when '2' then '여'                                                          ")
.append(" end as gender                                                                 ")
.append(" ,case v.HOSPCODE                                                              ")
.append(" 	when 'H001' then '가_병원'                                                    ")
.append(" 	when 'H002' then '나_병원'                                                    ")
.append(" 	when 'H003' then '다_병원'                                                    ")
.append(" 	when 'H004' then '라_병원'                                                    ")
.append(" end as HOSPCODE                                                               ")
.append(" ,to_char(v.RESVDATE,'yyyy\"년\"mm\"월\"dd\"일\"') as  RESVDATE                  ")
.append(" ,substr(to_char(v.RESVTIME, 'FM0000'),1,2)                                      ")
.append(" 	|| ':' || substr(to_char(v.RESVTIME, 'FM0000'),3,2) as RESVTIME               ")
.append(" ,case VCODE                                                                     ")
.append(" 	when 'V001' then 'A백신'                                                      ")
.append(" 	when 'V002' then 'B백신'                                                      ")
.append(" 	when 'V003' then 'C백신'                                                      ")
.append(" end as VCODE                                                                    ")
.append(" ,case h.HOSPADDR                                                                ")
.append(" 	when '10' then '서울'                                                         ")
.append(" 	when '20' then '대전'                                                         ")
.append(" 	when '30' then '대구'                                                         ")
.append(" 	when '40' then '광주'                                                         ")
.append(" end as HOSPADDR                                                                 ")
.append(" from TBL_VACCRESV_202108 v, TBL_JUMIN_202108 j, TBL_HOSP_202108 h               ")
.append(" where v.JUMIN = j.JUMIN and v.hospcode = h.hospcode                             ")
.append(" and v.RESVNO =").append(RESVNO);
```

### 입력받은 예약번호와 일치하는 테이블 정보를 쿼리문 조건에 맞게 조회해줍니다.

<br><br><br>

![image](https://user-images.githubusercontent.com/104752202/201843907-c023f82c-0e95-4adc-9f1b-f3105ebcc9d5.png)

```html
<p class="co">예약번호 <%=i_resvno%>님의 예약조회
<%if(rs.next()){ %>
<table class="table_line">
<tr>
<th>예약번호</th>
<th>성명</th>
<th>성별</th>
<th>병원이름</th>
<th>예약날짜</th>
<th>예약시간</th>
<th>백신코드</th>
<th>병원지역</th>
</tr>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
</tr>
</table>
<%}else{ %>
<p class="co">회원번호<%=i_resvno%>의 회원 정보가 없습니다</p>
<p class="co"><input type="button" value="돌아가기" onclick="location.href='search_reservation.jsp'"></p>
<%} %>
```

### 입력받은 예약번호와 일치하는 번호가 없으면 else문을 출력합니다.

<br><br><br>

![image](https://user-images.githubusercontent.com/104752202/201857302-0508be94-b5ff-4933-b6fe-286b95665a46.png)

```html
<table class="table_line align_center">
	<tr>
		<th>병원지역</th>
		<th>병원지역명</th>
		<th>접종예약건수</th>
	</tr>
	<%
		while(rs.next()){ 
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
	</tr>
		<%
	sum += Integer.parseInt(rs.getString(3));
		} %>
	<tr>
		<td colspan="2">총합</td>
		<td><%=sum %></td>
	</tr>
</table>
```

### while문에 쿼리문을 조건으로 rs.getString을 반복해줍니다.
### 반복할 때 마다 sum에 rs.getString값들을 넣어주고 총합을 표시합니다.

<br><br><br>

- - -
