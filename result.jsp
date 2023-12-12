<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<%
		String id = request.getParameter("id");
		String name = "";
		String User = "조회자 : 나 비번 : 배정받은 비번 , 조회일 : 오늘날짜";
		String department = "";
		String grade = "";
		
		if("0001".equals(id)){
			name="홍길동";
			department="AI응용소프트웨어과";
			grade="1";
		}
		else if("0002".equals(id)){
			name="고길동";
			department="IOT응용소프트웨어과";
			grade="2";
		}
		else{
			%>
			<script>
			location.href="index.html";
			alert('조회된 결과가 없습니다.');
			</script>
			<%
		}
		
		
	%>

	<style>
		h1{
			text-align:center;
		}
		table{
			margin:Auto;
		}
		div{
			text-align:center;
		}
	</style>

<body>
	<h1>학생 조회</h1>
		<table border="1">
			<tr>
				<td colspan="2" style="text-align:center;">학생 조회 결과</td>
			</tr>
			<tr>
				<td>학번</td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>학과명</td>
				<td><%=department %></td>
			</tr>
			<tr>
				<td>학년</td>
				<td><%=grade %></td>
			</tr>
		</table>
		<br>
		<div><%=User %></div>
</body>
</html>