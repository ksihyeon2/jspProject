<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- < %@ include file="bs4.jsp" %> --%>
<%-- < %@ include file="../../include/bs4.jsp" %> 나를 기준으로 움직이는 것: 상대 경로 지정 --%>
<%-- < %@ include file="< %=request.getContextPath() %>/include/bs4.jsp" %>  (사용불가 : %안에는 %를 다시 사용할 수 없음--%> 
<%-- <jsp:include page="/include/bs4.jsp" ></jsp:include> --%>
<!-- jsp액션 태그 처음의 '/'은 ContextPath의 root명으로 간주됨 -->
<!-- jsp 액션 태그로 include를 사용하면 file이 page로(현재 페이지에서 사용하겠다는 의미) 변경되어 사용 -->
<!-- <div class="container"> -->
<div style="height:110px; text-align:center;">
	<p><br /></p>
	<a href="home.jsp" class="btn btn-outline-primary">Home</a> |
	<a href="guest.jsp" class="btn btn-outline-primary">Guest</a> |
	<a href="board.jsp" class="btn btn-outline-primary">Board</a> |
	<a href="pds.jsp" class="btn btn-outline-primary">Pds</a>
</div>