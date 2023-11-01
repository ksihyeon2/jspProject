<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl5Res.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br /></p>
	<div class="container">
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>성명</th>
				<th>나이</th>
				<th>성별</th>
				<th>직업</th>
				<th>주소</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.name}</td>
					<td>${vo.age}</td>
					<td>${vo.gender}</td>
					<td>${vo.job}</td>
					<td>${vo.address}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="5" class="m-0 p-0"></tr>
		</table>
		<p>개별 회원 조회 :
				<input type="text" name="member" />
				<a href="${ctp}/j1101/Ex_jstl5MemberCheck" class="btn btn-primary">조회</a>
		</p>
		<hr />
		<p><a href="${ctp}/study/1101_JSTL/ex5_jstl.jsp" class="btn btn-success">돌아가기</a></p>
	</div>
	<p><br /></p>
</body>
</html>