<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberIdFind.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		
		function memberIdFind() {
			let email = document.getEelementById.valus;
			let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			
			if(!regEmail.test(email)) {
		  	alert("이메일 형식에 맞지않습니다.");
		    myform.email1.focus();
		    return false;
		  }
			else {
				$.ajax({
					url : "${ctp}/memberIdFind.mem",
				});
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
	<p><br /></p>
	<div class="container">
		<form name="memberIdFindForm" >
  	<table class="table table-bordered">
  	  <tr>
  	    <td colspan="2" class="text-center"><h2>아이디 찾기</h2></td>
  	  </tr>
  	  <tr>
  	    <th>이메일</th>
  	    <td>
  	    	<div class="input-group">
		  	    <input type="email" name="email" id="email" onclick="memberIdFind()" class="form-control" autofocus required />
						<div class="input-group-append">
  	     			<input type="submit" value="찾기" class="btn btn-success mr-2" />
						</div>
  	    	</div>
  	    </td>
  	  </tr>
  	  <tr>
  	    <th>아이디</th>
  	    <td><input type="text" name="mid" id="mid" class="form-control" readonly /></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2" class="text-center">
					[<a href="${ctp}/memberPwdFind.mem">비밀번호 찾기</a>] /
					[<a href="${ctp}/memberLogin.mem">로그인창</a>]
  	    </td>
  	  </tr>
  	</table>
  </form>
	</div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>