<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>fileUpload1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function fCheck() {
			let fName = document.getElementById("file").value;
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase(); //확장자
			 // 1KByte=1024Byte=2^10Byte
			let maxSize = 1024 * 1024 * 10;  // 10Mb
			
			if(fName.trim() == "") {
				alert("업로드 하실 파일을 선택하세요.");
				return false;
			}
			
			// 파일이 업로드 되는지 확인해야 파일의 용량을 확인 할 수 있음 위에 선언하면 안됨
			let fileSize = document.getElementById("file").files[0].size;  // files (파일의 정보)
			if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'zip' && ext != 'hwp' && ext != 'ppt' && ext != 'pptx' && ext != 'xlsx') {
				alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/ppt/pptx/xlsx'만 가능합니다.");
			} else if(fileSize > maxSize) {
				alert("업로드 가능한 파일의 용량은 10MByte입니다.");
			} else {
				myform.submit();
			}
		}
		
		/* 선택된 그림 미리보기 */
		function imgCheck(e) {
			/* e.files : 해당 값에 파일이 있는지 확인 */
			if(e.files && e.files[0]) {
				/* 화면에 그림을 출력하기 위한 FileReader 객체 생성 */
			  let reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById("demo").src = e.target.result;
				}
				/* 해당 파일의 정보를 URL에 저장해 reader에 담아야 화면에 출력 가능 */
				reader.readAsDataURL(e.files[0]);
			} else {
					document.getElementById("demo").src = "";				
			}
		}
	</script>	
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
	<p><br /></p>
	<div class="container">
		<h2>파일 업로드 연습(싱글파일 처리)</h2>
		<p>COS라이브러리를 이용한 파일 업로드</p>
		<div>(http://www.servlets.com/cos/)</div>
		<hr />
		<form name="myform" method="post" action="fileUpload1Ok.st" enctype="multipart/form-data">
		<!-- multipart/form-data로 파일을 업로드 하면 파일명이 서버에 저장되어 보내지기 때문에 이름이 넘어가지 않음 -->
			파일명 : 
			<input type="file" name="fName" id="file" onchange="imgCheck(this)" class="form-control-file mb-3 border" />
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-success form-control mb-3" />
		</form>
		<!-- 이미지 한개는 img 태그로 출력 -->
		<img id="demo" width="200px" />
		<hr />
		<div><a href="fileDownload.st">다운로드로 이동하기</a></div>
	</div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>