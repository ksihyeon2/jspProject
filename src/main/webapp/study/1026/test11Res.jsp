<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String job = request.getParameter("job");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test11Res.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script>
  	'use strict';
  	
  	if('<%= name %>' != '' && '<%= name %>' != 'no') {
  		alert('<%= name %>' +"님 회원가입 되셨습니다. \n\n회원 메인창으로 이동합니다.");
  	} else {
  		location.href='test11.jsp?flag=no';
  	}
  	
  	function logoutCheck() {
  		let ans = confirm('<%= name %>'+"님 로그아웃 하시겠습니까?");
  		if(ans) {
  			alert('<%= name %>'+"님 로그아웃 되셨습니다.");
  			location.href='test11.jsp';
	  		}
  	}
  </script>
</head>
<body>
	<p><br /></p>
	<div class="container">
		<h2>회원 메인창</h2>
		<p><%= name %>님 로그인 중이십니다.</p>
		
		<!-- 회원 가입 정보 띄우기 -->
		<p> 나이 : <%= age %>
		<p> 성별 : <%= gender %>
		<p> 취미 : <%= hobby %>
		<p> 직업 : <%= job %>
		
		<p>
			<input type="button" value="로그아웃(button)" onClick="logoutCheck()" class="btn btn-info mr-3" />
			<a href="javascript:logoutCheck()" class="btn btn-primary">로그아웃(a)</a>
		</p>
	</div>
	<p><br /></p>
</body>
</html>