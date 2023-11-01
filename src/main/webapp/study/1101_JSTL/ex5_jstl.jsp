<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl5.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br /></p>
	<div class="container text-center">
		<h2 >회원 자료 출력하기</h2>
		<form name="myform" method="post" action="${ctp}/j1101/Ex_jstl5Ok">
			<input type="submit" value="회원전체리스트" class="btn-info form-control mb-3" />
		</form>
	</div>
	<p><br /></p>
</body>
</html>