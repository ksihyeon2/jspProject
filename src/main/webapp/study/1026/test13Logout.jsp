<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test13Logout.jsp -->
<%
	String name = request.getParameter("name");
	pageContext.setAttribute("name", name);
%>

<script>
	'use strict';
	alert("${name}님 로그아웃 되셨습니다.(MVC)");
	/* location.href="test13.jsp"; */
	<%-- location.href="< %=request.getContextPath()%>/study/1026/test13.jsp"; --%>
	location.href="${pageContext.request.contextPath}/study/1026/test13.jsp"; 
	// getter 표기법을 EL 표기법으로 변경
	/* pageContext 저장소는 현재 페이지에서만 사용하겠다는 의미 */
</script>