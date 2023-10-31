<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionSave.jsp -->
<%
	request.setCharacterEncoding("UTF-8");
	// 세션값 저장하기 : session.setAttribute("세션변수",값or변수)
	String mid = request.getParameter("mid") == null ? "guest" : request.getParameter("mid");
	String nickName = request.getParameter("nickName") == null ? "guest" : request.getParameter("nickName");
	String name = request.getParameter("name") == null ? "guest" : request.getParameter("name");
	
	session.setAttribute("sMid", mid);
	session.setAttribute("sNickName", nickName);
	session.setAttribute("sName", name);
	
%>
<script>
	alert("세션이 저장되었습니다.");
	location.href="t2_SessionMain.jsp";
</script>