<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test2.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script>
  	'use strict';
  	
  	function fCheck() {
			let name = myform.name.value;
			let age = document.getElementById("age").value;
			
			if(name.trim() == "") {
				alert("성명을 입력하세요.");
				myform.name.focus();
			} else if(age.trim() == "") {
				alert("나이를 입력하세요.");
			  document.getElementById("age").focus();
			} else {
				// alert("정상처리 되었습니다.");
				//location.href = `test2Ok.jsp?name=${name}&age=${age}`;  // 백엔드 처리시 front에 사용하는 `` 사용 불가
				//location.href = "test2Ok.jsp?name="+name+"&age="+age;
				// location으로 전송되면 form에 post 방식으로 적어 놓아도 무조건 get방식으로 넘어감
				myform.submit(); // form 안의 내용을 넘기기
			}
	}
  </script>
</head>
<body>
	<p><br /></p>
	<div class="container">
		<h2>값의 전송(GET/PSOT) - form값 전송하기 </h2>
		<!--  <form name="myform" method="get" action="test1Ok.jsp"> -->
		<form name="myform" method="post" action="test2Ok.jsp">
			<div>성명
				<input type="text" name="name" class="form-control mb-3" autofocus />
			</div>
			<div>나이
				<input type="number" name="age" id="age" class="form-control mb-3" />
			</div>
			<div>
				<input type="button" value="전송(button)" onClick="fCheck()" class="btn-primary form-control" />
				<!-- submit은 test1Ok.jsp 로 이동/ button은 onClick을 test1Ok.jsp로 설정 -->
			</div>
			<input type="hidden" name="flag" value="OK"/>
		</form>
	</div>
	<p><br /></p>
</body>
</html>