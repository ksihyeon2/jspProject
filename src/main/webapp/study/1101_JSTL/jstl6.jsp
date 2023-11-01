<%@page import="study.j1101.Jstl4VO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl6.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br /></p>
	<div class="container">
		<h2>JSTL Function 라이브러리</h2>
		<pre>
			사용법 : $ { fn:함수명(변수/값/객체 등)}
			관계연산자 : ==(eq), !=(ne), >(gt), <(lt), >=(ge), <=(le)
		</pre>
		<%
			String str = "Welcom to My HomePage!";
			pageContext.setAttribute("str", str);
			
			String[] hobbys = {"등산","낚시","수영","바둑","승마","수영","영화감상","우표수집"};
			pageContext.setAttribute("hobbys", hobbys);
			
			ArrayList<Jstl4VO> vos = new ArrayList<Jstl4VO>();
			Jstl4VO vo;
			vo = new Jstl4VO();
			vo.setName("홍길동");
			vo.setAge(25);
			vo.setGender("남자");
			vo.setJob("학생");
			vo.setAddress("청주");
			vos.add(vo);
			
			vo = new Jstl4VO();
			vo.setName("김말숙");
			vo.setAge(22);
			vo.setGender("여자");
			vo.setJob("회사원");
			vo.setAddress("광주");
			vos.add(vo);
			pageContext.setAttribute("vos", vos);

		%>
		<%-- <c:set var="str" value="Welcom to My HomePage!" /> --%>
		<div>
			str 변수의 값 : ${str} <br />	
			1-1. 길이(length) : <%= str.length() %> / ${fn:length(str)} <br />
			1-2. 길이(length) : <%= hobbys.length %> / ${fn:length(hobbys)} <br />
			1-3. 길이(length) : <%= vos.size() %> / ${fn:length(vos)} <br />
			<hr />
			2-1. 대문자 변환(toUpperCase()) : <%= str.toUpperCase() %> / ${fn:toUpperCase(str)}<br />
			2-2. 소문자 변환(toLowerCase()) : <%= str.toLowerCase() %> / ${fn:toLowerCase(str)}<br />
			<hr />
			3-1. 문자열추출(substring()) : <%= str.substring(0,5) %> / ${fn:substring(str,0,5)}<br />
			3-2. 문자열추출(substring()) : <%= str.substring(5) %> <%-- / ${fn:substring(str,5,fn:length(str))}<br /> --%>
																													<%-- ${fn:substring(str,5)}<br />  (X)--%>
																													/ ${fn:substring(str,5,-1)}<br />
			<hr />
			4-1. 특정 문자의 위치값(indexOf()) : <%= str.indexOf("o") %> / ${fn:indexOf(str,"o")}<br />
			4-2. 특정 문자의 위치값(lastIndexOf()) : <%= str.lastIndexOf("o") %> / <%-- ${fn:lastIndexOf(str,"o")}<br /> --%><br />
			4-3. str변수의 값 중에서 'o'문자가 들어가 있는 모든 위치를 출력 <br />
			<c:set var="cnt" value="0"></c:set>
			<c:forEach var="i" begin="0" end="${fn:length(str)-1}">
				<c:if test="${fn:substring(str,i,i+1) == 'o'}">
					<c:set var="cnt" value="${cnt+1}" />
					${cnt}번째 'o'의 위치값 : ${i+1}<br />
				</c:if>
			</c:forEach>
			str 변수의 'o' 문자의 개수 : ${cnt}개
			<hr />
			<%-- 4-4. str변수의 'o' 문자의 2번째 위치값만 출력(마지막 'o'문자의 위치값)--%>
			5. 문자열 추출(substringBefore() / substringAfter() )
			문자 'o' 앞의 문자열을 출력 : ${fn:substringBefore(str,'o')}<br />
			문자 'o' 뒤의 문자열을 출력 : ${fn:substringAfter(str,'o')}<br />
			--------2번째 'o'의 위차값 출력
			<hr />
			6. 문자열분리(split(변수,분리할 문자)) : 문자분리후에는 분리된 문자들을 '변수'에 담아줘야 한다.<br />
			예) str변수 안의 문자열중에서 'o'를 기준으로 분리해서 출력하시오.<br />
			<c:set var="strs" value="${fn:split(str,'o')}"></c:set>
			<c:forEach var="s" items="${strs}" varStatus="st">
				${st.count}. ${s}<br /> 
			</c:forEach>
			str변수의 'o'문자의 개수 : ${fn:length(strs)-1}개
			<hr />
			7.치환(replace())<br />
			예) str 변수 안의 'o'를 'O'로 치환
			<%= str.replace("o", "O") %> / ${fn:replace(str,'o','O')}
			<hr />
			8.특정문자(열)의 포함 유무 (contains())<br />
			예1) str변수에 'My'가 포함 되었는지 확인 :	${fn:contains(str, 'My')}<br />
			예2) str변수에 'my'가 포함 되었는지 확인 :	${fn:contains(str, 'my')}<br />
		</div>
	</div>
	<p><br /></p>
</body>
</html>