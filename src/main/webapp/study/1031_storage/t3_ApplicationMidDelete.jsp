<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationMidDelete.jsp -->
<%
	application.removeAttribute("aMid");
// 현재 브라우저에 생성되어 있는 session을 모두 삭제하는 명령어
%>
<script>
	alert("아이디 어플리케이션이 삭제되었습니다.");
	location.href="t3_ApplicationMain.jsp";
</script>