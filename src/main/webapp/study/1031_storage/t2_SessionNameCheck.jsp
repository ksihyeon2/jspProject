<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionNameCheck.jsp -->
<jsp:include page="/include/bs4.jsp" />
<p><br /></p>
<div class="container">
<%
	Enumeration names = session.getAttributeNames();
// Enumeration : 열거형
// 변수가 아닌 상수 값들을 모아서 사용할 때 사용할 수 있다.

	while(names.hasMoreElements()) {
		String sName = (String)names.nextElement();
		//객체이기 때문에 String으로 강제 형변환 해주어야 함
		out.println("세션 이름 : " + sName + "<br />");
	}

%>
<hr />
	<p><a href="t2_SessionMain.jsp" class="btn btn-success">돌아가기</a></p>
</div>