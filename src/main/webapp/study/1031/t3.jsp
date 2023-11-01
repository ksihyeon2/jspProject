<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t3.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
  <style>
  	.cont {	
  		margin-bottom : 10px;
  	}
  </style>
</head>
<body>
	<p><br /></p>
	<div class="container">
		<h2>회 원 정 보</h2>
		<form name="myform" method="post" action="t3Ok5.jsp">
			<div class="cont">성명
				<input type="text" name="name" class="form-control mb-3" value="홍길동" autofocus />
			</div>
			<div class="cont">나이
				<input type="number" name="age" id="age" value="20" class="form-control mb-3" />
			</div>
			<div class="cont">성별 &nbsp;
				<input type="radio" name="gender" value="남자" checked/>남자 &nbsp;
				<input type="radio" name="gender" value="여자" />여자
			</div>
			<div class="cont">취미 &nbsp;
				<input type="checkbox" name="hobby" value="등산" checked/>등산 &nbsp;
				<input type="checkbox" name="hobby" value="낚시" />낚시 &nbsp;
				<input type="checkbox" name="hobby" value="수영" />수영 &nbsp; 
				<input type="checkbox" name="hobby" value="바둑" />바둑 &nbsp;
				<input type="checkbox" name="hobby" value="싸이클" />싸이클 &nbsp;
				<input type="checkbox" name="hobby" value="배드민턴" />배드민턴 
			</div>
			<div class="cont">직업 &nbsp;
				<select name="job" class="form-control mb-3">
					<option value="">선택</option>
					<option selected>학생</option>
					<option>회사원</option>
					<option>군인</option>
					<option>공무원</option>
					<option>웹프로그래머</option>
					<option>기타</option>
				</select>
			</div>
			<div class="cont">
				주소 : <input type="text" name="address" value="청주" class="form-control" />
			</div>
			<div>
				<input type="submit" value="전송(button)" class="btn-primary form-control" />
			</div>		
		</form>
	</div>
	<p><br /></p>
</body>
</html>