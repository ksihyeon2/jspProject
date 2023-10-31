<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionDelete.jsp -->
<%
	session.invalidate();
// 현재 브라우저에 생성되어 있는 session을 모두 삭제하는 명령어
%>
<script>
	alert("모든 세션이 삭제되었습니다.");
	location.href="t3_ApplicationMain.jsp";
</script>