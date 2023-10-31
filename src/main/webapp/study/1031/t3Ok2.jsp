<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="study.j1031.T3VO" />
<!-- jsp에서 Bean은 class를 의미 -->
<!-- vo를 생성하기 위해서는 id 영역에 vo의 변수명 class 영역에는 package명과 class명을 적음 -->
<!-- 
		서블릿에서는 getter()와 setter()을 이용해서 값을 불러오거나 저장한다.
		jsp에서는 getProperty와 setProperty을 이용해서 값을 불러오거나 저장한다.
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t3Ok2.jsp</title>
	<jsp:setProperty property="name" name="vo"/>
	<!-- name영역에는 위에 지정해둔 id를 적어줌 property영역에는 저장할 값의 name을 적어줌-->
	<jsp:setProperty property="age" name="vo" value="50"/>
	<!-- value는 저장할 값을 변경하여 저장할때 사용 -->
	<jsp:setProperty property="gender" name="vo"/>
	<jsp:setProperty property="hobby" name="vo"/>
	<jsp:setProperty property="job" name="vo"/>
	<jsp:setProperty property="address" name="vo"/>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br /></p>
	<div class="container text-center">
		<h2>처리된 자료를 View에 출력</h2>
		<table class="table table-bordered ">
			<tr>
				<th>성명</th>
				<td><jsp:getProperty property="name" name="vo"/>/${name}</td>
			</tr>
			<tr>
				<th>나이</th>
				<td><jsp:getProperty property="age" name="vo"/>/${age}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td><jsp:getProperty property="gender" name="vo"/>/${gender}</td>
			</tr>
			<tr>
				<th>취미</th>
				<td><jsp:getProperty property="hobby" name="vo"/>/${hobby}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><jsp:getProperty property="job" name="vo"/>/${job}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><jsp:getProperty property="address" name="vo"/>/${address}</td>
			</tr>
		</table>
		<p><a href="t3.jsp" class="btn btn-success">돌아가기</a></p>	
	</div>
	<p><br /></p>
</body>
</html>