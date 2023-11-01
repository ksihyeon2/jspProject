<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl2.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br /></p>
	<div class="container">
		<h2>JSTL(Java Standard Tag Library)</h2>
		<h3>반복문 (core 라이브러리 사용)</h3>
		<pre>
			사용법1 : < c : forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수" >
							</ c : forEach >
			사용법2 : < c : forEach var="변수" items="$ {객체명/배열}" varStatus="매개변수" >
							</ c : forEach >
			사용법3 : < c : forTokens var="변수" items="$ {객체명/배열}" delims="구분기호(구분자)" >
							</ c : forEach >
		</pre><hr />
		<p>1번 사용예 : <br /> 
			<%-- <c:forEach var="i" begin="1" end="10" step="1"> step이 1일 경우 생략 가능 --%>
			<c:forEach var="i" begin="1" end="10">
				${i} / 
			</c:forEach>
		</p><hr />
		<p>2번 사용예 : <br />
		<%
			String[] cards = {"국민","BC","현대","삼성","비자","LG","농협"};
			pageContext.setAttribute("cards", cards);
		%>
			<c:forEach var="card" items="${cards}">
				${card} /
			</c:forEach>
		</p><hr />
		<p>3번 사용예 : <br />
			<c:set var="hobbys" value="등산/낚시/수영/바둑/바이크/승마/독서" />
			취미1 : ${hobbys}<br />
			취미2 : 
			<c:forTokens var="hobby" items="${hobbys}" delims="/">
				${hobby} ,
			</c:forTokens>
		</p><hr />
		<p><b>각종 사용예제</b><br />
			<c:forEach var="card" items="${cards}" varStatus="st">
				${st.index} / ${st.count}. ${card} <br />
			</c:forEach>
			<br />
			-문제1 : 모든 카드를 출력하되, 국민카드는 파란색, 삼성카드는 빨간색으로 출력<br />
			 <c:forEach var="card" items="${cards}">
			 	<c:if test="${card == '삼성'}"><font color="blue">${card},</font></c:if>
			 	<c:if test="${card == '국민'}"><font color="red">${card},</font></c:if>
			 	<c:if test="${card != '삼성' && card != '국민'}">${card},</c:if>
			</c:forEach>
			<br /><br />
			-문제2 : 첫번째 카드는 빨간색, 마지막 카드는 파란색으로 출력<br />
			 <c:forEach var="card" items="${cards}" varStatus="st">
			 	<c:if test="${st.first}"><font color="red">${card},</font></c:if>
			 	<c:if test="${st.last}"><font color="blue">${card},</font></c:if>
			</c:forEach>
			<br /><br />
			-문제3 : 모든 카드를 출력하되 첫번째 카드는 빨간색, 마지막 카드는 파란색으로 출력<br />
			<c:forEach var="card" items="${cards}" varStatus="st">
				<c:if test="${st.first}"><font color="red">${card},</font></c:if>
			 	<c:if test="${st.last}"><font color="blue">${card},</font></c:if>
			 	<c:if test="${!st.first && !st.last}">${card},</c:if>
			</c:forEach>
			<br /><br />
			<c:forEach var="card" items="${cards}" varStatus="st">
				<c:choose>
					<c:when test="${st.first}"><font color="red">${card}</font></c:when>
					<c:when test="${st.last}"><font color="blue">${card}</font></c:when>
					<c:otherwise>${card}</c:otherwise>
				</c:choose>
				<%-- <c:if test="${st.first}"><font color="red">${card},</font></c:if>
			 	<c:if test="${st.last}"><font color="blue">${card},</font></c:if>
			 	<c:if test="${!st.first && !st.last}">${card},</c:if> --%>
			</c:forEach>
			<br /><br />
			-문제4 : 구구단 연습 <br />
			<h4>5단</h4>
			<c:forEach var="i" begin="1" end="9">
				5 * ${i} = ${5 * i} <br />
			</c:forEach>
			<br /><br />
			<h4>2~5단(2중For문)</h4>
			<c:forEach var="i" begin="2" end="5">
				* ${ i } 단 *<br />
				<c:forEach var="j" begin="1" end="9">
					${i} * ${j} = ${i*j} <br />
				</c:forEach>
				<br />
			</c:forEach>
		</p>
		<hr />
		<h3>5장의 그림 출력하기(1줄에 3개의 그림 출력)</h3>
		<c:forEach var="i" begin="1" end="5" varStatus="st">
			<img src="${pageContext.request.contextPath}/images/${i}.jpg" width="100px" />
			<c:if test="${st.count % 3 == 0}"><br /></c:if>
		</c:forEach>
		<hr />
		<h4>2차원 배열값 처리</h4>
		<%
			String[][] sinsang = {
					{"홍길동","서울"},
					{"김말숙","청주"},
					{"이기자","인천"},
					{"소나무","광주"},
					{"오하늘","제주"}
			};
			pageContext.setAttribute("sinsang", sinsang);
		%>
		<c:forEach var="sin" items="${sinsang}">
			<c:forEach var="s" items="${sin}">
				${s}/
			</c:forEach>
			<br />
		</c:forEach>
	</div>
	<p><br /></p>
</body>
</html>