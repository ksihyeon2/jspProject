<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test5_2.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
	<p><br /></p>
	<div class="container">
		<h2>URL 매핑(확장자 Mapping) 패턴</h2>	
		<p>이곳은 test5_2.jsp입니다.</p>
		<hr />
			<img src="${ctp}/images/2.jpg" width="400px" />
		<hr />
		<div>
			<input type="button" value="test5_1.jsp" onClick="location.href='${ctp}/mapping/test5.re';" class="btn btn-success m-3"/>
			<input type="button" value="test5_3.jsp" onClick="location.href='${ctp}/mapping/test5_3.re';" class="btn btn-primary m-3"/>
		</div>
		<hr />
		<pre>
			test1.jsp/ test2.jsp/ test3.jps 파일에 접속시키고 해당 파일이 화면에 파일명을 출력하시오
			test4.jsp 클릭시 test1.jsp 화면에 입력된 su1, su2의 내용에 해당되는 '합/차'를 구해서 test1.jsp에 출력시키시오.
		</pre>
	</div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>