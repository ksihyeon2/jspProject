<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>pdsList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function partCheck() {
			let part = $("#part").val();
			location.href="pdsList.pds?part="+part;
		}
		
		function pdsDeleteCheck(idx,fSName) {
			let ans = confirm("선택된 자료를 삭제하시겠습니까?");
			
			if(!ans) {
				return false;
			} 
			
			let pwd = prompt("비밀번호를 입력하세요.");
			console.log("pwd : "+ pwd);
			let query = {
					idx : idx,
					fSName : fSName,
					pwd : pwd
			};
			
			$.ajax({
				url : "pdsDeleteOk.pds",
				type : "post",
				data : query,
				success : function(res) {
					if( res != 0) {
						alert("자료가 삭제되었습니다.");
						location.reload();
					} else {
						alert("자료 삭제 실패");
					}
				},
				error : function() {
					alert("전송 오류");
				}
				
			});
		}
		
		/* 다운로드 수 증가시키기 */
		function downNumCheck(idx) {
			$.ajax({
				url : "pdsDownNumCheck.pds",
				type : "post",
				data : { idx : idx },
				success : function() {
					location.reload();
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
	<p><br /></p>
	<div class="container">
		<h2 class="text-center">자 료 실 리 스 트(${part})</h2>
		<br />
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td style="width:20%" class="text-left">
					<form name="partForm">
						<select name="part" id="part" onchange="partCheck()" class="form-control">
							<option ${part == "전체" ? "selected" : ""}>전체</option>
							<option ${part == "학습" ? "selected" : ""}>학습</option>
							<option ${part == "여행" ? "selected" : ""}>여행</option>
							<option ${part == "음식" ? "selected" : ""}>음식</option>
							<option ${part == "기타" ? "selected" : ""}>기타</option>
						</select>
					</form>
				</td>
				<td class="text-right">
					<a href="pdsInput.pds?part=${part}" class="btn btn-success">자료 올리기</a>
				</td>
			</tr>
		</table>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>번호</th>
				<th>자료제목</th>
				<th>작성이</th>
				<th>작성날짜</th>
				<th>분류</th>
				<th>파일명(크기)</th>
				<th>다운 수</th>
				<th>비고</th>
			</tr>
			<c:set var="pdsCnt" value="${fn:length(vos)}" />
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${pdsCnt}</td>
					<td>${vo.title}</td>
					<td>${vo.nickName}</td>
					<td>
						<c:if test="${vo.date_diff < 1 && vo.hour_diff < 24}">
							${vo.date_diff == 0 ? fn:substring(vo.fDate,10,16) : fn:substring(vo.fDate,0,16)} <img src="${ctp}/images/new.gif" />
						</c:if>
						<c:if test="${vo.date_diff > 1 || vo.hour_diff > 24}">
							${fn:substring(vo.fDate,0,10)}
						</c:if>
					</td>
					<td>${vo.part}</td>
					<td>
						<%-- ${vo.fName} --%>
						<c:set var="fNames" value="${fn:split(vo.fName,'/')}" />
						<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}" />
						<c:forEach var="fName" items="${fNames}" varStatus="st">
							<a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}</a><br />
						</c:forEach>
						<br />
						(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0"/> KByte)
					</td>
					<td>${vo.downNum}</td>
					<td>
						<c:if test="${vo.mid == sMid || sLevel == 0}">
						<!-- 문자와 숫자를 같이 담아서 보낼때는 오류가 잘 나기 때문에 혼합해서 보내려면 둘 다 문자로 담아주는게 좋음 -->
							<a href="javascript:pdsDeleteCheck('${vo.idx}','${vo.fSName}')" class="btn btn-danger">삭제</a>
						</c:if>
					</td>
				</tr>
				<c:set var="pdsCnt" value="${pdsCnt-1}" />
				<tr><td colspan="8" class="m-0 p-0"></td></tr>
			</c:forEach>
		</table>
	</div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>