<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/include/memberCheck.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>update.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    function fCheck() {
    	let pwd = document.getElementById("pwd").value; 
    	let name = document.getElementById("name").value;
    	
    	if(pwd.trim() == "" || name.trim() == "") {
    		alert("수정하실 정보를 입력하세요");
    		document.getElementById("name").focus();
    	} else {
    		myform.submit();
    	}
    }
  </script>
  <style>
    th {
      background-color: #eee;
      text-align: center;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h2>회원 정보 수정</h2>
  <form name="myform" method="post" action="${ctp}/database/updateOk" >
  <table class="table table-bordered">
    <tr>
      <th>아이디</th>
      <%-- <td>${sMid}</td> id는 수정하지 않을 경우 이렇게 적어줘도 되긴 하지만 submit으로는 id가 넘어가지 않음 
      (form 태그 안에 들어가 있지만 submit은 input이나 select 의 값만 넘어감), 같이 넘기려면 밑에 hidden으로 보내고 밑에있는 input 을 지워야 함
      지우지 않으면 중복으로 넘어감 --%>
      <td><input type="text" name="mid" id="mid" value="${sMid}" class="form-control" readonly/></td>
    </tr>
    <tr>
      <th>성명</th>
      <td><input type="text" name="name" id="name" value="${sName}" class="form-control" /></td>
    </tr>
    <tr>
      <th>비밀번호 확인</th>
      <td><input type="password" name="pwd" id="pwd" class="form-control"/></td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="button" value="수정하기" onclick="fCheck()" class="btn btn-success" />
        <input type="reset" value="다시입력" class="btn btn-warning" />
        <input type="button" value="돌아가기" onclick="location.href='${ctp}/study/database/memberMain.jsp';" class="btn btn-danger" />
      </td>
    </tr>
  </table>
  </form>
</div>
<p><br/></p>
</body>
</html>