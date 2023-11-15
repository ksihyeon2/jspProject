<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardSearchList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
	<p><br /></p>
	<div class="container">
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td colspan="2">
					<h2 class="text-center">게 시 판 검 색 자 료 리 스 트</h2>
					(<font color="blue">${searchTitle}</font>(으)로 <font color="red">${searchString}</font>(을)를 검색한 결과 <font color="blue">${searchCount}</font>건이 검색되었습니다.)
				</td>
			</tr>
			<tr>
				<td class="text-right">
					<a href="boardList.bo?pag=${pag}&pageSize=${pageSize}" class="btn btn-warning btn-sm">돌아가기</a>
				</td>
			</tr>
		</table>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>글번호</th>
				<th>글제목</th>
				<th>글쓴이</th>
				<th>작성날짜</th>
				<th>조회수(좋아요)</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${searchCount}</td>
					<td class="text-left">
						<a href="boardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&flag=search&search=${search}&searchString=${searchString}">${vo.title}</a>
						<c:if test="${vo.hour_diff <= 24}">
							<img src="${ctp}/images/new.gif" />
						</c:if>
					</td>
					<td>${vo.nickName}</td>
					<td> <!-- new.gif가 표시된 글은 시간만 시간만 표시시켜주고 그렇지 않은 자료는 일자만 표시 -->
						<c:if test="${vo.hour_diff <= 24}">
							${fn:substring(vo.wDate,10,19)}						
						</c:if>
						<c:if test="${vo.hour_diff > 24}">
							${fn:substring(vo.wDate,0,10)}	
						</c:if>
					</td>
					<td>${vo.readNum}(${vo.good})</td>
				</tr>
				<td colspan="5" class="m-0 p-0"></td>
				<c:set var="searchCount" value="${searchCount-1}"></c:set>
			</c:forEach>
		</table>
	</div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>