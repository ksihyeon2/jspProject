<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test4_init.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br /></p>
	<div class="container">
		<h2>이곳은 init(Servlet)2에서 보낸 값을 찍어보기</h2>
		<p>
			회사명 : ${sLogoName}<br />
			홈페이지 주소 : <a href="${sHomeAddress}">${sHomeAddress}</a>
		</p>
		<hr />
		<p><a href="${ctp}/j1102/Test4Ok" class="btn btn-primary">컨트롤러 다녀오기</a></p>
		<hr />
		<p><a href="${ctp}/j1102/SessionOut?sw=test4_init" class="">세션 끊기</a>
	</div>
	<p><br /></p>
</body>
</html>