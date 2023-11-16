<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardContent.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		th {
			text-align : center;
			background-color : #eee;
		}
	</style>
	<script>
		'use strict';
		/* 좋아요 증가(중복 불허) */
		function goodCheck() {
			$.ajax({
				url : "boardGoodCheck.bo",
				type : "post",
				data : {idx:${vo.idx}},
				success : function(res) {
					if(res == "0") {
						alert("이미 좋아요 버튼을 클릭하셨습니다.");
					} else {
						location.reload();
					}
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
		
		/* 좋아요 증가(중복 허용) */
		function goodCheckPlus() {
			$.ajax({
				url : "boardGoodCheckPlusMinus.bo",
				type : "post",
				data : {
					idx:${vo.idx},
					goodCnt : +1
			},
				success : function() {
						location.reload();
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
		
		/* 좋아요 감소(중복 허용) */
		function goodCheckMinus() {
			$.ajax({
				url : "boardGoodCheckPlusMinus.bo",
				type : "post",
				data : {
					idx:${vo.idx},
					goodCnt : -1
			},
				success : function() {
						location.reload();
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
		
		function boardDelete() {
			let ans = confirm("해당 게시물을 삭제하시겠습니까?");
			if(ans) {
				location.href="boardDelete.bo?idx=${vo.idx}";
			}
		}
		
		/* 댓글달기 */
		function replyCheck() {
			let content = $("#content").val();
			if(content.trim() == "") {
				alert("댓글을 입력하세요.");
				$("#content").focus();
				return false;
			}
			
			let query = {
					boardIdx:${vo.idx},
					mid:'${sMid}',
					nickName:'${sNickName}',
					hostIp:'${pageContext.request.remoteAddr}',
					content:content
			}
			$.ajax({
				url : "boardReplyInput.bo",
				type : "post",
				data : query,
				success : function(res) {
					if(res == "1") {
						alert("댓글이 입력되었습니다.");
						location.reload();
					} else {
						alert("댓글 입력 실패");
					}
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
		
		/* 댓글 삭제하기 */
		function replyDelete(idx) {
			let ans = confirm("댓글을 삭제하시겠습니까?");
			if(!ans) {
				return false;
			}
			
			$.ajax({
				url : "boardReplyDelete.bo",
				type : "post",
				data : {idx:idx},
				success : function(res) {
					if(res == "1") {
						alert("댓글 삭제 완료.");
						location.reload();
					}
					else {
						alert("댓글 삭제 실패.");
					}
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
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td><h2 class="text-center">글 내 용 보 기</h2></td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th>작성자</th>
				<td>${vo.nickName}</td>
				<th>작성일</th>
				<td>${fn:substring(vo.wDate,0,16)}</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td colspan="3" class="text-left">${vo.title}</td>
			</tr>
			<tr>
				<th>전자메일</th>
				<td>
				 <c:if test="${empty vo.email}">없음</c:if> 
				 <c:if test="${!empty vo.email}">${	vo.email}</c:if> 
				</td>
				<th>조회수</th>
				<td>${vo.readNum}</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td>
					<c:if test="${empty vo.homePage || (fn:indexOf(vo.homePage,'http://') == -1 && fn:indexOf(vo.homePage,'https://') == -1) || fn:length(vo.homePage) <= 10}">없음</c:if>
        	<c:if test="${!empty vo.homePage && (fn:indexOf(vo.homePage,'http://') != -1 || fn:indexOf(vo.homePage,'https://') != -1) && fn:length(vo.homePage) > 10}"><a href = "${vo.homePage}" target="_blank">${vo.homePage}</a></c:if>
				</td>
				<th>좋아요수</th>
				<td><font color="red"><a href="javascript:goodCheck()">❤</a></font>(${vo.good}) / <a href="javascript:goodCheckPlus()">👍</a><a href="javascript:goodCheckMinus()">👎</a> </td>
			</tr>
			<tr>
				<th>글내용</th>
				<!-- 글 내용 replace로 위에서 newLine 설정 후 엔터키는 <br />로 설정하기 -->
				<td colspan="3" style="height:220px">${fn:replace(vo.content,newLine, "<br />")}</td>
			</tr>
		</table>
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td class="text-left">
					<c:if test="${flag != 'search' }"><input type="button" value="돌아가기" onclick="location.href='boardList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-info" /> &nbsp;</c:if>
					<c:if test="${flag == 'search' }"><input type="button" value="돌아가기" onclick="location.href='boardSearch.bo?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn btn-info" /> &nbsp;</c:if>
					<c:if test="${vo.mid == sMid || sLevel == 0}">
						<c:if test="${vo.mid == sMid}">
							<input type="button" value="수정하기" onclick="location.href='boardUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-success" /> &nbsp;
						</c:if>
						<input type="button" value="삭제하기" onclick="boardDelete()" class="btn btn-danger" />
					</c:if>
				</td>
				<td class="text-right"><a href="complaintInput.ad?vo=${vo}" class="btn btn-danger">신고하기</a></td>
			</tr>
		</table>
		<br />
		<!-- 이전글/다음글 처리 -->
		<table class="table table-borderless">
	    <tr>
	      <td>
	      	<c:if test="${!empty nextVo.title}">
	        	☝<a href="boardContent.bo?idx=${nextVo.idx}&pag=${pag}&pageSize=${pageSize}">다음글 : ${nextVo.title}</a><br/>
	       	</c:if>
	       	<c:if test="${!empty preVo.title}">
	        	👇<a href="boardContent.bo?idx=${preVo.idx}&pag=${pag}&pageSize=${pageSize}">이전글 : ${preVo.title}</a><br/>
	     		</c:if>
	      </td>
	    </tr>
		</table>
	</div>
	<!-- 댓글 처리 -->
	<div class="container">
	<!-- 댓글 리스트 보여주기 -->
		<table class="table table-hover text-center">
			<tr>
				<th>작성자</th>
				<th>댓글 내용</th>
				<th>작성일</th>
				<th>접속IP</th>
			</tr>
			<c:forEach var="replyVo" items="${replyVos}" varStatus="st">
				<tr>
					<td >${replyVo.nickName}
						<c:if test="${replyVo.mid == sMid || sLevel == 0}">
							(<a href="javascript:replyDelete(${replyVo.idx})">❌</a>)						
						</c:if>
					</td>
					<td class="text-left">${fn:replace(replyVo.content,newLine,"<br />")}</td>
					<td>${fn:substring(replyVo.wDate,0,10)}</td>
					<td>${replyVo.hostIp}</td>
				</tr>
				<tr><td colspan="4" class="m-0 p-0"></td></tr>
			</c:forEach>
		</table>
		
		<!-- 댓글 입력창 -->
		<form name="replyForm">
			<table class="table table-center">
				<tr>
					<td style="width:85%" class="text-left">
						댓글 입력
						<textarea rows="4" name="content" id="content" class="form-control"></textarea>
					</td>
					<td style="width:15%">
						<br />
						<p style="font-size:13px">작성자 : ${sNickName}</p>
						<p><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info btn-sm" /></p>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>	