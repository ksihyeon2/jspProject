<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br /></p>
	<div class="container">
		<h2>JSTL(Java Standard Tag Library)</h2>
		<table class="table border-bordered">
			<tr>
				<th>라이브러리명</th>
				<th>주소(URI)</th>
				<th>접두어</th>
				<th>기본 문법</th>
			</tr>
			<tr>
				<td>Core</td>
				<td>http://java.sun.com/jsp/jstl/core</td>
				<td>c</td>
				<td>< c : 태그명 ></td>
			</tr>
			<tr>
				<td>Formatting</td>
				<td>http://java.sun.com/jsp/jstl/fmt</td>
				<td>fmt</td>
				<td>< fmt : 태그명 ></td>
			</tr>
			<tr>
			<!-- Function은 함수이기 때문에 태그가 아닌 EL표기법으로 사용-->
				<td>Function</td>
				<td>http://java.sun.com/jsp/jstl/Function</td>
				<td>fn</td>
				<td>$ { fn : 태그명 }</td>
			</tr>
			<!-- sql은 사용하지 않음 -->
			<tr>
				<td>Formatting</td>
				<td>http://java.sun.com/jsp/jstl/sql</td>
				<td>sql</td>
				<td>< sql : 태그명 ></td>
			</tr>
		</table>
		<hr />
		<p><b>위의 라이브러리를 사용할 경우에는 상단에 jsp 지시자(taglib)를 이용하여 먼저 선언후 사용할 수 있다.</b></p>
		<hr />
		<h3>Core 라이브러리<span style='font-size:10pt; color:blue'>(EL에 들어가는 변수를 제어할 때 자주 사용)</span> :  / 변수 제어(선언/값할당/출력/제거), 제어문(조건, 반복문)</h3>
		<pre>
			변수 선언 : < c : set var="변수명" value="값" />
			변수 출력 : < c : out value="변수/값/수식" /> 또는 EL로 사용 $ {변수} 
			변수 제거 : < c : remove var="변수명" />
		</pre>
		<p>사용 예</p><hr />
		su1 변수를 선언 후 초기값으로 100을 할당
		<c:set var="su1" value="100" /><br /><hr />
		su1 변수의 값 출력 :
		<!-- (c:out으로 출력하든 EL로 출력하든 상관 없음)  -->
		<c:out value="100+200"></c:out> / ${su1} <br /><hr />
		su1 변수의 수식을 출력 :
		<!-- 수식을 사용하려면 EL로 출력해야 함 -->
		<c:out value="${su1+200}"></c:out> / ${su1+200} <br /><hr />
		스크립틀릿 출력 :
		<c:out value='<%= "아톰" %>'></c:out><hr />
		<h3>JSTL 제어문 (core라이브러리와 EL을 함께 활용)</h3>
		<p>사용법 : < c : if test="$ {조건식}" > 조건식에 처리할 내용 < / c : if> </p>
		<div>단점1 : JSTL의 숫자비교는 문자형식으로 비교한다.(해결 : 변수명 뒤에 +0을 하여 int처리해서 처리한다.)</div>
		<div>단점2 : else 문장이 없다.(배타적으로 비교한다. 또는 다중조건 비교를 수행할 수 있다.)</div>
		<p>사용예 (su3=300, su4=400)</p>
		<c:set var="su3" value="100" />
		<c:set var="su4" value="20" />
		<div>su3 : ${su3} / su4 : ${su4}</div>
		<div>1. su3 == su4 : <c:if test="${su3 == su4}">su3와 su4는 같다.</c:if> </div>
		<div>2. su3 != su4 : <c:if test="${su3 != su4}">su3와 su4는 다르다.</c:if> </div>
		<div>3. su3 > su4 : <c:if test="${su3 > su4}">su3는 su4보다 크다.</c:if> </div>
		<div>4. su3 < su4 : <c:if test="${su3 < su4}">su3는 su4보다	 작다.</c:if> </div>
		<div>5. su3 > su4 : <c:if test="${su3+0 > su4+0}">su3는 su4보다 크다.</c:if> </div>
		<div>6. su3 < su4 : <c:if test="${su3+0 < su4+0}">su3는 su4보다	 작다.</c:if> </div>
		<div>7. su3 > su4 : <c:if test="${su3+0 >= su4+0}">su3는 su4보다 크거나 같다.</c:if> </div>
		<div>8. su3 < su4 : <c:if test="${su3+0 <= su4+0}">su3는 su4보다 작거나 같다.</c:if> </div>
		<div>9. su3 gt su4 : <c:if test="${su3+0 gt su4+0}">su3는 su4보다 크다.</c:if> </div>
		<div>10. su3 lt su4 : <c:if test="${su3+0 lt su4+0}">su3는 su4보다 작다.</c:if> </div>
		<div>11. su3 ge su4 : <c:if test="${su3+0 ge su4+0}">su3는 su4보다 크거나 같다.</c:if> </div>
		<div>12. su3 lelt su4 : <c:if test="${su3+0 le su4+0}">su3는 su4보다 작거나 같다.</c:if> </div>
		<hr />
		<div> 예제 : URL에 jumsu를 입력받아서 학점을 구하시오</div>
		<div>
			<c:set var="jumsu" value="${param.jumsu}" />
			<c:if test="${jumsu+0 < 60}"><c:set var="grade" value="F"/></c:if>
			<c:if test="${jumsu+0 >= 60}"><c:set var="grade" value="D"/></c:if>
			<c:if test="${jumsu+0 >= 70}"><c:set var="grade" value="C"/></c:if>
			<c:if test="${jumsu+0 >= 80}"><c:set var="grade" value="B"/></c:if>
			<c:if test="${jumsu+0 >= 90}"><c:set var="grade" value="A"/></c:if>
			학점은 : ${grade}
		</div>
		<h3>다중조건비교 : choose ~ when</h3>
		<pre>
			사용법 : 
			< c :choose >
				< c :when test="조건식1">수행할 내용1</ c :when>
				< c :when test="조건식2">수행할 내용2</ c :when>
				< c :when test="조건식3">수행할 내용3</ c :when>
				< c :when test="조건식4">수행할 내용4</ c :when>
				< c :otherwise >기타 수행할 내용</ c :otherwise>
			< / c :choose >
		</pre>
		<div>학점 구하기
			<c:choose>
				<c:when test="${jumsu+0 >= 90}">A</c:when>
				<c:when test="${jumsu+0 >= 80}">B</c:when>
				<c:when test="${jumsu+0 >= 70}">C</c:when>
				<c:when test="${jumsu+0 >= 60}">D</c:when>
				<c:otherwise>F</c:otherwise>
			</c:choose>
		</div>
	</div>
	<p><br /></p>
</body>
</html>