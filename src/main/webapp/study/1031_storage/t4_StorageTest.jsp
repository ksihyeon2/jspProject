<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int aCount = application.getAttribute("aCount") == null ? 0 : (int)application.getAttribute("aCount");
	int sCount = session.getAttribute("sCount") == null ? 0 : (int)session.getAttribute("sCount");
	
	aCount++;
	sCount++;
	
	application.setAttribute("aCount", aCount);
	session.setAttribute("sCount", sCount);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t4_StorageTest.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br /></p>
	<div class="container">
		<h2>방문 카운트 비교하기</h2>
		<hr />
		<p>어플리케이션 카운트 : ${aCount}</p>
		<hr />
		<p>세션 카운트 : ${sCount}</p>
		<hr />
		<p>
			<a href="t4_ApplicationStart.jsp" class="btn btn-success">어플리케이션 카운트 초기화</a>
			<!-- 어플리케이션은 브라우저와 관계있는 것이 아니라 서버와 관련있는 것이라 다른 브라우저에서 카운트를 증가시킨 후 다른 브라우저에서 접속하면 다른 브라우저에서 증가된 카운터의 값을 가져와서 증가시킴 -->
			<a href="t4_SessionStart.jsp" class="btn btn-info">세션 카운트 초기화</a>
			<!-- 세션은 브라우저와 관계있는 것이라 다른 브라우저에서 카운트를 증가시켜도 다른 브라우저에서는 카운터가 증가되지 않고 해당 브라우저의 카운터의 값에서 증가됨 -->
			<a href="t4_StorageTest.jsp" class="btn btn-primary">방문수 증가</a>
		</p>
	</div>
	<p><br /></p>
</body>
</html>