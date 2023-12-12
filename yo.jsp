<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

	<style>
		h1{
			text-align:center;
		}
		div{
			text-align:center;
		}
		table{
			width:100%;
			margin:Auto;
		}
	</style>

<body>
<h1>전체 거래내역 조회</h1>
<hr>
	<table border="1">
		<tr>
			<td>거래코드</td>
			<td>거래일자</td>
			<td>제품명</td>
			<td>거래처명</td>
			<td>구분</td>
			<td>총금액</td>
		</tr>

	<% /* 자바 DB 연동 프로그램 */
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT T.TCODE 거래코드, TO_CHAR(T.TDATE,'YYYY-MM-DD DY') 거래일자, P.NAME 제품명, C.NAME 거래처명, DECODE(T.CATEGORY, '1','입고','출고') 구분, TO_CHAR(SUM(P.PRICE * T.AMOUNT),'L999,999,999') 총금액 FROM PRODUCT_TBL P, TRANSACTION_TBL T, CUSTOMER_TBL C WHERE P.PCODE = T.PCODE AND T.CCODE = C.CCODE GROUP BY T.TCODE, TO_CHAR(T.TDATE,'YYYY-MM-DD DY'), P.NAME, C.NAME, DECODE(T.CATEGORY, '1','입고','출고') ORDER BY T.TCODE");
			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
				</tr>
				<%
			}
			stmt.close();
			con.close();
		
		stmt.close();
		con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	</table>
	<hr>
	<address>
		<div>서비스는 제품에서 이루어지는 것보다</div>
		<div>인간관계에서 이루어져야 합니다.</div>
		<div>-존 레시너</div>
	</address>
	<br>
	<div>Copyright ⓒ by Desigment All right Reserved</div>
</body>
</html>