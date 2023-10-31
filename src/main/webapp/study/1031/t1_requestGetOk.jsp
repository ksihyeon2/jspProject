<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_requestGetOk.jsp -->
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String[] hobbys = request.getParameterValues("hobby");
	
	String hobby = "";
	for(String h : hobbys) {
		hobby += h + "/";
	}
	
	hobby = hobby.substring(0,hobby.length()-1);
%>
<p>전송된 값</p>
<p>성명 : <%= request.getParameter("name") %></p>
<p>취미 : <%= hobby %></p>
<p>호스트 IP1: <%= request.getParameter("hostIp")%></p>
<!-- 앞에서 넘긴 값을 호출 -->
<p>호스트 IP2: <%= request.getRemoteAddr() %></p>
<!-- 바로 호출 -->
<p>전송 방식 : <%= request.getMethod() %></p>
<p>접속 프로토콜 : <%= request.getProtocol() %></p>
<p>접속 서버이름: <%= request.getServerName() %></p>
<!-- 내가 처음 접속한 서버의 주소가 뜸 -->
<!-- 따로 서버의 이름을(도메일) 주지 않으면 IP가 뜸 -->
<p>접속 서버포트 : <%= request.getServerPort() %></p>
<p>접속 Context명 : <%= request.getContextPath() %></p>
<p>접속 URL : <%= request.getRequestURL() %></p>
<p>접속 URI : <%= request.getRequestURI() %></p>
<p><input type="button" value="돌아가기" onClick="history.back()" /></p>