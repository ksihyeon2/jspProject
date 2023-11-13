<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adminMemberInfor.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	 <script>
    'use strict';
    
    function levelChange(e) {
    	let ans = confirm("선택한 회원의 등급을 변경하시겠습니까?");
    	if(!ans) {
    		location.reload();
    		return false;
    	}
    	
    	let items = e.value.split("/");
    	let query = {
    			idx   : items[1],
    			level : items[0]
    	}
    	
    	$.ajax({
    		url  : "adminMemberLevelChange.ad",
    		type : "post",
    		data : query,
    		success:function(res) {
    			if(res != "0") {
    				alert("등급 수정 완료!");
    				location.reload();
    			}
    			else alert("등급 수정 실패~");
    		},
    		error : function() {
    			alert("전송 오류~");
    		}
    	});
    }
 </script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
	<p><br /></p>
	<div class="container text-center">
		<h2>${vo.mid} 회원 상세 정보</h2>
		<img src="${ctp}/images/member/${vo.photo}" width="300px" class="mb-3"></img>
		<table class="table table-hover	">
    <tr>
      <td>번호 : ${vo.idx}</td>
    </tr>
    <tr>
      <td>아이디 : ${vo.mid}</td>
   	</tr>
   	<tr>
      <td>닉네임 : ${vo.nickName}</td>
    </tr>
    <tr>
      <td>성명 : ${vo.name}</td>
   	</tr>
    <tr>
      <td>성별 : ${vo.gender}</td>
   	</tr>
    <tr>
      <td>생년월일 : ${fn:substring(vo.brithday,0,10)}</td>
   	</tr>
    <tr>
      <td>전화번호 : ${vo.tel}</td>
   	</tr>
    <tr>
      <td>주소 : ${vo.address}</td>
   	</tr>
    <tr>
      <td>이메일 : ${vo.email}</td>
   	</tr>
    <tr>
      <td>홈페이지 주소 : ${vo.homePage}</td>
   	</tr>
    <tr>
      <td>직업 : ${vo.job}</td>
   	</tr>
    <tr>
      <td>취미 : ${vo.hobby}</td>
   	</tr>
    <tr>
      <td>소개 : ${vo.content}</td>
   	</tr>
    <tr>
      <td>잔여 포인트 : ${vo.point}</td>
   	</tr>
   	<tr>
      <td>오늘방문횟수 : ${vo.todayCnt}</td>
    </tr>
   	<tr>
      <td>총 방문 횟수 : ${vo.visitCnt}</td>
    </tr>
   	<tr>
      <td>최초 가입일 : ${vo.startDate}</td>
    </tr>
   	<tr>
      <td>마지막 접속일 : ${vo.lastDate}</td>
    </tr>
    <tr>
      <td>탈퇴신청 : 
      	<c:if test="${vo.userDel == 'OK'}"><font color="red"><b>탈퇴신청</b></font></c:if>
        <c:if test="${vo.userDel != 'OK'}">활동중</c:if>
      </td>
    </tr>
    <tr>
      <td>레벨 :
      	<form name="levelForm">
     	 		<select name="level" onchange="levelChange(this)">
       			<option value="0/${vo.idx}" ${vo.level==0 ? "selected" : ""}>관리자</option>
        		<option value="1/${vo.idx}" ${vo.level==1 ? "selected" : ""}>준회원</option>
        		<option value="2/${vo.idx}" ${vo.level==2 ? "selected" : ""}>정회원</option>
        		<option value="3/${vo.idx}" ${vo.level==3 ? "selected" : ""}>우수회원</option>
      		</select>
       	</form>
    	</td>
    </tr>
    <tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
		<div><a href="adminMemberList.ad?pag=${pag}&pageSize=${pageSize}&level=${level}" class="btn btn-warning">돌아가기</a></div>
	</div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>