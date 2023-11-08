<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>join.jsp</title>
  <jsp:include page="/include/bs4.jsp" />

  <style>
    th {
      background-color: #eee;
      text-align: center;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container text-center">
	<form name="myform" method="post" action="joinOk.lo">
	  <h2>회 원 가 입</h2>
	  <table class="table table-bordered">
	    <tr>
	      <th>아이디</th>
	      <td><input type="text" name="mid" id="mid" value="" class="form-control" autofocus required /></td>
	    </tr>
	    <tr>
	      <th>비밀번호</th>
	      <td><input type="password" name="pwd" id="pwd" value="" class="form-control" required/></td>
	    </tr>
	    <tr>
	      <th>성명</th>
	      <td><input type="text" name="name" id="name" value="" class="form-control" required/></td>
	    </tr>
	    <tr>
	      <td colspan="2">
	        <input type="submit" value="가입하기" class="btn btn-success" />
	        <input type="reset" value="다시입력" class="btn btn-info" />
	        <input type="button" value="돌아가기" onclick="location.href='login.lo';" class="btn btn-danger" />
	      </td>
	    </tr>
	  </table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>