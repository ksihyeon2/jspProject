<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>el1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br /></p>
	<div class="container">
		<h2>EL (Expression Language)</h2>
		<p>저장소에 기록되어 있는 자료에 대한 처리를 담당한다.</p>
		<pre>
			용도 : 사용자가 '변수/값/수식/객체' 등을 전송받은 후 저장 또는 처리하는 용도로 사용한다.
			표기법 : $ {'변수/값/수식/객체'} 
			저장소 : Application / Session / PageContext / Request  - server 영역
		</pre>
		<hr />
		<%
			String atom = "Seoul";
			String name = "홍길동";
			int su1 = 100, su2 = 200;
			String su3 = "300", su4 = "400";
		%>
		<h4><b>스크립틀릿을 이용할 경우</b></h4>
		<div>
			atom = <%= atom %><br />
			name = <%= name %><br />
			su1 = <%= su1 %><br />
			su2 = <%= su2 %><br />
			<%-- su3 * su4 = <%= (su3 * su4) %> --%>
		</div>
		<hr />
		<h4><b>EL을 이용할 경우</b></h4>
			<%
				request.setAttribute("atom", atom);
				request.setAttribute("name", name);
				pageContext.setAttribute("su1", su1);
				pageContext.setAttribute("su2", su2);
				pageContext.setAttribute("su3", su3);
				pageContext.setAttribute("su4", su4);
				/* request 나 pageContext 둘 중 아무거나 사용 가능 */
			%>
		<div>
			atom = ${atom}<br />
			name = ${name}<br />
			su1 = ${su1}<br />
			su2 = ${su2}<br />
			su3 = ${su3}<br />
			su4 = ${su4}<br />
			su1 * su2 = ${su1 * su2}<br />
			su3 * su4 = ${su3 * su4}<br />
			su3 + su4 = ${su3 + su4}<br />
			<!-- 수치연산이면 덧셈이라도 먼저 연산처리가 됨 자동형변환 / 자바나 자바스크립트는 덧셈 연산처리는 문자로 먼저 취급 -->
		</div>
		<hr />
		<h4><b>파라메터를 통해 넘어온 값 처리</b></h4>
		<div>Form태그의 get/post 방식의 전송이나, url(주소?변수명1=값1&변수명2=값2)을 통한 전송값들의 처리</div>
		<div>
			주소창에 ?mbc=20&kbs=50이 넘어왔을 경우 <br />
			mbc= ${param.mbc}<br />
			kbs= ${param.kbs}<br />
		</div>
		<hr />
		<%
			String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
			pageContext.setAttribute("mid", mid);	
		%>
		<form>
			<div>
				아이디 : <input type="text" name="mid" value="${mid}" />
				<input type="submit" value="전송" class="btn btn-success" />
			</div>
		</form>
	</div>
	<p><br /></p>
</body>
</html>