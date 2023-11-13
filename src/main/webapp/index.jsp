<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
실무에서는 잘 사용하지 않음(주소가 다 나옴)
<script>
	location.href = "main.ad";
</script>
--%>
<%--
태그 안에서 사용하기 때문에 잘 사용하지 않음(주소는 다 나오지 않음)
<jsp:forward page="main.ad" />
--%>
<%
	// response.sendRedirect("main.ad");
	pageContext.forward("main.ad");
%>